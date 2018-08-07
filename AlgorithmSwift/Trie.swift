//
//  Trie.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 7/24/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

class TrieNode<T: Hashable> {
    var value: T?
    weak var parent: TrieNode?
    var children: [T: TrieNode] = [:]
    var isTerminating = false
    var isLeaf: Bool {
        return children.count == 0
    }
    
    init(value: T? = nil, parent: TrieNode? = nil) {
        self.value = value
        self.parent = parent
    }
    
    func add(_ value: T) {
        guard children[value] == nil else {
            return
        }
        
        children[value] = TrieNode(value: value, parent: self)
    }
}

class Trie {
    typealias Node = TrieNode<Character>
    let root = Node()
    private var wordCount = 0

    public var count: Int {
        return wordCount
    }
    
    public var isEmpty: Bool {
        return wordCount == 0
    }
    
    public var words: [String] {
        return wordsInSubTrie(root, partialWord: "")
    }
    
    public func insert(_ word: String) {
        guard !word.isEmpty else {
            return
        }
        var curr = root
    
        for c in word.lowercased() {
            if let child = curr.children[c] {
                curr = child
            }
            else {
                curr.add(c)
                curr = curr.children[c]!
            }
        }
        
        if !curr.isTerminating {
            curr.isTerminating = true
            wordCount += 1
        }
    }
    
    public func contains(_ word: String) -> Bool {
        guard !word.isEmpty else {
            return false
        }
        var curr = root
        
        for c in word.lowercased() {
            if let child = curr.children[c] {
                curr = child
            }
            else {
                return false
            }
        }
        return curr.isTerminating
    }
    
    public func findWordsWith(prefix: String)->[String] {
        var words = [String]()
        
        let lowercasePrefix = prefix.lowercased()
        if let lastNode = findLastNodeOf(lowercasePrefix) {
            if lastNode.isTerminating {
                words.append(lowercasePrefix)
            }
            
            for child in lastNode.children.values {
                let subWords = wordsInSubTrie(child, partialWord: lowercasePrefix)
                if subWords.count > 0 {
                    words += subWords
                }
            }
        }
        
        return words
    }
    
    public func remove(_ word: String) {
        guard  !word.isEmpty else {
            return
        }
        
        guard let lastTerminalNode = findTerminalNodeOf(word) else {
            return
        }
        
        if lastTerminalNode.isLeaf {
            deleteNodesEndingWith(terminalNode:  lastTerminalNode)
        }
        else {
            lastTerminalNode.isTerminating = false
        }
        wordCount -= 1
    }
    
    private func findLastNodeOf(_ word: String) -> Node?{
        guard !word.isEmpty else  {
            return nil
        }
        
        var curr = root
        for c in word {
            if let child = curr.children[c] {
                curr = child
            }
            else {
                return nil
            }
        }
        return curr
    }
    
    private func findTerminalNodeOf(_ word: String) -> Node? {
        if let lastNode = findLastNodeOf(word) {
            return lastNode.isTerminating ? lastNode : nil
        }
        return nil
    }
    
    private func wordsInSubTrie(_ root: Node, partialWord: String)->[String] {
        var subTrieWords = [String]()
        
        var previousLetters = partialWord
        if let c = root.value {
            previousLetters.append(c)
        }
        if root.isTerminating {
            subTrieWords.append(previousLetters)
        }
        
        for child in root.children.values {
            let childWords = wordsInSubTrie(child, partialWord: previousLetters)
            if childWords.count > 0 {
                subTrieWords += childWords
            }
        }
        
        return subTrieWords
    }
    
    private func deleteNodesEndingWith(terminalNode node: Node) {
        var lastNode = node
        var c = lastNode.value
        while lastNode.isLeaf, let parent = lastNode.parent {
            lastNode = parent
            lastNode.children[c!] = nil
            if lastNode.isTerminating {
                break
            }
            c = lastNode.value
        }
    }
}
