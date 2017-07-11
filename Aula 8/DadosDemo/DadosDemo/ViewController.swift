//
//  ViewController.swift
//  DadosDemo
//
//  Created by Juliano Krieger Nardon on 11/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func alertAction(_ sender: Any) {
        self.createAlert()
    }
    @IBAction func actionSheetAction(_ sender: Any) {
        self.createActionSheet()
    }

    func createAlert() {
        let alertController = UIAlertController.init(title: "Alerta", message: "Deseja deslogar?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "ok", style: .default, handler: { (action) in
            print("ok")
    
        }))
        
        alertController.addAction(UIAlertAction.init(title: "cancel", style: .cancel, handler: { (action) in
            print("cancel")
        }))
        
        alertController.addAction(UIAlertAction.init(title: "destructive", style: .destructive, handler: { (action) in
            print("destructive")
        }))
        
        
        self.navigationController?.present(alertController, animated: true, completion: nil)
    }
    
    func createActionSheet () {
        let alertController = UIAlertController.init(title: "", message: "Escolha uma opção", preferredStyle: .actionSheet)
        
        let alertOption1 = UIAlertAction.init(title: "opção 1", style: .default) { (action) in
            print("opção 1")
        }
        let alertOption2 = UIAlertAction.init(title: "opção 2", style: .default) { (action) in
            print("opção 2")
        }
        let alertOption3 = UIAlertAction.init(title: "opção 3", style: .default) { (action) in
            print("opção 3")
        }
        
        let alertCancel = UIAlertAction.init(title: "Cancelar", style: .cancel) { (action) in
            print("cancel")
        }
        
        alertController.addAction(alertOption1)
        alertController.addAction(alertOption2)
        alertController.addAction(alertOption3)
        alertController.addAction(alertCancel)
        
        self.navigationController?.present(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

