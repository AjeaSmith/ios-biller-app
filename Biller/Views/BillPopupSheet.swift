//
//  BillPopupSheet.swift
//  Biller
//
//  Created by Ajea Smith on 11/7/22.
//

import SwiftUI

struct BillPopupSheet: View {
    @Binding var billName: String
    @Binding var billDueDate: Date
    @Binding var sortedBills: [BillEntity]
    
    var body: some View {
        VStack{
            ForEach(sortedBills, id: \.self) { bill in
                Text(bill.unWrappedName)
                Text(bill.unWrappedDueDate.formatted(date: .abbreviated, time: .omitted))
            }
        }
    }
}
