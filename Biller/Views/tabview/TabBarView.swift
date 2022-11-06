//
//  TabBarView.swift
//  Biller
//
//  Created by Ajea Smith on 11/3/22.
//

import SwiftUI
import FSCalendar

struct TabBarView: View {
    let calendar = FSCalendar()
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
                
                CalendarView(calendar: calendar)
                    .onAppear(perform: {
                        calendar.reloadData()
                    })
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
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
