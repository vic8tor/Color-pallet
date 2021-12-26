//
//  ViewController.swift
//  Color pallet
//
//  Created by Victor on 14.12.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green

        setColor()
        
        setValue(for: redLabel, greenLabel, blueLabel)
    }


    @IBAction func moveSliders(_ sender: UISlider) {
        switch sender {
        case redSlider: setValue(for: redLabel)
        case greenSlider: setValue(for: greenLabel)
        default: setValue(for: blueLabel)
        }
        
        setColor()
    }
    
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
