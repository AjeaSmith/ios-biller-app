//
//  CalendarView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI
import FSCalendar

struct CalendarView: View {
    
    @State var presentModal = false
    @State var billsInDay: [BillEntity] = []
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "dueDate", ascending: true)]) private var bills: FetchedResults<BillEntity>
    
    var body: some View {
        CalendarViewRepresentable(presentModal: $presentModal, billsInDay: $billsInDay)
            .sheet(isPresented: $presentModal) {
                BillPopupSheet(billsInDay: $billsInDay)
            }
    }
}
