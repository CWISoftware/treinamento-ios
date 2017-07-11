//
//  AppHeader.swift
//  PabloBrodt_SWAPP
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

//@IBDesignable
class AppHeader: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    
    @IBInspectable var hideActionButton: Bool = false
    @IBInspectable var hideBgImage: Bool = false
    
    @IBInspectable var headerTitle: String? {
        get {
            return self.titleLabel.text
        }
        set {
            self.titleLabel.text = newValue
        }
    }
    
    var backAction: () -> Void = { _ in print("loading component") }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadComponent()
        self.btnBack.isHidden = self.hideActionButton
        self.bgImage.isHidden = self.hideBgImage
    }
    
    private func loadComponent() {
        let bundle = Bundle.init(for: type(of: self))
        
        let nib = UINib(nibName: "appHeaderView", bundle: bundle)
        
        self.view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        view.frame = self.bounds
        
        self.addSubview(view)
    }
    
    @IBAction func back(_ sender: Any) {
        self.backAction()
    }
}
