//
//  Helper.swift
//  MeetingManager
//
//  Created by hawkeyeshi on 8/29/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

extension String {
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
}

enum WeekDay: String {
    case sunday = "Sun"
    case monday = "Mon"
    case tuesday = "Tue"
    case wednesday = "Wed"
    case thursday = "Thu"
    case friday = "Fri"
    case saturday = "Sat"
}
