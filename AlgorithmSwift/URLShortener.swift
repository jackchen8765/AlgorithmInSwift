//
//  URLShortener.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 11/15/17.
//  Copyright © 2017 clz. All rights reserved.
//

import Foundation

//hash functions:
//http://www.cse.yorku.ca/~oz/hash.html

func djb2(_ x: String) -> Int {
    var hash = 5381
    
    for char in x.characters {
        hash = ((hash << 5) &+ hash) &+ char.hashValue
    }
    return Int(hash)
}

func sdbm(_ x: String) -> Int {
    var hash = 0
    
    for char in x.characters {
        hash = char.hashValue &+ (hash << 6) &+ (hash << 16) &- hash
    }
    return Int(hash)
}



public struct URLShortener {
    let domainName: String
    
    var urlArrayTuples: [(path: String, url: String)] = []
    var urlArray: [String] = []
    var unsafeUrls: [String] = []
    var filters = BloomFilter<String>(hashFunctions: [djb2, sdbm])
    
    
    public init(domainName: String) {
        self.domainName = domainName
    }
    
    
    public func isSecure(_ url: String) -> Bool {
        guard let initialUrl = expandFast(url) else {
            return false
        }
        
        if filters.exists(initialUrl) {
            for bad in unsafeUrls {
                if bad == initialUrl {
                    return false
                }
            }
            return true
        }
        else {
            return true
        }
    }
    
    public mutating func shortenFast(_ url: String) -> String {
        let index = urlArray.count
        urlArray.append(url)
        let pathBase16String = String(index, radix: 16)
        return domainName + pathBase16String
    }
    
    public func expandFast(_ url: String) -> String? {
        guard let pathBase16String = url.components(separatedBy: "/").last else {
            return nil
        }
        
        if let index = Int(pathBase16String, radix: 16) {
            return urlArray[index]
        }
        else {
            return nil
        }
    }
    
    public mutating func shorten(_ url: String) -> String {
        let index = urlArrayTuples.count
        let pathBase16String = String(index, radix: 16)
        
        urlArrayTuples.append((pathBase16String, url))
        
        return domainName + pathBase16String
    }
    
    public func expand(_ url: String) -> String? {
        guard let pathBase16String = url.components(separatedBy: "/").last else {
            return nil
        }
        
        for tuple in urlArrayTuples {
            if tuple.path == pathBase16String{
                return tuple.url
            }
        }
        return nil
    }
    
    
    
    public mutating func addBlackList(_ url: String) {
        self.unsafeUrls.append(url)
        self.filters.insert(url)
    }
    
}

/*
var shortener = URLShortener(domainName: "http://shor.ty/")
for i in 0..<100000{
    shortener.shortenFast("www.test.com/blog/page/file\(i)")
}

shortener.expand("http://shor.ty/10")

*/

