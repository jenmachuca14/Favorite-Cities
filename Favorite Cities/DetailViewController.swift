//
//  DetailViewController.swift
//  Favorite Cities
//
//  Created by Jen on 2/1/17.
//  Copyright © 2017 JenMachuca. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var populationTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    var detailItem: City? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func configureView() {
        // Update the user interface for the detail item.
        if let city = self.detailItem {
            if cityTextField.text != nil{
                cityTextField.text = city.name
                stateTextField.text = city.state
                populationTextField.text = String(city.population)
                imageView.image = UIImage(data:city.image)
                
            }
        }

    }
    @IBAction func onTappedSavedButton(_ sender: UIButton) {
        if let city = self.detailItem {
            city.name = cityTextField.text!
            city.state = stateTextField.text!
            city.population = Int(populationTextField.text!)!
            city.image = UIImagePNGRepresentation(imageView.image!)!
            
            /// you wanna store the image as a data object// 
           
        }
    }
  

}

