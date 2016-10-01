//
//  MyFilm.swift
//  FavFilms
//
//  Created by Kashfa Talukdar on 14/06/2016.
//  Copyright © 2016 Kashfa Talukdar. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(MyFilm)
class MyFilm: NSManagedObject {

    func setfilmImage(_ img: UIImage){
        let data = UIImagePNGRepresentation(img)
        self.filmImg = data
    }
    
    
    func getFilmImage() -> UIImage {
        let img = UIImage(data: self.filmImg! as Data)
        return (img)!
        
    }

}
