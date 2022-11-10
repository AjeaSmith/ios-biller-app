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
    @State var billsInDay: [BillEntity] = []
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "dueDate", ascending: true)]) private var bills: FetchedResults<BillEntity>
    
    var body: some View {
        CalendarViewRepresentable(calendar: calendar, presentModal: $presentModal, billsInDay: $billsInDay)
            .sheet(isPresented: $presentModal) {
                BillPopupSheet(billsInDay: $billsInDay)
            }
    }
}
