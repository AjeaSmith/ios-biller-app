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
    
    @Binding var isPaid: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(bill.unWrappedName)
                    .font(.largeTitle)
                Spacer()
                
                Button {
                    isPaid.toggle()
                } label: {
                    if isPaid {
                        HStack {
                            Image(systemName: "checkmark")
                            Text("PAID")
                        }
                    }else{
                        Text("MARK AS PAID").foregroundColor(Color(.systemOrange))
                    }
                }.disabled(isPaid)
                
            }
            Text("Amount: \(bill.unWrappedAmount)")
            Text("Due Date: \(bill.unWrappedDueDate.formatted(date: .abbreviated, time: .omitted))")
            
            Spacer()
        }.padding()
    }
    func removeBill() {
        viewContext.delete(bill)
        
        do{
            try viewContext.save()
        }catch{
            print(error.localizedDescription)
        }
    }
}
