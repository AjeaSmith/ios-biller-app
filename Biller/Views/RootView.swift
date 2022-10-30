//
//  RootView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI
import CoreData

struct RootView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var isPresented = false
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray5// custom color.
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
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
