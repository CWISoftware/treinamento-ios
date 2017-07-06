//
//  ViewController.swift
//  TableView
//
//  Created by Juliano Krieger Nardon on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var states = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.states.append(self.sp)
        self.states.append(self.rj)
        self.states.append(self.rs)
    }
    
    let sp = [
        "Barueri",
        "Campinas",
        "São Bernardo",
        "São Caetano do Sul",
        "Santo André"
    ]
    
    let rj = [
        "Niterói",
        "Petrópolis",
        "São Gonçalo",
        "Duque de Caxias",
        "Nova Iguaçu"
    ]
    
    let rs = [
        "Canoas",
        "São Leopoldo",
        "Santa Maria",
        "Pelotas",
        "Novo Hamburgo"
    ]
    
    // MARK: DATA SOURCE METHODS
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "header-cell") as! HeaderUITableViewCell
    
        var element = ""
        
        switch section {
        case 0:
            element = "São Paulo"
            
        case 1:
            element = "Rio de Janeiro"
            
        case 2:
            element = "Rio Grande do Sul"
        default:
            break
        }
        
        cell.config(stateText: element)
        
        tableView.reloadData()
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.states.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.states[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RegularUITableViewCell.instanceNib) as!RegularUITableViewCell
        
        let element = self.states[indexPath.section][indexPath.item]
        
        
        cell.config(cityText: element)
        
        return cell
    }
    
    // MARK: DELEGATE METHODS
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let element = tableView.cellForRow(at: indexPath) as! RegularUITableViewCell
        
        print("selecionou \(String(describing: element.cityLabel.text!))")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let element = tableView.cellForRow(at: indexPath) as! RegularUITableViewCell
        
        print("deselecionou \(String(describing: element.cityLabel.text!))")
    }
}

