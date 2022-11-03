//
//  CalendarView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI
import FSCalendar

struct CalendarView: View {
    
    @State var selectedDate: Date = Date()
    @State var presentModal = false
    
    @State private var billName = ""
    @State private var billDueDate: Date = Date()
    
    
    var body: some View {
        CalendarViewRepresentable(selectedDate: $selectedDate, presentModal: $presentModal)
            .sheet(isPresented: $presentModal) {
                Text("\(billName), \(billDueDate.formatted(date: .complete, time: .omitted))")
            }
    }
}
struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}



extension CalendarView {
//    func createSampleBill() -> BillEntity {
//        let sampleBill = BillEntity(context: viewContext)
//        sampleBill.name = "No Bills"
//        sampleBill.dueDate = Date()
//        return sampleBill
//    }
//    func plotDates() {
//        if let bill = bills.first(where: {$0.unWrappedDueDate.formatted(date: .complete, time: .omitted) == selectedDate.formatted(date: .complete, time: .omitted)}){
//
//            billName = bill.unWrappedName
//            billDueDate = bill.unWrappedDueDate
//            print("Data ----------------------- \(bill.unWrappedName) ")
//        }else {
//            print("No bills on this day")
//        }
//    }
//    var currentEvent: BillEntity {
//        if let bill = bills.first(where: {$0.unWrappedDueDate.formatted(date: .complete, time: .omitted) == selectedDate.formatted(date: .complete, time: .omitted)}) {
//            return bill
//        } else {
//            print("No event found that matches that date.")
//        }
//        return createSampleBill()
//    }
}
