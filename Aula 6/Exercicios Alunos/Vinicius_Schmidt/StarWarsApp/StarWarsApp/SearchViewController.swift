//
//  SearchViewController.swift
//  StarWarsApp
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var films = [Film]()
    var people = [Person]()
    var planets = [Planet]()
    var starships = [Starship]()
    var searchScreenType = ""
    var showSearchResults = false
    
    @IBOutlet weak var mostViewedTable: UITableView!
    @IBOutlet weak var searchTitleLabel: UILabel!
    @IBOutlet weak var loaderActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var noResults: UIImageView!
    @IBAction func goBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchData(_ sender: UITextField) {
        self.showSearchResults = true
        let search = sender.text!.replacingOccurrences(of: " ", with: "%20")
        switch self.searchScreenType {
        case Data.SCREEN_OPTIONS.Films.rawValue:
            Film.getFilmsByName(search) { (films, error) in
                if let response = films {
                    if error == 0 {
                        self.films = response
                        self.mostViewedTable.reloadData()
                    }
                } else {
                    print("Sem Internet")
                }
            }
            
            break
        case Data.SCREEN_OPTIONS.People.rawValue:
            Person.getPeopleByName(search) { (people, error) in
                if let response = people {
                    if error == 0 {
                        self.people = response
                    } else {
                        print("Error \(error)")
                        //self.people = Person.getByName(sender.text!)
                    }
                } else {
                    print("Sem Internet")
                    //self.people = Person.getByName(sender.text!)
                }
                self.mostViewedTable.reloadData()
            }
            
            break
        case Data.SCREEN_OPTIONS.Planets.rawValue:
            Planet.getPlanetsByName(search) { (planets, error) in
                if let response = planets {
                    if error == 0 {
                        self.planets = response
                        self.mostViewedTable.reloadData()
                    }
                } else {
                    print("Sem Internet")
                }
            }
            break
        case Data.SCREEN_OPTIONS.Starships.rawValue:
            Starship.getStarshipsByName(search) { (starships, error) in
                if let response = starships {
                    if error == 0 {
                        self.starships = response
                        self.mostViewedTable.reloadData()
                    }
                } else {
                    print("Sem Internet")
                }
            }
            
            break
        default:
            break
        }
    }
    
    @IBAction func clearSearchField(_ sender: UITextField) {
        if sender.text == "Search" {
            sender.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loaderActivityIndicator.isHidden = true
        self.loaderActivityIndicator.hidesWhenStopped = true
        
        self.loaderActivityIndicator.startAnimating()
        getData()
        self.loaderActivityIndicator.stopAnimating()
        
        
        
    }
    
    
    // MARK: DATA SOURCE METHODS
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "header-cell") as! HeaderUITableViewCell
        
        let element = "Results for " + searchScreenType
        
        cell.config(resultText: element)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var total = 0
        switch self.searchScreenType {
        case Data.SCREEN_OPTIONS.Films.rawValue:
            total = self.films.count
        case Data.SCREEN_OPTIONS.People.rawValue:
            total = self.people.count
        case Data.SCREEN_OPTIONS.Planets.rawValue:
            total = self.planets.count
        case Data.SCREEN_OPTIONS.Starships.rawValue:
            total = self.starships.count
        default:
            break
        }
        if total == 0 && self.showSearchResults {
            tableView.isHidden = true
            self.noResults.isHidden = false
        } else {
            tableView.isHidden = false
            self.noResults.isHidden = true
        }
        return total
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RegularUITableViewCell.instanceNib) as!RegularUITableViewCell
        
        switch self.searchScreenType {
        case Data.SCREEN_OPTIONS.Films.rawValue:
            var film : Film? = nil
            if indexPath.row <= self.films.count && self.films.count > 0 {
                film = self.films[indexPath.row]
                cell.config(film!)
            }
            break
        case Data.SCREEN_OPTIONS.People.rawValue:
            var person : Person? = nil
            if indexPath.row <= self.people.count && self.people.count > 0 {
                person = self.people[indexPath.row]
                cell.config(person!)
            }
            break
        case Data.SCREEN_OPTIONS.Planets.rawValue:
            var planet : Planet? = nil
            if indexPath.row <= self.planets.count && self.planets.count > 0 {
                planet = self.planets[indexPath.row]
                cell.config(planet!)
            }
            break
        case Data.SCREEN_OPTIONS.Starships.rawValue:
            var starship : Starship? = nil
            if indexPath.row <= self.starships.count && self.starships.count > 0 {
                starship = self.starships[indexPath.row]
                cell.config(starship!)
            }
            break
        default:
            break
        }
        
        return cell
    }
    
    // MARK: DELEGATE METHODS
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        vc.resultScreenType = self.searchScreenType
        
        switch self.searchScreenType {
        case Data.SCREEN_OPTIONS.Films.rawValue:
            vc.film = self.films[indexPath.row]
            break
        case Data.SCREEN_OPTIONS.People.rawValue:
            vc.person = self.people[indexPath.row]
            break
        case Data.SCREEN_OPTIONS.Planets.rawValue:
            vc.planet = self.planets[indexPath.row]
            break
        case Data.SCREEN_OPTIONS.Starships.rawValue:
            vc.starship = self.starships[indexPath.row]
            break
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: false)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //nada por enquanto
    }
    
    
    // MARK: CALL API
    func getData() {
        self.searchTitleLabel.text = self.searchScreenType.capitalized
        switch self.searchScreenType {
        case Data.SCREEN_OPTIONS.Films.rawValue:
            Film.getFilms() { (films, error) in
                if let response = films {
                    if error == 0 {
                        self.films = response
                        self.mostViewedTable.reloadData()
                    }
                } else {
                    print("Sem Internet")
                }
            }
            break
        case Data.SCREEN_OPTIONS.People.rawValue:
            Person.getPeople() { (people, error) in
                if let response = people {
                    if error == 0 {
                        self.people = response
                        /*
                        for person in self.people {
                            Person.createOrUpdate(person)
                        }
                        */
                    }
                } else {
                    print("Sem Internet")
                    //self.people = Person.getAll()
                }
                self.mostViewedTable.reloadData()
            }
            break
        case Data.SCREEN_OPTIONS.Planets.rawValue:
            Planet.getPlanets() { (planets, error) in
                if let response = planets {
                    if error == 0 {
                        self.planets = response
                        self.mostViewedTable.reloadData()
                    }
                } else {
                    print("Sem Internet")
                }
            }
            break
        case Data.SCREEN_OPTIONS.Starships.rawValue:
            Starship.getStarships() { (starships, error) in
                if let response = starships {
                    if error == 0 {
                        self.starships = response
                        self.mostViewedTable.reloadData()
                    }
                } else {
                    print("Sem Internet")
                }
            }
            break
        default:
            break
        }
        
    }
}

