//
//  DetailViewController.swift
//  ApiExample
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//
import UIKit

class DetailViewController : UIViewController {
    
    var detailContent: (Any)? = nil
    var sender: String = ""
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitle1Label: UILabel!
    @IBOutlet weak var subtitle2Label: UILabel!
    @IBOutlet weak var subtitle3Label: UILabel!
    @IBOutlet weak var subtitle1Desc: UILabel!
    @IBOutlet weak var subtitle2Desc: UILabel!
    @IBOutlet weak var subtitle3Desc: UILabel!
    @IBOutlet weak var detailImageView: UIView!
    @IBOutlet weak var titleTab: UILabel!
    
    class func initializeViewController (detailContent: Any, sender: String, storyboard: UIStoryboard) -> DetailViewController {
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.detailContent = detailContent
        detailViewController.sender = sender
        
        return detailViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailImageView.layer.cornerRadius = detailImageView.frame.size.width/2
        self.detailImageView.clipsToBounds = true
        self.titleTab.text = sender

        
        switch sender {
        case "Persons":
            let person = detailContent as! Person
            titleLabel.text = person.name
            subtitle1Label.text = person.height
            subtitle1Desc.text = "HEIGHT"
            subtitle2Label.text = person.mass
            subtitle2Desc.text = "MASS"
            subtitle3Label.text = person.hairColor
            subtitle3Desc.text = "HAIR COLOR"
        case "Starships":
            let starship = detailContent as! Starship
            titleLabel.text = starship.name
            subtitle1Label.text = starship.passengers
            subtitle1Desc.text = "PASSENGERS"
            subtitle2Label.text = starship.crew
            subtitle2Desc.text = "CREW"
            subtitle3Label.text = starship.hdRating
            subtitle3Desc.text = "HD RATING"
        case "Films":
            let film = detailContent as! Film
            titleLabel.text = film.title
            subtitle1Label.text = film.episode
            subtitle1Desc.text = "EPISODE"
            subtitle2Label.text = film.releaseYear
            subtitle2Desc.text = "RELEASE YEAR"
            subtitle3Label.text = film.director
            subtitle3Desc.text = "DIRECTOR"
        case "Planets":
            let planets = detailContent as! Planet
            titleLabel.text = planets.name
            subtitle1Label.text = planets.rotationPeriod
            subtitle1Desc.text = "ROTATION PERIOD"
            subtitle2Label.text = planets.diameter
            subtitle2Desc.text = "DIAMETER"
            subtitle3Label.text = planets.surfaceWater
            subtitle3Desc.text = "SURFACE WATER"
        default:
            break
        }
        
    }
    
    @IBAction func onTouchBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
