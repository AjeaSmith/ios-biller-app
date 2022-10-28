//
//  BillEntity+CoreDataProperties.swift
//  Biller
//
//  Created by Ajea Smith on 10/28/22.
//
//

import Foundation
import CoreData


extension BillEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BillEntity> {
        return NSFetchRequest<BillEntity>(entityName: "BillEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var amount: String?
    @NSManaged public var dueDate: Date?

    public var unWrappedDueDate: Date {
        return dueDate ?? Date()
    }
    public var unWrappedName: String {
        return name ?? "Unknown bill"
    }
    public var unWrappedAmount: String {
        return amount ?? "Unknown amount"
    }
}

extension BillEntity : Identifiable {

}
