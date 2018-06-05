//
//  ConnectionPool.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/18/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation
/*
public protocol Connection {
    
    /// The `QueryBuilder` with connection specific substitutions.
    var queryBuilder: QueryBuilder { get }
    
    /// Establish a connection with the database.
    ///
    /// - Parameter onCompletion: The function to be called when the connection is established.
    func connect(onCompletion: (QueryError?) -> ())
    
    /// Close the connection to the database.
    func closeConnection()
    
    /// An indication whether there is a connection to the database.
    var isConnected: Bool { get }
    
    /// Execute a query.
    ///
    /// - Parameter query: The query to execute.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    func execute(query: Query, onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Execute a raw query.
    ///
    /// - Parameter query: A String with the query to execute.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    func execute(_ raw: String, onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Execute a query with parameters.
    ///
    /// - Parameter query: The query to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    func execute(query: Query, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Execute a raw query with parameters.
    ///
    /// - Parameter query: A String with the query to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    func execute(_ raw: String, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Execute a query with parameters.
    ///
    /// - Parameter query: The query to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    func execute(query: Query, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Execute a raw query with parameters.
    ///
    /// - Parameter query: A String with the query to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    func execute(_ raw: String, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Prepare statement.
    ///
    /// - Parameter query: The query to prepare statement for.
    /// - Returns: The prepared statement.
    /// - Throws: QueryError.syntaxError if query build fails, or a database error if it fails to prepare statement.
    func prepareStatement(_ query: Query) throws -> PreparedStatement
    
    /// Prepare statement.
    ///
    /// - Parameter raw: A String with the query to prepare statement for.
    /// - Returns: The prepared statement.
    /// - Throws: QueryError.syntaxError if query build fails, or a database error if it fails to prepare statement.
    func prepareStatement(_ raw: String) throws -> PreparedStatement
    
    /// Execute a prepared statement.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    func execute(preparedStatement: PreparedStatement, onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Execute a prepared statement with parameters.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    func execute(preparedStatement: PreparedStatement, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Execute a prepared statement with parameters.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    func execute(preparedStatement: PreparedStatement, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Release a prepared statement.
    ///
    /// - Parameter preparedStatement: The prepared statement to release.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    func release(preparedStatement: PreparedStatement, onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Return a String representation of the query.
    ///
    /// - Parameter query: The query.
    /// - Returns: A String representation of the query.
    /// - Throws: QueryError.syntaxError if query build fails.
    func descriptionOf(query: Query) throws -> String
    
    /// Start a transaction.
    ///
    /// - Parameter onCompletion: The function to be called when the execution of start transaction command has completed.
    func startTransaction(onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Commit the current transaction.
    ///
    /// - Parameter onCompletion: The function to be called when the execution of commit transaction command has completed.
    func commit(onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Rollback the current transaction.
    ///
    /// - Parameter onCompletion: The function to be called when the execution of rolback transaction command has completed.
    func rollback(onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Create a savepoint.
    ///
    /// - Parameter savepoint: The name to  be given to the created savepoint.
    /// - Parameter onCompletion: The function to be called when the execution of create savepoint command has completed.
    func create(savepoint: String, onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Rollback the current transaction to the specified savepoint.
    ///
    /// - Parameter to savepoint: The name of the savepoint to rollback to.
    /// - Parameter onCompletion: The function to be called when the execution of rolback transaction command has completed.
    func rollback(to savepoint: String, onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Release a savepoint.
    ///
    /// - Parameter savepoint: The name of the savepoint to release.
    /// - Parameter onCompletion: The function to be called when the execution of release savepoint command has completed.
    func release(savepoint: String, onCompletion: @escaping ((QueryResult) -> ()))
}

public extension Connection {
    func execute(query: Query, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        do {
            let databaseQuery = try query.build(queryBuilder: queryBuilder)
            let (convertedQuery, namedToNumbered, count) = Utils.convertNamedParametersToNumbered(query: databaseQuery, queryBuilder: queryBuilder)
            var numberedParameters: [Any?] = Array(repeating: nil, count: count)
            for (parameterName, parameterValue) in parameters {
                if let numbers = namedToNumbered[parameterName] {
                    for number in numbers {
                        numberedParameters[number - 1] = parameterValue
                    }
                }
                else {
                    onCompletion(.error(QueryError.syntaxError("Failed to map parameters.")))
                }
            }
            execute(convertedQuery, parameters: numberedParameters, onCompletion: onCompletion)
        }
        catch  QueryError.syntaxError(let error) {
            onCompletion(.error(QueryError.syntaxError(error)))
        }
        catch {
            onCompletion(.error(QueryError.syntaxError("Failed to build the query.")))
        }
    }
}

public class ConnectionPool {
    
    private var pool = [Connection]()
    
    // A serial dispatch queue used to ensure thread safety when accessing the pool
    // (at time of writing, serial is the default, and cannot be explicitly specified).
    private var poolLock = DispatchSemaphore(value: 1)
    
    // A generator function for items in the pool, which allows future expansion.
    private let generator: () -> Connection?
    
    // A releaser function for connections in the pool.
    private let releaser: (Connection) -> ()
    
    // The maximum size of this pool.
    private let limit: Int
    
    // The initial size of this pool.
    private var capacity: Int
    
    // A semaphore to enable take() to block when the pool is empty.
    private var semaphore: DispatchSemaphore
    
    // A timeout value (in nanoseconds) to wait before returning nil from a take().
    private let timeoutNs: Int64
    private let timeout: Int
    
    /// Creates an instance of `ConnectionPool` containing `ConnectionPoolOptions.initialCapacity` connections.
    /// The `connectionGenerator` will be invoked `ConnectionPoolOptions.initialCapacity` times to fill
    /// the pool to the initial capacity.
    ///
    /// - Parameter options: `ConnectionPoolOptions` describing pool configuration.
    /// - Parameter connectionGenerator: A closure that returns a new connection for the pool.
    /// - Parameter connectionReleaser: A closure to be used to release a connection from the pool.
    public init(options: ConnectionPoolOptions, connectionGenerator: @escaping () -> Connection?, connectionReleaser: @escaping (Connection) -> ()) {
        capacity = options.initialCapacity
        if capacity < 1 {
            capacity = 1
        }
        limit = options.maxCapacity
        timeout = options.timeout
        timeoutNs = Int64(timeout) * 1000000  // Convert ms to ns
        generator = connectionGenerator
        releaser = connectionReleaser
        semaphore = DispatchSemaphore(value: capacity)
        for _ in 0 ..< capacity {
            if let item = generator() {
                pool.append(item)
            }
            else {} // TODO: Handle generation failure.
        }
    }
    
    deinit {
        disconnect()
    }
    
    /// Get a connection from the pool.
    /// This function will block until a connection can be obtained from the pool or for `ConnectionPoolOptions.timeout`.
    ///
    /// - Returns: A `Connection` or nil if the wait for a free connection timed out.
    public func getConnection() -> Connection? {
        if let connection = take() {
            return ConnectionPoolConnection(connection: connection, pool: self)
        }
        return nil
    }
    
    func release(connection: Connection) {
        give(connection)
    }
    
    /// Release all the connections in the pool by calling connectionReleaser closure on each connection,
    /// and empty the pool.
    public func disconnect() {
        release()
    }
    
    // Take an item from the pool. The item will not magically rejoin the pool when no longer
    // needed, so MUST later be returned to the pool with give() if it is to be reused.
    // Items can therefore be borrowed or permanently removed with this method.
    //
    // This function will block until an item can be obtained from the pool.
    private func take() -> Connection? {
        var item: Connection!
        // Indicate that we are going to take an item from the pool. The semaphore will
        // block if there are currently no items to take, until one is returned via give()
        let result = semaphore.wait(timeout: (timeout == 0) ? .distantFuture : .now() + DispatchTimeInterval.milliseconds(timeout))
        if result == DispatchTimeoutResult.timedOut {
            return nil
        }
        // We have permission to take an item - do so in a thread-safe way
        lockPoolLock()
        if (pool.count < 1) {
            unlockPoolLock()
            return nil
        }
        item = pool[0]
        pool.removeFirst()
        // If we took the last item, we can choose to grow the pool
        if (pool.count == 0 && capacity < limit) {
            capacity += 1
            if let newItem = generator() {
                pool.append(newItem)
                semaphore.signal()
            }
        }
        unlockPoolLock()
        return item
    }
    
    // Give an item back to the pool. Whilst this item would normally be one that was earlier
    // take()n from the pool, a new item could be added to the pool via this method.
    private func give(_ item: Connection) {
        lockPoolLock()
        pool.append(item)
        // Signal that an item is now available
        semaphore.signal()
        unlockPoolLock()
    }
    
    private func release() {
        lockPoolLock()
        for item in pool {
            releaser(item)
        }
        pool.removeAll()
        unlockPoolLock()
    }
    
    private func lockPoolLock() {
        _ = poolLock.wait(timeout: DispatchTime.distantFuture)
    }
    
    private func unlockPoolLock() {
        poolLock.signal()
    }
    
}
 */
