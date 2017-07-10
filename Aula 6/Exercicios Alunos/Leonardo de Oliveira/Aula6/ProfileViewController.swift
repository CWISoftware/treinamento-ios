//
//  ProfileViewController.swift
//  Aula6
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ProfileViewController : UIViewController {
    
    var data: Any?
    var typeView : typeViewEnum = typeViewEnum.people
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dataOneLabel: UILabel!
    @IBOutlet weak var informationOneLabel: UILabel!
    @IBOutlet weak var dataTwoLabel: UILabel!
    @IBOutlet weak var informationTwoLabel: UILabel!
    @IBOutlet weak var dataThreeLabel: UILabel!
    @IBOutlet weak var informationThreeLabel: UILabel!
    @IBOutlet weak var dataImage: UIImageView!
    @IBOutlet weak var viewImage: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewImage.layer.cornerRadius = 50
        
        
        switch self.typeView {
        case typeViewEnum.people:
            self.titleLabel.text = "Person"
            self.dataImage.image = #imageLiteral(resourceName: "avatar")
            
            let person = data as! Person
            
            self.nameLabel.text = person.name
            self.dataOneLabel.text = String(person.height)
            self.informationOneLabel.text = "HEIGHT"
            self.dataTwoLabel.text = String(person.mass)
            self.informationTwoLabel.text = "MASS"
            self.dataThreeLabel.text = person.hairColor
            self.informationThreeLabel.text = "HAIR COLOR"
            
            break
        case typeViewEnum.starship:
            self.titleLabel.text = "Startship"
            self.dataImage.image = #imageLiteral(resourceName: "starship")
            
            let sharship = data as! Starship
            
            self.nameLabel.text = sharship.name
            self.dataOneLabel.text = String(sharship.passengers)
            self.informationOneLabel.text = "PASSENGERS"
            self.dataTwoLabel.text = String(sharship.crew)
            self.informationTwoLabel.text = "CREW"
            self.dataThreeLabel.text = String(sharship.hdrating)
            self.informationThreeLabel.text = "HD RATING"
            
            break
        case typeViewEnum.film:
            self.titleLabel.text = "Film"
            self.dataImage.image = #imageLiteral(resourceName: "film")
            
            let film = data as! Film
            
            self.nameLabel.text = film.title
            self.dataOneLabel.text = String(film.episode)
            self.informationOneLabel.text = "EPISODE"
            self.dataTwoLabel.text = String(film.releaseYear)
            self.informationTwoLabel.text = "RELEASE YEAR"
            self.dataThreeLabel.text = film.director
            self.informationThreeLabel.text = "DIRECTOR"
            
            break
        case typeViewEnum.planet:
            self.titleLabel.text = "Planet"
            self.dataImage.image = #imageLiteral(resourceName: "planet")
            
            let planet = data as! Planet
            
            self.nameLabel.text = planet.name
            self.dataOneLabel.text = String(planet.rotationPeriod)
            self.informationOneLabel.text = "ROTATION PERIOD"
            self.dataTwoLabel.text = String(planet.diameter)
            self.informationTwoLabel.text = "DIAMETER"
            self.dataThreeLabel.text = String(planet.surfaceWater)
            self.informationThreeLabel.text = "SURFACE WATER"
            
            break
        }
        
    }
    
    @IBAction func returnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
