//
//  descViewController.swift
//  FavFilms
//
//  Created by Kashfa Talukdar on 04/05/2016.
//  Copyright © 2016 Kashfa Talukdar. All rights reserved.
//

import UIKit
import CoreData

class descViewController: UIViewController {

    var films = [MyFilm]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAndSetResults()
      
    }


    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var filmImg: UIImageView!
   
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var linkLabel: UILabel!
    
    func fetchAndSetResults(){
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "MyFilm")
        
        do{
            let results = try context.executeFetchRequest(fetchRequest)
            if results.count > 0{
                
                let thisFilm = results[results.count-1] as! MyFilm
                
                
                titleLabel.text = thisFilm.filmTitle
                filmImg.image = thisFilm.getFilmImage()
                descriptionLabel.text = thisFilm.filmDesc
                linkLabel.text = thisFilm.filmLink
                

                print("\(results.count)")
            }else{
                print(" no results found ")
            }
        
        }catch let err as NSError{
            print(err.debugDescription)
        }

    }


}
