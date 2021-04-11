//
//  ColorSettingsViewController.swift
//  ColorPaletteV2App
//
//  Created by  Sergey on 11.04.2021.
//

import UIKit

class ColorSettingsViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var rgbColors: RGBColors!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorView.layer.cornerRadius = 20
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        redSlider.value = rgbColors.red
        greenSlider.value = rgbColors.green
        blueSlider.value = rgbColors.blue
        
        setColor()
    }
    
    @IBAction func setSlider(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider: setValue(for: redLabel)
        case greenSlider: setValue(for: greenLabel)
        default: setValue(for: blueLabel)
        }
    }
    
}

extension ColorSettingsViewController {
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value / 255),
            green: CGFloat(greenSlider.value / 255),
            blue: CGFloat(blueSlider.value / 255),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                rgbColors.red = redSlider.value
                label.text = String(Int(redSlider.value))
            case greenLabel:
                rgbColors.green = greenSlider.value
                label.text = String(Int(greenSlider.value))
            default:
                rgbColors.blue = blueSlider.value
                label.text = String(Int(blueSlider.value))
            }
        }
    }
}
