//
//  BillsView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI

struct BillsView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: []) private var bills: FetchedResults<BillEntity>
    
    var body: some View {
        NavigationView {
            Text("Hello")
            List{
                Section(content: {
                    ForEach(bills, id: \.self){ bill in
                        NavigationLink {
                            BillDetailView(bill: bill)
                        } label: {
                            HStack{
                                VStack(alignment: .leading){
                                    Text(bill.unWrappedName)
                                        .font(.title2)
                                    Text("Due on \(bill.unWrappedDueDate.formatted(.dateTime.weekday(.wide).day().month()))")
                                    
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                                Text("$\(bill.amount)")
                            }
                        }
                        
                    }
                }, header: {
                    Text("Unpaid Bills")
                        .font(Font.system(size: 20))
                        .foregroundColor(.blue)
                })
            }
            .navigationTitle("Upcoming Bills")
            .toolbar {
                ToolbarItem{
                    NavigationLink(destination: AddBillView()) {
                        Image(systemName: "plus")
                    }
                }
            }
            .listStyle(.grouped)
            
            Spacer()
            
            .navigationTitle("Bills")
            .background(Color(.systemGray6))
        }
    }
}

struct BillsView_Previews: PreviewProvider {
    static var previews: some View {
        BillsView()
    }
}
