//
//  Film+CoreDataProperties.swift
//  FavFilms
//
//  Created by Kashfa Talukdar on 03/05/2016.
//  Copyright © 2016 Kashfa Talukdar. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData


extension Film {

    @NSManaged var filmDesc: String?
    @NSManaged var filmImage: Data?
    @NSManaged var filmLink: String?
    @NSManaged var filmTitle: String?

}
