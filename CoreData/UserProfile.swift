//
//  UserProfile.swift
//  FitnessApp
//
//  Created by 123 on 11.08.23.
//

import Foundation
import CoreData

class UserProfile: NSManagedObject {
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var login: String
    @NSManaged var password: String
}
