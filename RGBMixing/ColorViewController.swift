//
//  ViewController.swift
//  RGBMixing
//
//  Created by Елисей Мищенко on 24.12.2021.
//

import UIKit

protocol ColorViewControllerDelegate {
    func color(color: UIColor)
}

class ColorViewController: UIViewController, ColorViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? RGBMixingViewController else { return }
        destination.delegate = self
    }
    
    func color(color: UIColor) {
        view.backgroundColor = color
    }
    
    @IBAction func unwind(for seque: UIStoryboardSegue) {
        
    }
    
}


