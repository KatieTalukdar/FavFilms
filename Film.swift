//
//  Film.swift
//  FavFilms
//
//  Created by Kashfa Talukdar on 03/05/2016.
//  Copyright © 2016 Kashfa Talukdar. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(Film)
class Film: NSManagedObject {


    func setfilmImage(img: UIImage){
        let data = UIImagePNGRepresentation(img)
        self.filmImage = data
    }
    
    
    func getFilmImage() -> UIImage {
        let img = UIImage(data: self.filmImage!)!
        return img
        
    }

}
