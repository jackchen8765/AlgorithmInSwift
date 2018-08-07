//
//  ViewController.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/8/17.
//  Copyright © 2017 clz. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //testPivot()
        //testBST()
        //testStringExtension()
        //testArrayExtension()
        //testArray()
        

        /*
        // Do any additional setup after loading the view, typically from a nib.
        testMaxSumOfSubArray()
        testKnapSack()
        testLongestPalindromeSubstring()
        testSoduku()
        testRatInMaze()
        testKnightTour()
        testWordBreaking()
        testQueenProblem()
        testWordMatrix()
        testSubsetsOfSum()
        testStringPermutation()
        checkStringRotation()
        testPhonePads()
        testStringsOfNBits()
        testMinJumps()
        testBracketPairs()
        
        testHashTable()
        
        //testHeap()
        
        //testFizzBuzz()
        
        //testStringSearch()
        
        //testPrimes()
        
        //testURLShortener()
        
        //testGraph()
        
        //testSum()
        
        //testBitSet()
        
        //testShuffle()
        
        //testSortByLastName()
        
        //testHanoiTower()
        
        //testStairs()
        
        //testPriorityQueue()
        
        //testStringToInt()
        
        //testPivot()
        
        //testStockProfit()
        
        //testArray()
        
        //testRange()
        
        //testClosures()
        
        //testBits()
        
        testBST()
        
        testNumber2Words()
        
        testSumDigits()
        
        testEggDrop()
        
        testLRUCache()
        
        testRodProfits()
        
        testRopeCut()
        
        testCoinProblem()
        
        testConferenceRoom()
        
        testMatrix()
        
        testMaxSumOfSubArray()
        
        testArrayExtension()
        
        testStringExtension()
        
        testMissingTwoNumbers()
        testPalindrome()
        
        
        
        testDequ()
        
        testGCD()
        */
 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: Test
    
    func testKnapSack() {
        let weightValues: [(w: Int, v: Int)] = [ (30, 120), (20, 80), (10, 30), (5, 15), (40, 160)]
        print("naive: \(knapSackNaive(weightValues, 50))")
        
        print("dp: \(knapSackDP(weightValues, 50))")
    }
    
    func testLongestPalindromeSubstring() {
        let str = "bananasananabs"
        print(longestPalindromeSubstring(str))
    }
    
    func testSoduku() {
        let matrix = [
            [0,0,7,4,0,3,0,8,0],
            [0,0,0,0,2,0,4,7,1],
            [0,0,6,0,0,5,0,0,0],
            [3,0,1,0,0,8,0,0,0],
            [0,5,0,0,6,0,0,3,0],
            [0,0,0,3,0,0,5,0,2],
            [0,0,0,9,0,0,8,0,0],
            [7,8,9,0,3,0,0,0,0],
            [0,3,0,2,0,4,7,0,0]]
        /*
           [[5,0,0,0,0,1,3,0,0],
            [0,0,0,0,6,5,1,7,0],
            [0,0,0,4,0,0,0,2,5],
            [0,6,0,0,7,0,0,3,0],
            [0,7,5,0,0,0,6,8,0],
            [0,8,0,0,4,0,0,1,0],
            [8,2,0,0,0,6,0,0,0],
            [0,5,6,3,8,0,0,0,0],
            [0,0,1,7,0,0,0,0,3]] */
        
        if let solution = soduku(matrix) {
            for row in solution {
                print(row)
            }
        }
    }
    
    func testRatInMaze() {
        let maze = [ [1,1,1,0,0,0,0],
                     [1,0,1,0,1,1,1],
                     [1,0,1,1,1,0,1],
                     [1,0,0,0,0,1,1],
                     [1,0,0,0,1,1,0],
                     [1,1,1,1,0,1,1],
                     [1,0,1,0,0,0,1]]
        print("maze:")
        for row in maze {
            print(row)
        }
        print("Solution:")
        if let path = ratPath(in: maze) {
            for row in path {
                print(row)
            }
        }
        else {
            print("no path out")
        }
    }
    
    func testKnightTour() {
        if let tour = knightTourPostions() {
            for row in tour {
                print(row.map{String(format: "%02d", $0)})
            }
        }
    }
    
    func testWordBreaking() {
        let words: Set<String> = ["I", "have", "a", "book", "read", "ocean", "Sam", "am", "rain", "look", "do"]
        let str = "Idoreadabook"
        if let found = wordBreakNaive(str, words) {
            print(found)
        }
        else {
            print("\(str) not breakable")
        }
        
        if let dpFound = wordBreakDP(str, words) {
            print(dpFound)
        }
    }
    
    func testQueenProblem() {
        let n = 8
        let positions = queenPositions(n)
        for row in positions {
            print(row)
        }
        
    }
    
    func testWordMatrix() {
        let matrix : [[Character]] = [ ["t", "o", "w", "c", "d" ],
                                       ["a", "h", "n", "z", "x" ],
                                       ["h", "w", "o", "i", "o" ],
                                       ["o", "r", "n", "r", "n" ],
                                       ["a", "b", "r", "i", "n" ] ]
        for m in matrix {
            print(m)
        }
        
        let word = "horizon"
        if let found = find(word: word, in: matrix) {
            for row in found {
                print(row)
            }
        }
        else {
            print("\(word) not found")
        }
    }
    
    func testSubsetsOfSum() {
        let n = 4
        printAllSubsets(of: n)
        print(allSubsets(of: n))
        
        let a = [2, 10, 6, 8, 4]
        let sum = 16
        let count = countSubsetsOfSum(a, 16)
        print("\(count)subsets whose sum is \(sum) " )
    }
    
    func testStringPermutation() {
        let str = "abcd"
        let perms = permutations(str)
        print(perms)
    }
    
    func checkStringRotation() {
        let str1 = "aiwotmocz"
        let str2 = "tmoczaiwo"
        if isRotated(str1, str2) {
            print("\(str1) is rotation of \(str2)")
        }
        else {
            print("\(str1) is not rotation of \(str2)")
        }
    }
    
    func testPhonePads() {
        let phoneNumbers = [2,3,4]
        printLettersOfPhoneNumbers(phoneNumbers)
    }
    
    func testStringsOfNBits() {
        let n = 3
        
        printStringsOfNBits(n)
    }
    
    func testMinJumps() {
        let array = [1, 3, 5, 3, 3,1,1,6,1,1,1,1,1,4]
        var mem = [Int: Int]()
        let min = findMinJumps(array, startIndex: 0, &mem)
        print("The minimum number of jumps is \(min)")
    }
    
    func testBracketPairs() {
        let n = 4
        printBracketPairs(of: n)
    }
    
    func testNumber2Words() {
        let n: UInt = 6_110_112_054_103_708_583
        print(number2Words(n))
    }
    
    func testSumDigits() {
        let n = 34567
        print(sumOfDigits(n))
    }
    
    func testEggDrop() {
        for egg in 1..<5 {
            for floor in 1..<18 {
                print("dropping \(egg) eggs from \(floor) floors takes \(eggDrop(numberOfEggs: egg, numberOfFloors: floor)) tries")
            }
        }
    }
    
    
    func testLRUCache() {
        let cache = LRUCache<Int, String>(capacity: 3)
        cache.setValue("One", for: 1)
        cache.setValue("Two", for: 2)
        cache.setValue("Three", for: 3)
        cache.getValue(for: 2)
        cache.getValue(for: 4)
        cache.setValue("Five", for: 5)
        cache.setValue("Four", for: 4)
    }
    
    
    /*
        Length    1    2    3    4    5     6     7     8     9     10
        Price     1    5    8    9    10    17    17    20    24    30
     */
    func testRodProfits() {

        let prices:[Double] = [1.0, 5.0, 8.0, 9.0, 10.0, 17.0, 17.0, 20.0, 24.0, 30.0]
        let length = 7
        
        print("Max profit of rod with lenth of \(length) is \(maxProfitsOfCuts(prices, rodLen: length))")
    }
    
    func testRopeCut() {
        for len in 2..<13 {
            print("production of cuts for rope length \(len) is \(maxProductionOfCuts(len))")
        }
    }
    
    
    func testCoinProblem() {
        let coins = [1, 2, 5, 10]
        let value = 9
        print("\(countOfWayUsingCoins(coins, value: value)) of coin combinations")
        
        print("\(minNumberOfCoins(coins, value: value)) coins are needed.")
    }
    
    func testConferenceRoom() {
        let meetings: [(startTime: Double, endTime: Double)] = [(8.0, 9.0), (1.0, 4.0), (5.0, 6.0), (2.0, 6.0)]
        
        let scheduledMeetings = maxMeetings(meetings)
        for meeting in scheduledMeetings {
            print("meetings: \(meeting)")
        }
        
        print("mininum \(minRooms(meetings)) rooms needed.")
        
    }
    
    func testMatrix() {
        for i in 1..<5 {
            let count = countOfPaths(rows: i, cols: i)
            print("there are \(count) paths to reach \(i)x\(i)")
        }
        
        let matrix = [
            [1,   1,  1],
            [1,   1,  1],
            [1,  -1,  1]]
        let count = countOfPaths(for: matrix)
        print("there are \(count) paths to reach point(\(matrix.count),\(matrix[0].count))")
    }
    
    func testMaxSumOfSubArray() {
        let numbers = [1, 2, -1, 3, 5, -3, 6]// [-2, 1, -3, 4, -1, 2, 1, -5, 4]
        print("max sum is \(maxSumOfSubArray(numbers))")
    }
    
    func testArrayExtension() {
        let nums = [1,8,3,5,7]
        print(nums.allSubArray())
        let strings = ["I", "like", "you"]
        print(strings.allSubArray())
    }
    
    func testStringExtension() {
        let numbers = "-2532"
        if let i = numbers.toInt() {
            print("numbers is \(i)")
        }
        
        let strings = "abcd"
        print(strings.allSubStrings())
    }
    
    func testMissingTwoNumbers() {
        let num1 = [1, 3, 4, 6, 7, 8]
        let num2: [Int] = []
        let num3 = [3]
        let num4 = [1,2,3,4,6,7]
        let m1 = findTwoMissingNumbers(num1)
        print("Missing: \(m1.0), \(m1.1)")
        let m2 = findTwoMissingNumbers(num2)
        print("Missing: \(m2.0), \(m2.1)")
        let m3 = findTwoMissingNumbers(num3)
        print("Missing: \(m3.0), \(m3.1)")
        let m4 = findTwoMissingNumbers(num4)
        print("Missing: \(m4.0), \(m4.1)")
    }
    
    func testPalindrome() {
        let strings = ["abcdcba", "sksfkgslg", "ilmnggnmli"]
        for s in strings {
            if s.isPalindrom() {
                print("\(s) is a palindrome")
            }
            else {
                print("\(s) is NOT a palindrome")
            }
        }
        
    }
    
    func testHanoiTower() {
        print("Move 2 disks")
        hanoiTower(2, source: "A", aux: "B", dest: "C")
        print("Move 3 disks")
        hanoiTower(3, source: "A", aux: "B", dest: "C")
        print("Move 4 disks")
        hanoiTower(4, source: "A", aux: "B", dest: "C")
        
    }
    
    
    func testStairs() {
        var mem: [Int] = Array(repeating: 0, count: 10) // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        for i in 1..<mem.count {
            print("ways of \(i) stairs: \(possibleStairWays(i, &mem))")
        }
    }
    
    func testSortByLastName() {
        let names = ["Jack Chen", "Apple Apple", "Tom Hanks", "Jerry John", "Sam Adams", "Tony Battsy", "John"]
        print("sorted by last Name: \(sortByLastName(names))")
    }
    
    func testBits() {
        let count = BitSet.setBitsCount(7 << 3)
        print(count)
    }
    
    func testDequ() {
        var deq = Deque<String>()
        var anotherDeq = Deque<String>()
        
        deq.enqueueAtFront("c")
        deq.enqueueAtFront("b")
        deq.enqueueAtFront("a")
        deq.enqueueAtBack("d")
        deq.enqueueAtBack("e")
        deq.enqueueAtBack("f")
        
        
        
        //at this momement the deq has ["a","b","c","d","e","f"]
        while let element = deq.dequeueAtBack() {
            print(element) //should print "f","e","d","c","b","a"
            anotherDeq.enqueueAtFront(element)
        }
        print("\n")
        
        //at this momement the anotherDeq has ["a","b","c","d","e","f"]
        while let element = anotherDeq.dequeueAtFront() {
            print(element) //should print "a","b","c","d","e","f"
        }

    }
    
    func testShuffle() {
        var a = [1, 2, 3, 4, 5, 6, 7, 8]
        a.shuffle()
        print(a)
    }
    
    func testHashTable() {
        var hashTable = HashTable<String, String>(capacity: 13)
        hashTable["lastName"] = "Hanks"
        hashTable["firstName"] = "Tom"
        hashTable["Career"] = "Actor"
        
        if let lastName = hashTable["lastName"] {
            print("old lastName: \(lastName)")
            _ = hashTable.updateValue("Jerry", forKey: "lastName")
            print("new lastName: \(hashTable["lastName"]!)")
        }
        
    }
    
    func testFizzBuzz() {
        func fizzBuzz(_ numberOfTurns: Int) {
            for i in 1...numberOfTurns {
                var result = ""
                
                if i % 3 == 0 {
                    result += "Fizz"
                }
                
                if i % 5 == 0 {
                    result += (result.isEmpty ? "" : " ") + "Buzz"
                }
                
                if result.isEmpty {
                    result += "\(i)"
                }
                
                print(result)
            }
        }
        fizzBuzz(20)
    }
    
    
    func testBitSet() {
        var bits = BitSet(size: 150)
        bits[22] = true
        bits[99] = true
        print(bits)
        
    }
    
    func testStringSearch() {
        let myString = "Hello world"
        if let i = myString.indexOf("world") {
            print(i)
        }
    }
    
    
    
    func testSum() {
        let myArray =  [3, 2, 10, 5, 43, 57, 23, 12, 90, 86, 52, 100]
        let mySorted = [2, 4, 5, 10, 12, 23, 43, 52, 57, 86, 90, 100]
        
        if let (i, j) = twoSum(myArray, 95) {
            print("( \(i), \(j) )")
        }
        
        if let (i, j) = twoSortedSum(mySorted, 95) {
            print("( \(i), \(j) )")
        }
        
        let sum = threeSum(myArray, target: 105)
        print(sum)
    
    }
    
    func testClosures() {
        class SimpleClass {
            var value: Int = 0
        }
        var x = SimpleClass()
        var y = SimpleClass()
        let closure = { [x] in
            print(x.value, y.value)
        }
        
        closure()
        x.value = 10
        y.value = 13
        closure()

    }
    
    func testPrimes() {
        let n = 1097 //446185740
        let primes = firstPrimes(n)
        if isPrime(n) {
            print("\(n) is a prime")
            print(primes)
        }
        
    }
    
    func testStockProfit() {
        let prices: [Double] = [200.0, 500.0, 1000.0, 700.0, 30.0, 400.0, 900.0, 400.0, 50.0]
        if let profit = maxProfit(prices) {
            print("profit: \(profit.profit), buyDateIndex: \(profit.buyDateIndex), sellDateIndex: \(profit.sellDateIndex)")
        }
        
    }
    
    func testArray() {
        let numbers = [1, 2, 3, 4]
        print("\(numbers.powerset)")
    }
    
    func testHeap() {
        var heap = Heap(elements: [4, 2, 10, 5, 43, 57, 23, 12, 90, 86, 52, 100], priorityFunction:  > )
        /*heap.enqueue(10)
        heap.enqueue(15)
        heap.enqueue(5)
        heap.enqueue(20)
        heap.enqueue(9)
        heap.enqueue(100)
        heap.enqueue(35) */
        while !heap.isEmpty {
            if let item = heap.dequeue() {
                print(item)
            }
        }
    }
    
    func testURLShortener() {
        var shortener = URLShortener(domainName: "http://shor.ty/")
        
        _ = shortener.shortenFast("http://www.apple.com")
        _ = shortener.shortenFast("http://www.safeway.com")
        _ = shortener.shortenFast("http://www.badurl.com/list1")

        
        
        shortener.addBlackList("http://www.badurl.com/list1")
        shortener.addBlackList("http://www.badurl.com/list2")
        shortener.addBlackList("http://www.badurl.com/list3")
        shortener.addBlackList("http://www.badurl.com/list4")
        
        if let appleUrl =  shortener.expandFast("http://shor.ty/0") {
            print(appleUrl)
        }
        
        let url2Check = "http://shor.ty/1"
        if let expanded = shortener.expandFast(url2Check) {
            if !shortener.isSecure(url2Check) {
                print("\(expanded) is a unsafe url")
            }
            else {
                print("\(expanded) is a safe url")
            }
        }
    }
    
    func testRange() {
        let range1: Range = Range<Int>(5...18)
        let range2: Range = Range<Int>(3...15)
        print(range1.intersect(range2))
    }
    
    func testBST() {

        let array = [2, 4, 6, 8, 9, 10, 13, 15, 17, 18, 19, 21, 25]
        let tree = BinarySearchTree<Int>.createBST(from: array)!
        let tree1 = BinarySearchTree<Int>.createBST(from: array)!
        let tree2 = BinarySearchTree<Int>.createBST(from: array)!
        
        if tree.isBalanced() {
            print("tree is balanced")
        }
        else {
            print("tree is not balaced")
        }
        
        var path = [BinarySearchTree<Int>]()
        tree.traverseAllRoot2LeafPaths(&path){ nodes in
            var str = "["
            for (index, node) in nodes.enumerated() {
                str += index == 0 ? "\(node.value)" : "->\(node.value)"
            }
            str += "]"
            print(str)
        }
        
        print(tree.toArray())

        var sum = 0
        transformToGreaterSumTree(tree1, &sum)
        print("greater sum tree")
        print(tree1)
        
        let _ = transformToSumTree(tree2)
        print("sum tree")
        print(tree2)
        
        print("traverse boundary anti-clockwise")
        tree.traverseBounaryAntiClockWise() { print($0) }
        
        print("breadth first traverse")
        tree.traverseBreadthFirst() { print($0) }
        
        if let node = tree.leastCommonAncestor(4, 8) {
            print("lease common ancestor: \(node.value)")
        }
        
        print("traverse in level order")
        tree.traverseLevelOrder{ print($0) }
        
        
        
        print("traverse preorder")
        tree.traversePreOrder() { print($0) }
        print("traverse preorder interatively")
        tree.traversePreOrderInteratively() { print($0) }
        
        print("all left leaves: \(tree.allLeftLeaves())")
        print("all left leaves iteratively: \(tree.allLeftLeavesIteratively())")
        
        
        print("traverse in order")
        tree.traverseInOrder() { print($0) }
        
        let mirror = tree.createMirror()
        print("traverse mirror in order")
        mirror.traverseInOrder{ print($0) }
        if !mirror.isValidBST(Int.min, Int.max) {
            print("a mirror of BST is not a valid BST")
        }
        if tree.isMirror(of: mirror) {
            print("a mirror of BST is its mirror")
        }
        
        print("traverse in order with stack")
        tree.traverseInOrderWithStack() { print($0) }
        
        print("traverse in order interatively")
        tree.traverseInOrderInteratively() { print($0) }
        
        print("traverse post order")
        tree.traversePostOrder()  { print($0) }
        
        print("traverse post order interatively")
        tree.traversePostOrderIteratively() { print($0) }
        
        
        print("tree height: \(tree.height())")
        print("minHeight: \(tree.minimumDepth())")
        let heightAndDiameter = tree.heightAndDiameter()
        print("height:\(heightAndDiameter.height) diameter: \(heightAndDiameter.diameter)")
        print("total number of nodes \(tree.count)")
    
        if let node = tree.searchIteratively(13) {
            /*
            if let pre = node.predecessor() {
                print(pre.value)
                pre.remove()
            }*/
            node.insert(100)
            if !tree.isValidBST(Int.min, Int.max) {
                print("tree becomes invalid")
            }
        }
        
    }
    
    
    
    func testPivot() {
    
        let nums = [1, 5, 9, 13, 13, 15,15, 34,66,60]
        
        if let pivot = indexFromAscendingToDescending(nums) {
            print("pivot: \(pivot) :\(nums[pivot])")
        }
        else {
            print("no pivot")
        }
        print("done")
    }
    
    func testGCD() {
        let a = 64, b = -24
        let g = gcd(a, b)
        print(g)
    }
    
    func testStringToInt() {
        let s = "123799abc"
        let v = str2Int(s, 16)
    }
    
    func testStack() {
        var myStack : Stack<Int> = [ 5, 6, 3, 6]
        
        myStack.push(8)
        myStack.pop()
        myStack.pop()
        
        print(myStack)
    }
    
    func testMergeSort() {
        var myArray = [4, 2, 10, 5, 43, 57, 23, 12, 90, 86, 52, 100]
        mergeSort(&myArray)
    }
    
    func testGraph() {
        let adjacencyList = AdjacencyList<String>()
        
        let singapore = adjacencyList.createVertex(data: "Singapore")
        let tokyo = adjacencyList.createVertex(data: "Tokyo")
        let hongKong = adjacencyList.createVertex(data: "Hong Kong")
        let detroit = adjacencyList.createVertex(data: "Detroit")
        let sanFrancisco = adjacencyList.createVertex(data: "San Francisco")
        let washingtonDC = adjacencyList.createVertex(data: "Washington DC")
        let austinTexas = adjacencyList.createVertex(data: "Austin Texas")
        let seattle = adjacencyList.createVertex(data: "Seattle")
        
        adjacencyList.addEdge(from: singapore, to: hongKong, weight: 300)
        adjacencyList.addEdge(from: singapore, to: tokyo, weight: 500)
        adjacencyList.addEdge(from: hongKong, to: tokyo, weight: 250)
        adjacencyList.addEdge(from: tokyo, to: detroit, weight: 450)
        adjacencyList.addEdge(from: tokyo, to: washingtonDC, weight: 300)
        adjacencyList.addEdge(from: hongKong, to: sanFrancisco, weight: 600)
        adjacencyList.addEdge(from: detroit, to: austinTexas, weight: 50)
        adjacencyList.addEdge(from: austinTexas, to: washingtonDC, weight: 292)
        adjacencyList.addEdge(from: sanFrancisco, to: washingtonDC, weight: 337)
        adjacencyList.addEdge(from: washingtonDC, to: seattle, weight: 277)
        adjacencyList.addEdge(from: sanFrancisco, to: seattle, weight: 218)
        adjacencyList.addEdge(from: austinTexas, to: sanFrancisco, weight: 297)
        
        
        print(adjacencyList)

        print(adjacencyList.weight(from: singapore, to: seattle))
    }
    
    func testPriorityQueue() {
        var heap = PriorityQueue<String>(ascending: false, startingValues: ["tao", "ming", "zack", "tom", "winnie", "jack"])
        print(heap.peek()!)
        print(heap.pop()!)
        
        for x in heap {
            print(x)
        }
        
        let y = heap[4]
        print(y)
    }

}

