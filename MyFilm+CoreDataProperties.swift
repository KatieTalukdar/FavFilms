//
//  MyFilm+CoreDataProperties.swift
//  FavFilms
//
//  Created by Kashfa Talukdar on 14/06/2016.
//  Copyright © 2016 Kashfa Talukdar. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension MyFilm {

    @NSManaged var filmTitle: String?
    @NSManaged var filmDesc: String?
    @NSManaged var filmLink: String?
    @NSManaged var filmImg: Data?

}
