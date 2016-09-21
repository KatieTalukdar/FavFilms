//
//  ViewController.swift
//  FavFilms
//
//  Created by Kashfa Talukdar on 21/04/2016.
//  Copyright © 2016 Kashfa Talukdar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var TitleImage: UIImageView!
    
    
    
   var films = [Film]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
  
    }
    override func viewDidAppear(animated: Bool) {
        
        fetchAndSetResults()
        tableView.reloadData()
        
    }
    func fetchAndSetResults(){
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Film")
    
    do{
    let results = try context.executeFetchRequest(fetchRequest)
        self.films = results as! [Film]
        print("\n\n\n\n\n films One", films[2].filmImage)
    }catch let err as NSError{
        print(err.debugDescription)
        }
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       if let cell = tableView.dequeueReusableCellWithIdentifier("FilmCell") as? FilmCell{
        let film = films[indexPath.row]
        cell.configureCell(film)
        return cell
        
    }else {
    return FilmCell()
    }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
        
        
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        print("Row: \(row)")
        
        print("\n\n\n\n\n\n\n\n")
        
        print("films[] ", films[row] as Film)
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let entity = NSEntityDescription.entityForName("MyFilm", inManagedObjectContext: context)!
        let myfilm = MyFilm(entity: entity,  insertIntoManagedObjectContext: context)
        
        
           // films[row] as! MyFilm
        myfilm.filmTitle = films[row].filmTitle
        myfilm.filmDesc = films[row].filmDesc
        myfilm.filmLink = films[row].filmLink
        myfilm.filmImg = films[row].filmImage
        
        //TitleImage.image = UIImage(data: films[row].filmImage!)
        
        print("films[] ", films[row] as Film)
        
        print("Setting: " ,films[row].filmImage)
        
        context.insertObject(myfilm)
        do{
            try context.save()
        }catch{
            print("Film didn't save")
        }
        
       let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("descVC") as! descViewController
        
        self.navigationController!.pushViewController(secondViewController, animated: true)
        
      
        
    
    
    }
  
    

}

