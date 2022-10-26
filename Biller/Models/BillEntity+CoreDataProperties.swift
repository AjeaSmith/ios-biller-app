//
//  BillEntity+CoreDataProperties.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//
//

import Foundation
import CoreData


extension BillEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BillEntity> {
        return NSFetchRequest<BillEntity>(entityName: "BillEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var dueDate: Date?
    @NSManaged public var amount: Double
    
    public var unWrappedDueDate: Date {
        return dueDate ?? Date()
    }
    public var unWrappedName: String {
        return name ?? "Unknown bill"
    }

}

extension BillEntity : Identifiable {

}
