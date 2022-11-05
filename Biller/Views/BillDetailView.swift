//
//  BillDetailView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI

struct BillDetailView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    let bill: BillEntity
    
//    @Binding var isPaid: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(bill.unWrappedName)
                    .font(.largeTitle)
                Spacer(minLength: 20)
                
                Button {
                    bill.isPaid.toggle()
                } label: {
                    if bill.isPaid {
                        HStack {
                            Image(systemName: "checkmark")
                            Text("PAID")
                        }
                    }else{
                        Text("MARK AS PAID").foregroundColor(Color(.systemOrange))
                    }
                }.disabled(bill.isPaid)
                
            }
            HStack{
                Text("Amount:").fontWeight(.semibold)
                Text("\(bill.unWrappedAmount)")
            }
            HStack{
                Text("Due Date:").fontWeight(.semibold)
                Text(bill.unWrappedDueDate.formatted(date: .abbreviated, time: .omitted))
            }
            Spacer()
            
        }.padding()
    }
}
