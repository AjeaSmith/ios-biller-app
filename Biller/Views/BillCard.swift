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
            ZStack {
                Rectangle()
                    .frame(height: 60)
                    .cornerRadius(5)
                    .shadow(color: Color("shadow2"), radius: 4, x: 0, y: 2)
                HStack{
                    Text(bill.unWrappedName)
                        .foregroundColor(.black)
                    Text("hi")
                }
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
