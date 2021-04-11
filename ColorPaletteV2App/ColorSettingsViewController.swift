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
    var delegate: ColorSettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorView.layer.cornerRadius = 20
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        

        SetupUI()
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
    
    @IBAction func donePressed() {
        delegate.setNewColor(for: rgbColors)
        dismiss(animated: true)
    }
}

extension ColorSettingsViewController {
    private func SetupUI() {
        redLabel.text = String(Int(rgbColors.red))
        greenLabel.text = String(Int(rgbColors.green))
        blueLabel.text = String(Int(rgbColors.blue))
        
        redSlider.value = rgbColors.red
        greenSlider.value = rgbColors.green
        blueSlider.value = rgbColors.blue
    }
    
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
