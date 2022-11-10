//
//  BillPopupSheet.swift
//  Biller
//
//  Created by Ajea Smith on 11/7/22.
//

import SwiftUI

struct BillPopupSheet: View {
    @Binding var billsInDay: [BillEntity]
    
    var body: some View {
        VStack{
            if billsInDay.count == 0 {
                Text("No Bills for this day")
            }else {
                VStack(alignment: .leading) {
                    Text("Bills due on this day")
                        .font(.title)
                        .padding(.bottom, 15)
                    ForEach(billsInDay, id: \.self) { bill in
                        HStack{
                            VStack(alignment: .leading){
                                Text(bill.unWrappedName)
                                Text(bill.unWrappedDueDate.formatted(date: .abbreviated, time: .omitted))
                                    .foregroundColor(Color("List/text"))
                            }
                            Spacer()
                            VStack{
                                Text(bill.unWrappedAmount)
                                    .foregroundColor(Color("List/accent"))
                            }
                        }
                        .padding(.bottom, 10)
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                Spacer()
            }
        }
    }
}
