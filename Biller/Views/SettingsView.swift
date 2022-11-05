//
//  SettingsView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI
import UserNotifications

struct SettingsView: View {
    @EnvironmentObject var billVM: BillViewModel
    @State private var isEnabled = false
    
    var body: some View {
        VStack{
            Toggle("Enable Notifications", isOn: $isEnabled)
            Button("Confirm") {
                if isEnabled {
                    billVM.enableNotifications()
                }else {
                    billVM.disableNotifications()
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
