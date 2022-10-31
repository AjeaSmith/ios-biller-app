//
//  SettingsView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI
import UserNotifications

struct SettingsView: View {
    @EnvironmentObject var biller: BillerManager
    @State private var isEnabled = false
    let NM = NotificationsManager()
    
    var body: some View {
        VStack{
            Toggle("Enable Notifications", isOn: $isEnabled)
            Button("Confirm") {
                if isEnabled {
                    biller.enableNotifications()
                }else {
                    biller.disableNotifications()                 }
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
