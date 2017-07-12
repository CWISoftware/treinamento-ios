//
//  ViewController.swift
//  CameraDemo
//
//  Created by Juliano Krieger Nardon on 12/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let picker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
    }

    @IBAction func cameraAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.picker.allowsEditing = true
            self.picker.sourceType = UIImagePickerControllerSourceType.camera
            self.picker.cameraCaptureMode = .photo
            self.picker.modalPresentationStyle = .fullScreen
            
            present(picker, animated: true, completion: nil)
        } else {
            print("não tem camera")
        }
    }

    @IBAction func galleryAction(_ sender: Any) {
        self.picker.allowsEditing = true
        self.picker.sourceType = .photoLibrary
        self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        self.picker.modalPresentationStyle = .popover
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var chosenImage = UIImage()
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage!
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.image = chosenImage
        
        dismiss(animated: true, completion: nil)
    }
}

