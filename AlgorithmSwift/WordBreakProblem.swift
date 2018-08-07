//
//  WordBreakProblem.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 7/14/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

/*
 Given an string and a dictionary of words, find out if the input string can be broken into a space-separated sequence of one or more dictionary words.
 
 words: [I, have, book, read, ocean, Sam, am, rain, look, a, do]
 str: "IamSam"
 Output: ["I", "am", "Sam"]
 
 */

func wordBreakNaive(_ str: String, _ words: Set<String> ) -> String? {
    var result: String?
    
    func find(_ str: String, _ words: Set<String>, _ answer: String) -> Bool {
        if str.count == 0 {
            result = answer
            return true
        }
        
        var index = str.startIndex
        var word = [Character]()
        while index < str.endIndex {
            word.append(str[index])
            let strWord = String(word)
            if words.contains(strWord) {
                
                if find(str.substring(from: str.index(after: index)), words, answer + strWord + " ") {
                    return true
                }
                else {
                    str.formIndex(after: &index)
                }
            }
            else {
                str.formIndex(after: &index)
            }
        }
        return false
    }
    

    if find(str, words, "") {
        return result
    }
    
    else {
        return nil
    }

}

func wordBreakDP(_ str: String, _ words: Set<String>) -> String? {
    var result: String?
    var mem = Set<String>()
    
    func find(_ str: String, _ words: Set<String>, _ answer: String) -> Bool {
        if str.count == 0 {
            result = answer
            return true
        }
        else if mem.contains(str) {
            return false
        }
        
        var index = str.startIndex
        var word = [Character]()
        while index < str.endIndex {
            word.append(str[index])
            let strWord = String(word)
            if words.contains(strWord) {
                
                if find(str.substring(from: str.index(after: index)), words, answer + strWord + " ") {
                    return true
                }
                else {
                    str.formIndex(after: &index)
                }
            }
            else {
                str.formIndex(after: &index)
            }
        }
        mem.insert(str)
        return false
    }
    
    
    if find(str, words, "") {
        return result
    }
        
    else {
        return nil
    }
}
