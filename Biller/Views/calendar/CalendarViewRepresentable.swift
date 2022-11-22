//
//  CalendarViewRepresentable.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import Foundation
import SwiftUI
import FSCalendar

struct CalendarViewRepresentable: UIViewRepresentable {
    var calendar = FSCalendar()

    @Binding var presentModal: Bool
    @Binding var billsInDay: [BillEntity]
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "dueDate", ascending: true)]) private var bills: FetchedResults<BillEntity>
    
    func makeUIView(context: Context) -> FSCalendar {
        calendar.appearance.todayColor = UIColor(displayP3Red: 0,
                                                 green: 0,
                                                 blue: 0, alpha: 0)
        calendar.appearance.weekdayTextColor = UIColor(Color("Calendar/weekday"))
        calendar.appearance.titleDefaultColor = UIColor(Color("Calendar/days"))
        calendar.appearance.titleTodayColor = .black
        calendar.appearance.selectionColor = UIColor(Color("List/accent"))
        calendar.appearance.eventDefaultColor = UIColor(Color("List/accent"))
        calendar.appearance.titleTodayColor = .systemBlue
        calendar.appearance.titleFont = .boldSystemFont(ofSize: 24)
        calendar.appearance.titleWeekendColor = UIColor(Color("List/accent"))
        calendar.appearance.headerMinimumDissolvedAlpha = 0.12
        calendar.appearance.headerTitleFont = .systemFont(
            ofSize: 30,
            weight: .black)
        calendar.appearance.headerTitleColor = .darkGray
        calendar.appearance.headerDateFormat = "MMMM"
        calendar.scrollDirection = .vertical
        
        calendar.scope = .month
        
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        return calendar
    }
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {
        uiView.reloadData()
       
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
        
        var parent: CalendarViewRepresentable
        
        init(_ parent: CalendarViewRepresentable) {
            self.parent = parent
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            parent.presentModal = true
    
            let getBillsInDay = parent.bills.filter({ bill in
                bill.unWrappedDueDate.formatted(date: .abbreviated, time: .omitted) == date.formatted(date: .abbreviated, time: .omitted)
            })

            parent.billsInDay = getBillsInDay
        }

        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            var eventCount = 0
            parent.bills.forEach { bill in
                if bill.unWrappedDueDate.formatted(date: .complete,
                                       time: .omitted) == date.formatted(
                                        date: .complete, time: .omitted){
                    eventCount += 1;
                }
            }
            return eventCount
        }
        
        func maximumDate(for calendar: FSCalendar) -> Date {
            .distantFuture
        }
        func minimumDate(for calendar: FSCalendar) -> Date {
            Date.now
        }
        
    }
}

