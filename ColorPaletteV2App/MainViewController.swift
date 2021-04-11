//
//  MainViewController.swift
//  ColorPaletteV2App
//
//  Created by  Sergey on 11.04.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private var rgbColors = RGBColors(red: 255, green: 255, blue: 255)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetupUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorSettingsVC = segue.destination as? ColorSettingsViewController else { return }
        colorSettingsVC.rgbColors = rgbColors
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard let colorSettingsVC = segue.source as? ColorSettingsViewController else { return }
        rgbColors = colorSettingsVC.rgbColors
        
        SetupUI()
    }
}

extension MainViewController {
    private func SetupUI() {
        super.view.backgroundColor = UIColor(
            red: CGFloat(rgbColors.red / 255),
            green: CGFloat(rgbColors.green / 255),
            blue: CGFloat(rgbColors.blue / 255),
            alpha: 1
        )
    }
}
