//
//  ViewVermelha.swift
//  Protocols
//
//  Created by Juliano Krieger Nardon on 13/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewVermelha : UIView {
    
    var delegate : ViewBackgroundDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.red
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBackground))
        self.addGestureRecognizer(tapGesture)
    }
    
    func tapBackground() {
        delegate?.setBackgroundColor(color: self.backgroundColor!)
    }

}
