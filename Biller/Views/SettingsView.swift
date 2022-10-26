//
//  SettingsView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI
import UserNotifications

struct SettingsView: View {
    var body: some View {
        VStack{
            Button("Request Permission") {
                // user needs to authorize the notifications
                UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert, .badge]) { success, error in
                    if success {
                        print("Access Granted!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification") {
                // if granetd, create notification content and tigger sound
                let content = UNMutableNotificationContent()
                content.title = "Cable bill is coming up"
                content.body = "Amount of $75 is due in 2 days"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

