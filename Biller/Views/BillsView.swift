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
            VStack {
                ForEach(bills, id: \.self) { bill in
                    BillCard(bill: bill)
                }
                .onDelete(perform: removeItems)
                Spacer()
                ZStack {
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
                        .frame(width: 50, height: 50)
                        .background(Color("primary-color"))
                        .foregroundColor(.white)
                        .cornerRadius(.infinity)
                        .padding()
                    }
                }
            }
            .padding(.top, 20)
            .navigationBarTitle(Text("Upcoming Bills"))
            .background(Color("list-background"))
            
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
