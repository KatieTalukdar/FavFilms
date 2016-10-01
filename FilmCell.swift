//
//  FilmCell.swift
//  FavFilms
//
//  Created by Kashfa Talukdar on 21/04/2016.
//  Copyright © 2016 Kashfa Talukdar. All rights reserved.
//

import UIKit

class FilmCell: UITableViewCell {
   
    @IBOutlet weak var filmImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        filmImg.layer.cornerRadius = 10.0
        filmImg.clipsToBounds = true
       
    }
    func configureCell(_ film: Film ){
        filmImg.image = film.getFilmImage()
        titleLbl.text = film.filmTitle
        descLbl.text = film.filmDesc
        
    }


}
