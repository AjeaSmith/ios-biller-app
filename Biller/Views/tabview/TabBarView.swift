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
    @EnvironmentObject var billVM: BillViewModel
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "dueDate", ascending: true)]) private var bills: FetchedResults<BillEntity>
    
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
                    .tabItem {
                        VStack {
                            Text("Calendar")
                            Image(systemName: "calendar")
                        }
                    }
                    .onAppear(perform: {
                        calendar.reloadData()
                    })
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
