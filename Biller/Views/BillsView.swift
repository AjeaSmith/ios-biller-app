//
//  BillsView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI

struct BillsView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "dueDate", ascending: true)]) private var bills: FetchedResults<BillEntity>
    
    var body: some View {
        NavigationView {
            ZStack {
                if bills.count == 0 {
                    VStack{
                        Text("No bills due")
                            .foregroundColor(Color(.systemGray))
                            .font(.title2)
                            .padding(.top, 100)
                        Spacer()
                    }
                    
                }else{
                    ScrollView {
                        ForEach(bills, id: \.self) { bill in
                            NavigationLink(destination: BillDetailView(bill: bill)) {
                                ZStack(alignment: .leading) {
                                    
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color("List/list-background"))
                                        .frame(height: 91)
                                        .shadow(color: Color("List/shadow"), radius: 4, y: 2)
                                    
                                    Circle()
                                        .fill(bill.paid ? Color("List/accent") : Color(.systemGray))
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
                                        VStack(alignment: .trailing){
                                            Text(bill.unWrappedAmount)
                                                .font(Font.listingText1)
                                            if bill.paid {
                                                Text("Paid")
                                                    .font(Font.listingText2)
                                                    .foregroundColor(Color("List/accent"))
                                            }
                                        }
                                    }
                                    .foregroundColor(Color("List/text"))
                                    .padding(.leading, 25)
                                    .padding(.trailing, 25)
                                    
                                }
                                .font(Font.landingText)
                                .padding(.horizontal)
                                .foregroundColor(Color("List/text"))
                            }
                            .padding(.bottom, 10)
                        }
                        Spacer()
                    }
                    .padding(.top, 15)
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink {
                            AddBillView()
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25, height: 25)
                                .padding(30)
                        }
                        .frame(width: 60, height: 60)
                        .background(Color("List/accent"))
                        .foregroundColor(.white)
                        .cornerRadius(.infinity)
                        .padding()
                        .shadow(color: Color("Landing/shadow"), radius: 3, y: 2)
                    }
                }
            }
            .background(Color("List/background"))
            .navigationBarTitle(Text("Upcoming Bills"))
            
        }
    }
}

struct BillsView_Previews: PreviewProvider {
    static var previews: some View {
        BillsView()
    }
}
