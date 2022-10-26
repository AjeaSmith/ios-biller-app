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
    
    var body: some View {
        VStack{
            Text(bill.unWrappedName)
                .font(.largeTitle)
            Button("Delete Bill", action: removeBill)
        }
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
