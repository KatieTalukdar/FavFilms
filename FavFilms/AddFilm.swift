//
//  AddFilm.swift
//  FavFilms
//
//  Created by Kashfa Talukdar on 21/04/2016.
//  Copyright © 2016 Kashfa Talukdar. All rights reserved.
//

import UIKit
import CoreData

class AddFilm: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{


    @IBOutlet weak var filmTitle: UITextField!
    
    @IBOutlet weak var desc: UITextField!
   
    @IBOutlet weak var link: UITextField!
    
    @IBOutlet weak var filImg: UIImageView!
    
    var imagePicker:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        filImg.layer.cornerRadius = 4.0
        filImg.clipsToBounds = true
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        filImg.image = image
        
    }
    @IBAction func addPic(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }


    @IBAction func createEntry(sender: AnyObject) {
        if let title = filmTitle.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Film", inManagedObjectContext: context)!
            let film = Film(entity: entity,  insertIntoManagedObjectContext: context)
            film.filmTitle = title
            film.filmDesc = desc.text
            film.filmLink = link.text
            film.setfilmImage(filImg.image!)
            
            context.insertObject(film)
            do{
                try context.save()
            }catch{
                print("Film didn't save")
            }
     dismissViewControllerAnimated(true, completion: nil)
        
        
    }

}
}