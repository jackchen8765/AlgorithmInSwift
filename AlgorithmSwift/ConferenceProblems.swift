//
//  ConferenceProblems.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 2/4/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

func maxMeetings(_ meetings: [(startTime: Double, endTime: Double)]) -> [(startTime: Double, endTime: Double)]{
    guard meetings.count > 1 else {
        return meetings
    }
    
    var result = [(startTime: Double, endTime: Double)]()
    
    let sortedMeetings = meetings.sorted(by:) { $0.endTime < $1.endTime}
    
    result.append(sortedMeetings[0])
    var i = 0
    
    for j in 1..<sortedMeetings.count {
        if sortedMeetings[j].startTime >= sortedMeetings[i].endTime {
            result.append(sortedMeetings[j])
            i = j
        }
    }
    return result
}


func minRooms(_ meetings: [(startTime: Double, endTime: Double)]) -> Int {
    guard meetings.count > 0 else {
        return 0
    }
    
    var result = 1
    var tempNeeded = 1
    
    let sortedMeetings = meetings.sorted(by:) { $0.startTime < $1.startTime }
    
    var i = 0
    var j = 1
    while i < sortedMeetings.count && j < sortedMeetings.count {
        if sortedMeetings[j].startTime < sortedMeetings[i].endTime {
            j += 1
            tempNeeded += 1
            if tempNeeded > result {
                result = tempNeeded
            }
        }
        else {
            tempNeeded -= 1
            i += 1
        }
    }
    return result
}
