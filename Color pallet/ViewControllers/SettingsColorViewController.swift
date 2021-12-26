//
//  ViewController.swift
//  Color pallet
//
//  Created by Victor on 14.12.2021.
//

import UIKit

class SettingsColorViewController: UIViewController {
    // MARK: - @IBOutlets
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var redValueTextField: UITextField!
    @IBOutlet weak var greenValueTextField: UITextField!
    @IBOutlet weak var blueValueTextField: UITextField!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    // MARK: - Public Properties
    var color: UIColor!
    var delegate: SettingsViewControllerDelegate!
    // MARK: - Private Properties
    // MARK: - Initializers
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redValueTextField.delegate = self
        greenValueTextField.delegate = self
        blueValueTextField.delegate = self
        
        colorView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green

        setColor()
        
        setValue(for: redLabel, greenLabel, blueLabel)
        
    }
    
    // MARK: - @IBActions
    @IBAction func moveSliders(_ sender: UISlider) {
        switch sender {
        case redSlider: setValue(for: redLabel)
        case greenSlider: setValue(for: greenLabel)
        default: setValue(for: blueLabel)
        }
        setColor()
    }
    
    @IBAction func donePressedAction() {
        view.endEditing(true)
        delegate.updateColor(for: colorView.backgroundColor ?? .red)
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func roundValue(from sliders: UISlider) -> String {
        String(format: "%.2f", sliders.value)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach {
            switch $0 {
            case redLabel:
                $0.text = roundValue(from: redSlider)
            case greenLabel:
                $0.text = roundValue(from: redSlider)
            default:
                $0.text = roundValue(from: blueSlider)
            }
        }
    }
    
}

extension SettingsColorViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let value = textField.text else { return }
       
        guard let newValue = Float(value)  else {
        textField.text = nil
        return
        }
        
        guard newValue >= 0 && newValue <= 1 else {
            textField.text = nil
            return
        }
        
        switch textField {
        case redValueTextField:
            redSlider.value = newValue
        case greenValueTextField:
            greenSlider.value = newValue
        default:
            blueSlider.value = newValue
        }
    }
 }
