//
//  BinarySearchTree.swift
//  
//
//  Created by Liangzan Chen on 11/4/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation



public class BinarySearchTree<T:Comparable> : CustomStringConvertible, Equatable {
    var value: T
    weak var parent: BinarySearchTree?
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    
    
    public static func ==(lhs: BinarySearchTree, rhs: BinarySearchTree) -> Bool {
        return (lhs === rhs)
    }
    
    public var description: String {
        var s = ""
        
        if let left = left {
            s += "(\(left.description)) <-"
        }
        s += "\(value)"
        if let right = right {
            s += "->(\(right.description))"
        }
        return s
    }
    
    public init(value: T) {
        self.value = value
    }
    
    public convenience init(_ array: [T]) {
        precondition(array.count > 0)
        
        self.init(value: array[0])
        
        for v in array.dropFirst() {
            self.insert(v)
        }
    }
    /*
    private static func creatTree(_ array: [T], _ start: Int, _ end: Int) -> BinarySearchTree<T>? {
        guard start <= end else {
            return nil
        }
        let mid = (start + end)/2
        let tree = BinarySearchTree<T>(value: array[mid])
        tree.left = creatTree(array, start, mid - 1)
        tree.right = creatTree(array, mid + 1, end)
        return tree
    } */
    
    public static func createBST(from sortedArray: [T]) -> BinarySearchTree<T>? {
        guard sortedArray.count > 0 else {
            return nil
        }
        
        func creatTree(_ array: [T], _ start: Int, _ end: Int) -> BinarySearchTree<T>? {
            guard start <= end else {
                return nil
            }
            let mid = (start + end)/2
            let tree = BinarySearchTree<T>(value: array[mid])
            tree.left = creatTree(array, start, mid - 1)
            tree.right = creatTree(array, mid + 1, end)
            return tree
        }

        return creatTree(sortedArray, 0, sortedArray.count - 1)
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    public func isValidBST(_ minValue: T, _ maxValue: T) -> Bool {
        if value < minValue || value > maxValue {
            return false
        }
        
        let isLeftValid = left?.isValidBST(minValue, value) ?? true
        let isRightValid = right?.isValidBST(value, maxValue) ?? true
        return isLeftValid && isRightValid
    }
    
    public func isMirror(of tree: BinarySearchTree<T>) -> Bool {
        if self.value != tree.value {
            return false
        }
        
        if (left == nil && tree.right != nil) || (left != nil && tree.right == nil){
            return false;
        }
        
        if (right == nil && tree.left != nil) || (right != nil && tree.left == nil) {
            return false
        }
        
        var isLeftMirror = false
        if  left == nil && tree.right == nil {
            isLeftMirror = true
        }
        else {
            isLeftMirror = left!.isMirror(of: tree.right!)
        }
        
        var isRightMirror = false
        if right == nil && tree.left == nil {
            isRightMirror = true
        }
        else {
            isRightMirror = right!.isMirror(of: tree.left!)
        }
        
        return isLeftMirror && isRightMirror
    }
    
    public func createMirror() -> BinarySearchTree<T> {
        let node = BinarySearchTree<T>(value: self.value)
        if let left = left {
            let rightNode = left.createMirror()
            rightNode.parent = node
            node.right = rightNode
        }
        
        if let right = right {
            let leftNode = right.createMirror()
            leftNode.parent = node
            node.left = leftNode
        }
        return node
    }
    
    public func insert(_ element: T) {
        if element < self.value {
            if let left = left {
                left.insert(element)
            }
            else {
                left = BinarySearchTree<T>(value: element)
                left?.parent = self
            }
        }
        else if element > self.value {
            if let right = right {
                right.insert(element)
            }
            else {
                right = BinarySearchTree<T>(value: element)
                right?.parent = self
            }
        }
    }
    
    public func search(_ element: T) -> BinarySearchTree<T>? {
        if self.value == element {
            return self
        }
        else if element < self.value {
            return left?.search(element)
        }
        else {
            return right?.search(element)
        }
    }
    
    public func searchIteratively(_ element: T) -> BinarySearchTree<T>? {
        var curr: BinarySearchTree<T>?
        curr = self
        while let node = curr {
            if node.value == element {
                return node
            }
            else if node.value > element {
                curr = node.left
            }
            else {
                curr = node.right
            }
        }
        return nil
    }
    
    public func traverseInOrder(_ process: (T) ->Void) {
        left?.traverseInOrder(process)
        process(value)
        right?.traverseInOrder(process)
    }
    
    public func traversePreOrder(_ process: (T) ->Void) {
        process(value)
        left?.traversePreOrder(process)
        right?.traversePreOrder(process)
    }
    
    
    public func traversePostOrder(_ process: (T) ->Void) {
        left?.traversePostOrder(process)
        right?.traversePostOrder(process)
        process(value)
    }
    
    public func traverseAllRoot2LeafPaths(_ path:  inout [BinarySearchTree], _ process: ([BinarySearchTree])->Void) {
        path.append(self)
        if isLeaf {
            process(path)
        }
        else {
            left?.traverseAllRoot2LeafPaths(&path, process)
            right?.traverseAllRoot2LeafPaths(&path, process)
        }
        path.removeLast()
    }
    
    public func leastCommonAncestor(_ value1: T, _ value2: T) -> BinarySearchTree? {
        if self.value > value1 && self.value > value2 {
            return left?.leastCommonAncestor(value1, value2)
        }
        else if (value1 > self.value && value2 > self.value) {
            return right?.leastCommonAncestor(value1, value2)
        }
        else {
            return self
        }
    }
    
    public func traversePreOrderInteratively(_ process: (T) -> Void) {
        var nodeStack = Stack<BinarySearchTree<T>>()
        
        nodeStack.push(self)
        while !nodeStack.isEmpty {
            let node = nodeStack.pop()!
            process(node.value)
            if let right = node.right {
                nodeStack.push(right)
            }
            if let left = node.left {
                nodeStack.push(left)
            }
        }
    }
    
    public func traverseInOrderWithStack( _ process: (T) -> Void) {
        var root: BinarySearchTree<T>?
        var stack = Stack<BinarySearchTree>()
        
        root = self
        
        while true {
            while let node = root {
                stack.push(node)
                root = node.left
            }
            if stack.isEmpty {
                return
            }
            let curr = stack.pop()!
            process(curr.value)
            root = curr.right
        }
    }
    
    public func traverseInOrderInteratively(_ process: (T) -> Void) {
        var root: BinarySearchTree<T>?
        var leftDone = false
        root = self
        while root != nil {
            if !leftDone {
                while let left = root!.left {
                    root = left
                }
            }
            
            process(root!.value)
            
            leftDone = true
            
            if root!.right != nil {
                leftDone = false
                root = root!.right
            }
            
            else if root!.parent != nil {
                while let parent = root!.parent, root === parent.right {
                    root = parent
                }
                if root!.parent == nil {
                    break;
                }
                root = root!.parent
            }
            else {
                break;
            }
        }
    }
    
    public func traversePostOrderIteratively(_ process: (T) -> Void) {
        var stack1 = Stack<BinarySearchTree<T>>()
        var stack2 = Stack<BinarySearchTree<T>>()
        
        stack1.push(self)
        while !stack1.isEmpty {
            let node = stack1.pop()!
            stack2.push(node)
            
            if let left = node.left {
                stack1.push(left)
            }
            if let right = node.right {
                stack1.push(right)
            }
        }
        
        while !stack2.isEmpty {
            let node = stack2.pop()!
            process(node.value)
        }
    }
    
    public func traverseBreadthFirst(_ process: ([T]) -> Void) {
        let level = height()
        for i in 0...level {
            traverseByLevel(i, process)
        }
    }
    
    private func traverseByLevel(_ level: Int, _ process: ([T]) -> Void) {
        if level == 0 {
            process([value])
        }
        else if level > 0 {
            left?.traverseByLevel(level - 1, process)
            right? .traverseByLevel(level - 1, process)
        }
    }
    
    public func traverseLevelOrder(_ process: ([T]) -> Void) {
        let queue = LinkedListQueue<BinarySearchTree>()
        
        queue.enque(self)
        
        while !queue.isEmpty {
            var values : [T] = []
            for _ in 0..<queue.size {
                let node = queue.dequeue()
                values.append(node!.value)
                if let left = node!.left {
                    queue.enque(left)
                }
                if let right = node!.right {
                    queue.enque(right)
                }
            }
            process(values)
        }
    }
    

    
    
    public func traverseBounaryAntiClockWise(_ process: (T) -> Void) {
        process(value)
        
        left?.traverseLeftBoundaryTopDown(process)
        
        left?.traverseLeavesLeftRight(process)
        right?.traverseLeavesLeftRight(process)
        
        right?.traverseRightBoundaryBottomUp(process)
    }
    
    private func traverseLeftBoundaryTopDown(_ process: (T) -> Void) {
        if let left = left {
            process(value)
            left.traverseLeftBoundaryTopDown(process)
        }
        else if let right = right {
            process(value)
            right.traverseLeftBoundaryTopDown(process)
        }
        
        //skip the leaf node to avoid duplication with traverseLeavesLeftRight(:)
    }
    
    private func traverseLeavesLeftRight(_ process: (T) -> Void) {
        left?.traverseLeavesLeftRight(process)
        if isLeaf {
            process(value)
        }
        right?.traverseLeavesLeftRight(process)
    }
    
    private func traverseRightBoundaryBottomUp(_ process: (T) -> Void) {
        if let right = right {
            right.traverseRightBoundaryBottomUp(process)
            process(value)
        }
        else if let left = left {
            left.traverseRightBoundaryBottomUp(process)
            process(value)
        }
        //skip the leaf node to avoid duplication with traverseLeavesLeftRight(:)
    }
    
    public func map(_ formula: (T)->T) -> [T] {
        var a = [T]()
        if let left = left {
            a += left.map(formula)
        }
        
        a.append(formula(value))
        
        if let right = right {
            a += right.map(formula)
        }
        
        return a
    }
    
    public func toArray() -> [T] {
        var a = [T]()
        if let left = left {
            a += left.toArray()
        }
        
        a.append(value)
        
        if let right = right {
            a += right.toArray()
        }
        
        return a
    }
    
    public func isBalanced() -> Bool {
        if isLeaf {
            return true
        }
        else {
            let isLeftBalanced = left?.isBalanced() ?? true
            let isRightBalaced = right?.isBalanced() ?? true
            let leftHeight: Int = left?.height() ?? 0
            let rightHeight: Int = right?.height() ?? 0
            return isLeftBalanced && isRightBalaced && (abs(leftHeight - rightHeight) < 2)
        }
    }
    
    public func height() -> Int {
        if isLeaf {
            return 0
        }
        else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    public func minimumDepth() -> Int {
        if let left = left, let right = right {
            return 1 + min(left.minimumDepth(), right.minimumDepth())
        }
        else {
            return 0
        }
    }
    
    public func heightAndDiameter() -> (height:Int, diameter: Int) {
        if isLeaf {
            return (0,0)
        }
        else if left == nil {
            let heightAndDiameter = right!.heightAndDiameter()
            let height = heightAndDiameter.height + 1
            return (height, max(height, heightAndDiameter.diameter))
        }
        else if right == nil {
            let heightAndDiameter = left!.heightAndDiameter()
            let height = heightAndDiameter.height + 1
            return (height, max(height, heightAndDiameter.diameter))
        }
        else {
            let leftHD = left!.heightAndDiameter()
            let rightHD = right!.heightAndDiameter()
            let height = max(leftHD.height, rightHD.height) + 1
            let rootDiameter = left!.height() + 1 + right!.height() + 1
            let maxLRDiameter = max(leftHD.diameter, rightHD.diameter)
            return (height, max(rootDiameter, maxLRDiameter))
        }
    }
    
    public func depth() -> Int {
        var node = self
        var edges = 0
        
        while let parent = node.parent {
            node = parent
            edges += 1
        }
        return edges
    }
    
    public func minimum() -> BinarySearchTree<T> {
        var node = self
        
        while let next = node.left {
            node = next
        }
        return node
    }
    
    public func maximum() -> BinarySearchTree<T> {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    
    
    public func allLeftLeaves() -> [T] {
        var leftLeaves = [T]()
        if isLeaf && self === self.parent?.left {
            leftLeaves.append(value)
        }
        
        if let left = left {
            leftLeaves += left.allLeftLeaves()
        }
        
        if let right = right {
            leftLeaves += right.allLeftLeaves()
        }
        return leftLeaves
    }
    
    public func allLeftLeavesIteratively()-> [T] {
        var leftLeaves = [T]()
        var stack = Stack<BinarySearchTree>()
        var root: BinarySearchTree<T>?
    
        root = self
        
        while true {
            while let node = root {
                stack.push(node)
                root = node.left
            }
            
            if stack.isEmpty {
                return leftLeaves
            }
            
            let curr = stack.pop()!
            if curr.isLeaf && curr.parent?.left === curr {
                leftLeaves.append(curr.value)
            }
            root = curr.right
        }
    }
    
    public func remove(){
        var replacement: BinarySearchTree?
        
        if let left = left, let _ = right {
            replacement = left.maximum()
            value = replacement!.value
            replacement!.remove()
            return
        }
            
        else if left == nil {
            replacement = right
        }
        else if right == nil {
            replacement = left
        }
        
        self.reconnectParentTo(node: replacement)
        
        parent = nil
        left = nil
        right = nil
    }
    
    
    public func predecessor() -> BinarySearchTree<T>? {
        if let left = left {
            return left.maximum()
        }
        else {
            var node = self
            
            while let parent = node.parent {
                if parent.value < node.value {
                    return parent
                }
                node = parent
            }
            return nil
        }
    }
    
    public func successor() -> BinarySearchTree<T>? {
        if let right = right {
            return right.minimum()
        }
        else {
            var node = self
            
            while let parent = node.parent {
                if parent.value > node.value {
                    return parent
                }
                node = parent
            }
            return nil
        }
    }
    
    private func reconnectParentTo(node: BinarySearchTree?) {
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
    
    
}

typealias IntBinarySearchTree = BinarySearchTree<Int>
/*
 Greater sum tree is a tree in which every node contains the sum of all the nodes which are greater than the node.
 
 */
func transformToGreaterSumTree(_ tree: IntBinarySearchTree?, _ sum: inout Int) {
    if let tree = tree {
        transformToGreaterSumTree(tree.right, &sum)
        sum += tree.value
        tree.value = sum - tree.value
        transformToGreaterSumTree(tree.left, &sum)
    }
}

/*
 Sum tree of a binary tree, is a tree where each node in the converted tree will contains the sum of the left and right sub trees in the original tree
 */
func transformToSumTree(_ tree: IntBinarySearchTree?) -> Int {
    if let tree = tree {
        let leftSum = transformToSumTree(tree.left)
        let rightSum = transformToSumTree(tree.right)
        let sum = tree.value + leftSum + rightSum
        tree.value = leftSum + rightSum
        return sum
    }
    return 0
}
