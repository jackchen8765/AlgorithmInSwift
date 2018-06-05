//
//  Graph.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/15/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation

public struct Vertex<T: Hashable>: Equatable, Hashable, CustomStringConvertible {
    var data: T
    
    public static func ==(lhs: Vertex, rhs: Vertex) ->Bool {
        return lhs.data == rhs.data
    }
    public var hashValue: Int {
        return data.hashValue
    }
    
    public var description: String {
        return "\(data)"
    }
}


public struct Edge<T:Hashable>: Equatable, Hashable{
    public var from: Vertex<T>
    public var to: Vertex<T>
    public var weight: Double?
    
    
    public static func ==(lhs: Edge, rhs: Edge) -> Bool {
        return lhs.from == rhs.from &&
                lhs.to == rhs.to &&
                lhs.weight == rhs.weight
    }
    
    public var hashValue: Int {
        return "\(from)\(to)\(weight ?? 0.0)".hashValue
    }
    
}

protocol Graphable : CustomStringConvertible {
    associatedtype Element: Hashable
    
    var description: String { get }
    
    func createVertex(data: Element) -> Vertex<Element>
    func addEdge(from: Vertex<Element>, to: Vertex<Element>, weight: Double?)
    func weight(from: Vertex<Element>, to: Vertex<Element>) -> Double?
    func edges(from: Vertex<Element>) -> [Edge<Element>]?
    
}

class AdjacencyList<T:Hashable> : Graphable{
    public typealias Element = T
    
    public var description: String {
        var result = ""
        for (vertex, edges) in dict {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString += "\(edge.to),"
                }
                else {
                    edgeString += "\(edge.to)"
                }
            }
            result += "\(vertex) ---> [ \(edgeString) ] \n"
        }
        
        return result
    }
    
    var dict: [Vertex<T>: [Edge<T>]] = [ : ]
   
    public func createVertex(data: T) -> Vertex<T> {
        let v =  Vertex<T>(data: data)
        if dict[v] == nil {
            dict[v] = []
        }
        return v
    }
    
    public func addEdge(from: Vertex<T>, to: Vertex<T>, weight: Double?) {
        let e = Edge(from: from, to: to, weight: weight)
        dict[from]?.append(e)
    }
    public func weight(from: Vertex<T>, to: Vertex<T>) -> Double? {
        guard let edges = dict[from] else {
            return nil
        }
        for edge in edges {
            if edge.to == to {
                return edge.weight
            }
        }
        return nil
    }
    public func edges(from: Vertex<T>) -> [Edge<T>]? {
        return dict[from]
    }
}
