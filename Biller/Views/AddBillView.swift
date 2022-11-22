//
//  AddBillView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI

struct AddBillView: View {
    @EnvironmentObject var billVM: BillViewModel
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    private enum Field: Int, CaseIterable {
        case amount
    }
    private var alerts = ["1 day before", "2 days before", "5 days before", "1 week before"]
    
    @State private var billname = ""
    @State private var amount = 0
    @State private var dueDate = Date()
    @State private var selectedAlert = "1 day before"
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        
        // MARK: Form
        VStack {
            Form {
                Section {
                    TextField("e.g. Rent, Netflix", text: $billname)
                    
                    TextField(billVM.string, text: $billVM.string)
                        .font(.title2)
                        .focused($focusedField, equals: .amount)
                        .keyboardType(.numberPad)
                        .onChange(of: billVM.string, perform: billVM.valueChanged)
                }
                
                Section {
                    DatePicker(selection: $dueDate, in: Date()..., displayedComponents: .date, label: { Text("Due Date") })
                        .datePickerStyle(.graphical)
                }header: {
                    Text("Due Date")
                }
                
                if billVM.isNotificationsEnabled {
                    Section {
                        Picker("Alert", selection: $selectedAlert) {
                            ForEach(alerts, id: \.self) { alert in
                                Text(alert)
                            }
                        }
                    }
                }
                
                Button {
                    addItem()
                    // TODO: check if the return exit the whole method without adding bill
                    switch (selectedAlert) {
                    case "1 day before":
                        billVM.setNotifications(dueDate: dueDate, billName: billname, amount: billVM.string, notificationType: "1 day before")
                    case "2 days before":
                        billVM.setNotifications(dueDate: dueDate, billName: billname, amount: billVM.string, notificationType: "2 days before")
                    case "5 days before":
                        billVM.setNotifications(dueDate: dueDate, billName: billname, amount: billVM.string, notificationType: "5 days before")
                    case "1 week before":
                        billVM.setNotifications(dueDate: dueDate, billName: billname, amount: billVM.string, notificationType: "1 week before")
                    default:
                        return
                    }
                } label: {
                    Text("Add Bill")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding(12)
                }
                .background(Color("List/accent"))
                .foregroundColor(.white)
                .cornerRadius(5)
            }
        }
        .navigationBarTitle("Add a Bill")
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    focusedField = nil
                }
            }
        }
    }
    
    private func addItem() {
        let newItem = BillEntity(context: viewContext)
        newItem.dueDate = dueDate
        newItem.name = billname
        newItem.amount = billVM.string
        
        do {
            try viewContext.save()
            presentationMode.wrappedValue.dismiss()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }
}
