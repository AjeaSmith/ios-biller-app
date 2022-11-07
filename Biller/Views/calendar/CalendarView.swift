//
//  CalendarView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI
import FSCalendar

struct CalendarView: View {
    var calendar: FSCalendar
    
    @State var presentModal = false
    @State var billName = ""
    @State var billDueDate: Date = Date()
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "dueDate", ascending: true)]) private var bills: FetchedResults<BillEntity>
    
    var body: some View {
        CalendarViewRepresentable(calendar: calendar, billDueDate: $billDueDate, billName: $billName, presentModal: $presentModal)
            .sheet(isPresented: $presentModal) {
                BillPopupSheet(billName: $billName, billDueDate: $billDueDate)
            }
    }
}
