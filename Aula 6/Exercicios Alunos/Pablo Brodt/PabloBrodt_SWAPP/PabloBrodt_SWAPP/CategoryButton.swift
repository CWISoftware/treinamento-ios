//
//  CategoryButton.swift
//  PabloBrodt_SWAPP
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class CategoryButton: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionBtn: UIButton!
    
    @IBInspectable var buttonTitle: String? {
        get {
            return self.titleLabel.text
        }
        set {
            self.titleLabel.text = newValue
        }
    }
    
    @IBInspectable var iconImage: String? {
        get {
            return self.icon.image?.description
        }
        set {
            self.icon.image = UIImage(named: newValue!)
        }
    }
    
    var callbackFn: () -> Void = { _ in print("loading component") }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadComponent()
    }
    
    private func loadComponent() {
        let bundle = Bundle.init(for: type(of: self))
        let nib = UINib(nibName: "CategoryButton", bundle: bundle)
        
        self.view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        view.frame = self.bounds
        
        self.actionBtn.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
        
        self.addSubview(view)
    }
    
    @objc private func buttonClicked() {
        callbackFn()
    }

}
