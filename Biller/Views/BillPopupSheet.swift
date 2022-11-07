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
    
    var body: some View {
        VStack{
            Text(billName)
            Text(billDueDate.formatted(date: .abbreviated, time: .omitted))
        }
    }
}
