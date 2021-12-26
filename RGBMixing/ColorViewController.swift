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
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? RGBMixingViewController else { return }
        destination.delegate = self
        destination.color = view.backgroundColor
        
    }
    
    //MARK: - Methods
    func color(color: UIColor) {
        view.backgroundColor = color
    }
    
    //MARK: - IBAction
    @IBAction func unwind(for seque: UIStoryboardSegue) {
    }
}


