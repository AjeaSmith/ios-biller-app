//
//  NotificationsManager.swift
//  Biller
//
//  Created by Ajea Smith on 10/27/22.
//

import Foundation
import SwiftUI
import UIKit

class NotificationsManager {
    let calendar = Calendar.current
    
    let dateFormatter = DateFormatter()

    func setForFiveDays(dueDate: Date, billName: String, amount: Double) {
        dateFormatter.dateFormat = "MMM d"
        
        let content = UNMutableNotificationContent()
        content.title = "\(billName) bill is coming up"
        content.body = "Amount of \(NumberFormatter.localizedString(from: amount as NSNumber, number: .currency)) is due \(dateFormatter.string(from: dueDate))"
        content.sound = UNNotificationSound.default
        
        let fiveDaysTrigger = calendar.date(byAdding: .day, value: -5, to: dueDate)!
        
        let fiveDaysDateComponents = calendar.dateComponents([.day], from: fiveDaysTrigger)
        
        // it should be trigger based on user selection, either 5 days before due date or week.
//        let trigger = UNCalendarNotificationTrigger(dateMatching: fiveDaysDateComponents, repeats: false)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
//    func setForAWeek(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
}
