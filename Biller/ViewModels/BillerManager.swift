//
//  BillerManager.swift
//  Biller
//
//  Created by Ajea Smith on 10/31/22.
//

import Foundation
import UserNotifications

class BillerManager: ObservableObject {
    @Published var isNotificationsEnabled: Bool = false
    
    private let notificationCenter = UNUserNotificationCenter.current()
    
    func enableNotifications(){
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
