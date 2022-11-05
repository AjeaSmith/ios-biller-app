//
//  BillCard.swift
//  Biller
//
//  Created by Ajea Smith on 11/1/22.
//

import SwiftUI

struct BillCard: View {
    var bill: BillEntity
    
    var body: some View {
        NavigationLink(destination: BillDetailView(bill: bill)) {
            ZStack(alignment: .leading) {
                
                RoundedRectangle(cornerRadius: 5)
                .fill(Color("list-background"))
                .frame(height: 91)
                .shadow(color: Color("shadow2"), radius: 4, y: 2)
                
                Circle()
                    .fill(Color(.systemOrange))
                    .frame(width: 6, height: 6)
                    .offset(x: 9, y: -30)

                
                HStack{
                    VStack(alignment: .leading, spacing: 5){
                        Text(bill.unWrappedName)
                            .font(Font.listingText1)
                        Text("Due on \(bill.unWrappedDueDate.formatted(.dateTime.weekday(.wide).day().month()))")
                            .font(Font.listingText2)
                    }
                    Spacer()
                    Text(bill.unWrappedAmount)
                        .font(Font.listingText1)
                }
                .foregroundColor(Color("listing-text"))
                .padding(.leading, 25)
                .padding(.trailing, 25)
                
            }
            .font(Font.landingText)
            .padding(.horizontal)
            .foregroundColor(Color("list-background"))
        }
//        HStack{
//            NavigationLink(destination: BillDetailView(bill: bill)) {
//                Text(bill.unWrappedName)
//            }
//            .opacity(0.0)
//            .buttonStyle(PlainButtonStyle())
////            NavigationLink {
////                BillDetailView(bill: bill)
////            } label: {
////                HStack{
////                    VStack(alignment: .leading){
////                        HStack{
////                            Text(bill.unWrappedName)
////                                .font(.title2)
////                            bill.isPaid ? Text("PAID!")
////                                .foregroundColor(Color(.systemGreen))
////                                .font(Font.system(size: 12)): nil
////                        }
////                        Text("Due on \(bill.unWrappedDueDate.formatted(.dateTime.weekday(.wide).day().month()))")
////
////                            .foregroundColor(.secondary)
////                    }
////                }
////                Spacer()
////                VStack{
////                    Text("\(bill.unWrappedAmount)")
////                }
////
////            }
//            Text("love the bill")
//        }
    }
}

//struct BillCard_Previews: PreviewProvider {
//    static var previews: some View {
//        BillCard()
//    }
//}
