//
//  PeopleViewController.swift
//  StarWarsApp
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    var person: Person?
    var film: Film?
    var planet: Planet?
    var starship: Starship?
    
    var resultScreenType = ""
    
    @IBOutlet weak var resultTitleLabel: UILabel!
    @IBOutlet weak var loaderActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var attr1Label: UILabel!
    @IBOutlet weak var attr2Label: UILabel!
    @IBOutlet weak var attr3Label: UILabel!
    
    
    @IBOutlet weak var headerView: GradientView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var attr1: UILabel!
    @IBOutlet weak var attr2: UILabel!
    @IBOutlet weak var attr3: UILabel!
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //criando a view do triângulo branco para ficar por cima da view gradient
        let triangle = TriangleView(frame: CGRect(x: 0, y: (headerView.frame.height * 0.6), width: headerView.frame.width, height: (headerView.frame.height * 0.4)))
        triangle.backgroundColor = UIColor(white: 1, alpha: 0.0)
        headerView.addSubview(triangle)
        
        self.loaderActivityIndicator.isHidden = true
        self.loaderActivityIndicator.hidesWhenStopped = true
        
        self.loaderActivityIndicator.startAnimating()
        getData()
        self.loaderActivityIndicator.stopAnimating()
    }
    
    func getData() {
        resultTitleLabel.text = resultScreenType.capitalized
        switch self.resultScreenType {
        case Data.SCREEN_OPTIONS.Films.rawValue:
            self.attr1Label.text = Data.labelsConfig[Data.SCREEN_OPTIONS.Films.rawValue]?[0]
            self.attr2Label.text = Data.labelsConfig[Data.SCREEN_OPTIONS.Films.rawValue]?[1]
            self.attr3Label.text = Data.labelsConfig[Data.SCREEN_OPTIONS.Films.rawValue]?[2]
            self.name.text = self.film!.title
            self.attr1.text =  String(self.film!.episode)
            self.attr2.text = self.film!.year
            self.attr3.text = self.film!.director
            break
        case Data.SCREEN_OPTIONS.People.rawValue:
            self.attr1Label.text = Data.labelsConfig[Data.SCREEN_OPTIONS.People.rawValue]?[0]
            self.attr2Label.text = Data.labelsConfig[Data.SCREEN_OPTIONS.People.rawValue]?[1]
            self.attr3Label.text = Data.labelsConfig[Data.SCREEN_OPTIONS.People.rawValue]?[2]
            self.name.text = self.person!.name
            self.attr1.text = self.person!.mass
            self.attr2.text = self.person!.birthYear
            self.attr3.text = self.person!.eyeColor
            break
        case Data.SCREEN_OPTIONS.Planets.rawValue:
            self.attr1Label.text = Data.labelsConfig[Data.SCREEN_OPTIONS.Planets.rawValue]?[0]
            self.attr2Label.text = Data.labelsConfig[Data.SCREEN_OPTIONS.Planets.rawValue]?[1]
            self.attr3Label.text = Data.labelsConfig[Data.SCREEN_OPTIONS.Planets.rawValue]?[2]
            self.name.text = self.planet!.name
            self.attr1.text = self.planet!.rotationPeriod
            self.attr2.text = self.planet!.diameter
            self.attr3.text = self.planet!.surfaceWater
            break
        case Data.SCREEN_OPTIONS.Starships.rawValue:
            self.attr1Label.text = Data.labelsConfig[Data.SCREEN_OPTIONS.Starships.rawValue]?[0]
            self.attr2Label.text = Data.labelsConfig[Data.SCREEN_OPTIONS.Starships.rawValue]?[1]
            self.attr3Label.text = Data.labelsConfig[Data.SCREEN_OPTIONS.Starships.rawValue]?[2]
            self.name.text = self.starship!.name
            self.attr1.text = self.starship!.passengers
            self.attr2.text = self.starship!.crew
            self.attr3.text = self.starship!.hyperdriveRating
            break
        default:
            break
        }
    }
    
}
