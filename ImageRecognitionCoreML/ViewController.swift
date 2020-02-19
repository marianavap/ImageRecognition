//
//  ViewController.swift
//  ImageRecognitionCoreML
//
//  Created by Mariana Souza on 2/18/20.
//  Copyright © 2020 MarianaSouza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    private var model : Inceptionv3 = Inceptionv3()
    
    let images = ["cat.jpg", "dog.jpg", "rat.jpg", "banana.jpg"]
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonPressed() {
        
        if index > self.images.count - 1 {
            index = 0
        }
        
        let img = UIImage(named: images[index])
        self.imageView.image = img
        
        let resizedImage = img?.resizeTo(size: CGSize(width: 299, height: 299))
        
        let buffer = resizedImage?.toBuffer()
        
        let prediction = try! self.model.prediction(image: buffer!)
        
        self.titleLabel.text = prediction.classLabel
        
        index = index + 1
    }


}

