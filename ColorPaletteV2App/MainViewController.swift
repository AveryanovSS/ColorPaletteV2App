//
//  MainViewController.swift
//  ColorPaletteV2App
//
//  Created by  Sergey on 11.04.2021.
//

import UIKit

protocol ColorSettingsViewControllerDelegate {
    func setNewColor(for rgbColors: RGBColors)
}

class MainViewController: UIViewController {
    
    private var rgbColors = RGBColors(red: 255, green: 255, blue: 255)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetupUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorSettingsVC = segue.destination as? ColorSettingsViewController else { return }
        colorSettingsVC.rgbColors = rgbColors
        colorSettingsVC.delegate = self
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

extension MainViewController: ColorSettingsViewControllerDelegate {
    func setNewColor(for rgbColors: RGBColors) {
        self.rgbColors = rgbColors
        SetupUI()
    }
}
