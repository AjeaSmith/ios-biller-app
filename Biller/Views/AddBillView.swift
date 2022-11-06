//
//  AddBillView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI

struct AddBillView: View {
    @EnvironmentObject var billVM: BillViewModel
    
    private enum Field: Int, CaseIterable {
        case amount
    }
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var billname = ""
    @State private var amount = 0
    @State private var dueDate = Date()
    
    @State private var isWeekNotification = false
    @State private var is5DaysNotification = false
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        // MARK: Form
        Form {
            VStack(alignment: .leading){
                Group{
                    Text("Bill Name:")
                        .bold()
                    TextField("e.g. Cable, Netflix", text: $billname)
                        .textFieldStyle(.roundedBorder)
                }
        
                Group{
                    Text("Bill Amount:")
                        .bold()
                    TextField(billVM.string, text: $billVM.string)
                        .font(.title2)
                        .focused($focusedField, equals: .amount)
                        .keyboardType(.numberPad)
                        .onChange(of: billVM.string, perform: billVM.valueChanged)
                        .textFieldStyle(.roundedBorder)
                }
                
                Group{
                    DatePicker(selection: $dueDate, in: Date()..., displayedComponents: .date, label: { Text("Due Date") })
                        .datePickerStyle(.graphical)
                }
                if billVM.isNotificationsEnabled {
                    Group{
                        Toggle("Notify a week before", isOn: $isWeekNotification)
                            .font(.title2)
                            .disabled(is5DaysNotification)
                        
                        Toggle("Notify 5 days before", isOn: $is5DaysNotification)
                            .font(.title2)
                            .disabled(isWeekNotification)
                    }
                }
                Button {
                    addItem()
                    
                    if is5DaysNotification {
                        
                        billVM.setNotifications(dueDate: dueDate, billName: billname, amount: billVM.string, notificationType: .fiveDays)
                        
                    }else if isWeekNotification {
                        
                        billVM.setNotifications(dueDate: dueDate, billName: billname, amount: billVM.string, notificationType: .week)
                        
                    }
                } label: {
                    Text("Add Bill")
                        .frame(maxWidth: .infinity)
                        .padding(5)
                }
                .padding()
                .buttonStyle(.borderedProminent)
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    focusedField = nil
                }
            }
        }
        .navigationBarTitle("Add a Bill")

        
       
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

struct AddBillView_Previews: PreviewProvider {
    static var previews: some View {
        AddBillView()
    }
}

