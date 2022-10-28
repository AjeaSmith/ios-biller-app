//
//  SettingsView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI
import UserNotifications

struct SettingsView: View {
    let NM = NotificationsManager()
    
    @State private var isEnabled = false
    
    var body: some View {
        VStack{
            Toggle("Enable Notifications", isOn: $isEnabled)
            Button("Confirm") {
                if isEnabled {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert, .badge]) { success, error in
                        if success {
                            print("Access Granted!")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                }else {
                    UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

