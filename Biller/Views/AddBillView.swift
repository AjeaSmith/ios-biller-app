//
//  AddBillView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI

struct AddBillView: View {
    private enum Field: Int, CaseIterable {
        case billname, amount
    }
    private let NM = NotificationsManager()
    
    @ObservedObject private var currencyManagerUS = CurrencyManager(
        amount: 0,
        locale: .current
    )
    
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
                        .font(.title)
                        .bold()
                    TextField("e.g. Cable, Netflix", text: $billname)
                        .font(.title2)
                        .focused($focusedField, equals: .billname)
                        .textFieldStyle(.roundedBorder)
                }
        
                Group{
                    Text("Bill Amount:")
                        .font(.title)
                        .bold()
                    TextField(currencyManagerUS.string, text: $currencyManagerUS.string)
                        .font(.title2)
                        .focused($focusedField, equals: .amount)
                        .keyboardType(.numberPad)
                        .onChange(of: currencyManagerUS.string, perform: currencyManagerUS.valueChanged)
                        .textFieldStyle(.roundedBorder)
                }
                
                Group{
                    DatePicker(selection: $dueDate, in: Date()..., displayedComponents: .date, label: { Text("Due Date") })
                        .datePickerStyle(.graphical)
                }
                Group{
                    Toggle("Notify a week before", isOn: $isWeekNotification)
                        .font(.title2)
                        .disabled(is5DaysNotification)
                    
                    Toggle("Notify 5 days before", isOn: $is5DaysNotification)
                        .font(.title2)
                        .disabled(isWeekNotification)
                }
                Button {
                    addItem()
                    
                    if is5DaysNotification {
                        NM.setForFiveDays(dueDate: dueDate, billName: billname, amount: currencyManagerUS.string)
                    }else if isWeekNotification {
                        
                    }
                    presentationMode.wrappedValue.dismiss()
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
        newItem.amount = currencyManagerUS.string
        
        do {
            try viewContext.save()
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

