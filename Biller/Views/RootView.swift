//
//  RootView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI
import CoreData

struct RootView: View {
    @StateObject var biller = BillerManager()
    @State private var isPresented = false
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray5
    }
    
    var body: some View {
        VStack{
            TabView() {
                BillsView()
                    .tabItem {
                        VStack{
                            Text("Bills")
                            Image(systemName: "list.dash")
                        }.padding(5)
                    }
                
                CalendarView()
                    .tabItem {
                        VStack {
                            Text("Calendar")
                            Image(systemName: "calendar")
                        }
                    }
                
                SettingsView()
                    .tabItem {
                        VStack {
                            Text("Settings")
                            Image(systemName: "gearshape")
                        }
                    }
            }
        }
        .environmentObject(biller)
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
