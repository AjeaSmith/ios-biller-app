//
//  BillEntity+CoreDataProperties.swift
//  Biller
//
//  Created by Ajea Smith on 11/6/22.
//
//

import Foundation
import CoreData


extension BillEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BillEntity> {
        return NSFetchRequest<BillEntity>(entityName: "BillEntity")
    }

    @NSManaged public var amount: String?
    @NSManaged public var dueDate: Date?
    @NSManaged public var paid: Bool
    @NSManaged public var name: String?

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
