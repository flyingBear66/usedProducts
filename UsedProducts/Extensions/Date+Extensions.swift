//
//  Date+Extensions.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 05/12/2020.
//

import Foundation

extension Date {
    var timeAgoDisplay: String {

        let calendar = Calendar.current
        let twentySecondAgo = calendar.date(byAdding: .second, value: -20, to: Date())!
        let minuteAgo = calendar.date(byAdding: .minute, value: -1, to: Date())!
        let hourAgo = calendar.date(byAdding: .hour, value: -1, to: Date())!
        let dayAgo = calendar.date(byAdding: .day, value: -1, to: Date())!
        let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date())!
        let monthAgo = calendar.date(byAdding: .day, value: -30, to: Date())!
        let yearAgo = calendar.date(byAdding: .day, value: -365, to: Date())!

        if twentySecondAgo < self {
            return "now"
        } else if minuteAgo < self {
            let diff = Calendar.current.dateComponents([.second], from: self, to: Date()).second ?? 0
            return "\(diff) sec ago"
        } else if hourAgo < self {
            let diff = Calendar.current.dateComponents([.minute], from: self, to: Date()).minute ?? 0
            return "\(diff) min ago"
        } else if dayAgo < self {
            let diff = Calendar.current.dateComponents([.hour], from: self, to: Date()).hour ?? 0
            return "\(diff) hrs ago"
        } else if weekAgo < self {
            let diff = Calendar.current.dateComponents([.day], from: self, to: Date()).day ?? 0
            return "\(diff) days ago"
        } else if monthAgo < self {
            let diff = Calendar.current.dateComponents([.month], from: self, to: Date()).month ?? 0
            return "\(diff) months ago"
        } else if yearAgo < self {
            let diff = Calendar.current.dateComponents([.year], from: self, to: Date()).year ?? 0
            return "\(diff) years ago"
        }

        return "Once a upon a time"
    }
}
