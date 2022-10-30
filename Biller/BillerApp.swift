//
//  BillerApp.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI

@main
struct BillerApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//public var unWrappedDueDate: Date {
//    return dueDate ?? Date()
//}
//public var unWrappedName: String {
//    return name ?? "Unknown bill"
//}
//public var unWrappedAmount: String {
//    return amount ?? "Unknown amount"
//}
