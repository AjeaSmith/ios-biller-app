//
//  BillsView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI

struct BillsView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "dueDate",ascending: true)]) private var bills: FetchedResults<BillEntity>
    
    @State private var isPaid: Bool = false
    
    var body: some View {
        NavigationView {
            List{
                Section(content: {
                    ForEach(bills, id: \.self){ bill in
                        NavigationLink {
                            BillDetailView(bill: bill, isPaid: $isPaid)
                        } label: {
                            HStack{
                                HStack{
                                    VStack(alignment: .leading){
                                        HStack{
                                            Text(bill.unWrappedName)
                                                .font(.title2)
                                            isPaid ? Text("PAID!")
                                                .foregroundColor(Color(.systemGreen))
                                                .font(Font.system(size: 12)): nil
                                        }
                                        Text("Due on \(bill.unWrappedDueDate.formatted(.dateTime.weekday(.wide).day().month()))")
                                        
                                            .foregroundColor(.secondary)
                                    }
                                }
                                Spacer()
                                VStack{
                                    Text("\(bill.unWrappedAmount)")
                                }
                            }
                            
                        }
                        
                    }
                    .onDelete(perform: removeItems)
                }, header: {
                    Text("Unpaid Bills")
                        .font(Font.system(size: 20))
                        .foregroundColor(.orange)
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
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let bill = bills[index]
            viewContext.delete(bill)
        }
        do {
            try viewContext.save()
        } catch {
            // handle the Core Data error
            print("error deleting data -------- \(error.localizedDescription)")
        }
    }
}

struct BillsView_Previews: PreviewProvider {
    static var previews: some View {
        BillsView()
    }
}
