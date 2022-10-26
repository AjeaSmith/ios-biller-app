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
    var body: some View {
        NavigationView{
            
            TabView() {
                BillsView()
                    .tabItem {
                        Image(systemName: "list.dash")
                    }
                
                CalendarView()
                    .tabItem {
                        Image(systemName: "calendar")
                    }
                
                SettingsView()
                    .tabItem {
                        Image(systemName: "gearshape")
                    }
            }
        }
    }
}
