//
//  BillViewModel.swift
//  Biller
//
//  Created by Ajea Smith on 10/31/22.
//

import Foundation
import UserNotifications
import SwiftUI

class BillViewModel: ObservableObject {
    @Published var isNotificationsEnabled: Bool = false
    @Published var string: String = ""
    
    // MARK: - Currency
    private var amount: Decimal = .zero
    private let formatter = NumberFormatter(numberStyle: .currency)
    private var maximum: Decimal = 999_999_999.99
    private var lastValue: String = ""
    
    // MARK: - Notification
    private let notificationCenter = UNUserNotificationCenter.current()
    private let calendar = Calendar.current
    private let dateFormatter = DateFormatter()
    
    enum NotificationType {
        case fiveDays
        case week
    }
    
    init(maximum: Decimal = 999_999_999.99, locale: Locale = .current) {
        formatter.locale = locale
        self.string = formatter.string(for: amount) ?? "$0.00"
        self.lastValue = string
        self.maximum = maximum
    }
    
    func valueChanged(_ value: String) {
        let newValue = (value.decimal ?? .zero) / pow(10, formatter.maximumFractionDigits)
        if newValue > maximum {
            string = lastValue
        } else {
            string = formatter.string(for: newValue) ?? "$0.00"
            lastValue = string
        }
    }
//    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
    
    func setNotifications(dueDate: Date, billName: String, amount: String, notificationType: NotificationType) {
        dateFormatter.dateFormat = "MMM d"
        
        let content = UNMutableNotificationContent()
        content.title = "\(billName) bill is coming up"
        content.body = "Amount of \(amount) is due \(dateFormatter.string(from: dueDate))"
        content.sound = UNNotificationSound.default
        
        switch (notificationType) {
        case .fiveDays:
            let fiveDaysTrigger = calendar.date(byAdding: .day, value: -5, to: dueDate)!
            
            let fiveDaysDateComponents = calendar.dateComponents([.day], from: fiveDaysTrigger)
            let trigger = UNCalendarNotificationTrigger(dateMatching: fiveDaysDateComponents, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request)
            
        case .week:
            let weekTrigger = calendar.date(byAdding: .day, value: -7, to: dueDate)!
            
            let weekTriggerDateComponents = calendar.dateComponents([.day], from: weekTrigger)
            let trigger = UNCalendarNotificationTrigger(dateMatching: weekTriggerDateComponents, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request)
        }
    }
    
    func enableNotifications() {
        notificationCenter.requestAuthorization(options: [.sound, .alert, .badge]) { success, error in
            if success {
                DispatchQueue.main.async {
                    self.isNotificationsEnabled = true
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    func disableNotifications() {
        notificationCenter.removeAllPendingNotificationRequests()
        DispatchQueue.main.async {
            self.isNotificationsEnabled = false
        }
    }
}
extension NumberFormatter {
    
    convenience init(numberStyle: Style, locale: Locale = .current) {
        self.init()
        self.locale = locale
        self.numberStyle = numberStyle
    }
}

extension Character {
    
    var isDigit: Bool { "0"..."9" ~= self }
}

extension LosslessStringConvertible {
    
    var string: String { .init(self) }
}

extension StringProtocol where Self: RangeReplaceableCollection {
    
    var digits: Self { filter (\.isDigit) }
    
    var decimal: Decimal? { Decimal(string: digits.string) }
}
