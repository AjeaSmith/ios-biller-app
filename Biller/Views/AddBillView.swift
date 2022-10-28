//
//  AddBillView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI

struct AddBillView: View {
    let NM = NotificationsManager()
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var billname = ""
    @State private var amount = 0.0
    @State private var dueDate = Date()
    @State private var isWeekNotification = false
    @State private var is5DaysNotification = false
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    var body: some View {
        ScrollView{
            // MARK: Form
            VStack(spacing: 20){
                
                VStack(alignment: .leading){
                    Text("Bill Name:")
                        .bold()
                    TextField("e.g. Cable, Netflix", text: $billname)
                        .textFieldStyle(.roundedBorder)
                }
                VStack(alignment: .leading){
                    Text("Bill Amount:")
                        .bold()
                    TextField("Enter your score", value: $amount, formatter: formatter)
                                .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                }
                VStack(alignment: .leading){
                    Text("Due Date:")
                        .bold()
                    DatePicker(selection: $dueDate, in: Date()..., displayedComponents: .date, label: { Text("Due Date") })
                        .datePickerStyle(.graphical)
                }
                VStack{
                    Toggle("Notify a week before", isOn: $isWeekNotification)
                        .disabled(is5DaysNotification)
                    
                    Toggle("Notify 5 days before", isOn: $is5DaysNotification)
                        .disabled(isWeekNotification)
                }
                
                Button("Add Bill") {
                    // ------ PUT THIS LOGIC IN MVVM
                    addItem()
                    
                    if is5DaysNotification {
                        NM.setForFiveDays(dueDate: dueDate, billName: billname, amount: amount)
                    }else if isWeekNotification {
                    }
                    presentationMode.wrappedValue.dismiss()
                    // -------- END
                }
                .padding()
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .navigationBarTitle("Add a Bill")
        
       
    }
    private func addItem() {
        let newItem = BillEntity(context: viewContext)
        newItem.dueDate = dueDate
        newItem.name = billname
        newItem.amount = amount
        
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

