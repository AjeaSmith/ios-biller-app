//
//  BillDetailView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI

struct BillDetailView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @Environment(\.presentationMode) var presentationMode
    
    var bill: BillEntity
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Spacer()
                Button {
                    removeItem(bill: bill)
                } label: {
                    Image(systemName: "trash")
                }
                .foregroundColor(Color(.systemRed))
            }
            
            VStack{
                VStack(alignment: .center, spacing: 50){
                    HStack{
                        VStack(alignment: .leading, spacing: 5){
                            Text(bill.unWrappedName)
                                .font(Font.listingText1)
                            Text("Due on \(bill.unWrappedDueDate.formatted(.dateTime.weekday(.wide).day().month()))")
                                .font(Font.listingText2)
                        }
                        Spacer()
                        VStack{
                            Text(bill.unWrappedAmount)
                                .font(Font.listingText1)
                        }
                    }
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
                    
                    if bill.paid {
                        VStack{
                            Image("paid")
                            Text("Paid!")
                                .font(Font.landingText)
                                .foregroundColor(Color("List/accent"))
                                .padding(.bottom, 5)
                        }
                    }else {
                        Button("Mark as Paid") {
                            markAsPaid()
                        }
                        .foregroundColor(Color("List/text-detail"))
                        .padding()
                        .padding(.horizontal, 15)
                        .background(Color("List/primary-shadow2"))
                        .cornerRadius(100)
                    }
                    
                }
                .padding(.vertical, 15)
            }
            .background(Color("List/list-background"))
            .shadow(color: Color("List/shadow"), radius: 4, y: 2)
            
            Spacer()
        }
        .padding()
        .background(Color("List/background"))
    }
    func removeItem(bill: BillEntity) {
        viewContext.delete(bill)
        
        do {
            try viewContext.save()
        } catch {
            // handle the Core Data error
            print("error deleting data -------- \(error.localizedDescription)")
        }
    }
    
    func markAsPaid() {
        bill.setValue(true, forKey: "paid")
        do {
            try viewContext.save()
            presentationMode.wrappedValue.dismiss()
        } catch {
            print("Error saving isPaid, \(error.localizedDescription)")
        }
    }
}
