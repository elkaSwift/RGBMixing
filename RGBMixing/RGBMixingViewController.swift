//
//  RGBMixingViewController.swift
//  RGBMixing
//
//  Created by Елисей Мищенко on 24.12.2021.
//

import UIKit

class RGBMixingViewController: UIViewController {
    
    //MARK: - properties
    weak var delegate: ColorViewController?
    var delegate2: RGBMixingViewController?
    var color: UIColor?
    
    //MARK: - IBOutlets
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        colorView.backgroundColor = color
        colorView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        colorSeparator()
        setValueLabel(for: redLabel, greenLabel, blueLabel)
        setValueTF(for: redTextField, greenTextField, blueTextField)
        
    }
    
    //MARK: - IBAction
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider: setValueLabel(for: redLabel)
        case greenSlider: setValueLabel(for: greenLabel)
        default: setValueLabel(for: blueLabel)
        }
        
        switch sender {
        case redSlider: setValueTF(for: redTextField)
        case greenSlider: setValueTF(for: greenTextField)
        default: setValueTF(for: blueTextField)
        }
    }
    
    @IBAction func tap(_ sender: Any) {
        redTextField.resignFirstResponder()
        greenTextField.resignFirstResponder()
        blueTextField.resignFirstResponder()
    }
    
    @IBAction func changeColorInVC() {
        delegate?.color(color: UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value)
            , alpha: 1)
        )
    }
    
    //MARK: - Private Methods
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func colorSeparator() {
        let startColor = CIColor(color: color ?? .white)
        redSlider.value = Float(startColor.red)
        greenSlider.value = Float(startColor.green)
        blueSlider.value = Float(startColor.blue)
    }
    
    private func setValueLabel(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                label.text = string(from: redSlider)
            case greenLabel:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValueTF( for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField:
                textField.text = string(from: redSlider)
            case greenTextField:
                textField.text = string(from: greenSlider)
            default:
                textField.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

//MARK: - Alert Controller
extension RGBMixingViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

