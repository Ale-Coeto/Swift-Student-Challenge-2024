//
//  File.swift
//  
//
//  Created by Alejandra Coeto on 20/02/24.
//

import Foundation
import CoreData

@objc (Log)
class Log : NSManagedObject {
    @NSManaged public var id: UUID
    @NSManaged public var activity: String
    @NSManaged public var date: Date
    @NSManaged public var level: Int16
    
}

//enum Category: Int {
//    case Begginer = 2
//    case Intermediate = 6
//    case Advanced = 10
//    case Pro = 15
//    
//    var categoryType: String {
//        switch rawValue {
//            case Category.Begginer.rawValue: return "Begginer"
//            case Category.Intermediate.rawValue: return "Intermediate"
//            case Category.Advanced.rawValue: return "Advanced"
//            case Category.Pro.rawValue: return "Pro"
//        default:
//            return "Begginer"
//        }
//    }
//}

extension Log: Identifiable {
    var identifier: UUID {
        id
        
    }
    
   
    
//    var priority: Category {
//        get {
//            Category(rawValue: Int(level)) ?? .normal
//        }
//        
//        set {
//            self.priorityNum = Int32(newValue.rawValue)
//        }
//    }
}
