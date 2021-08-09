//
//  ViewController.swift
//  ColorMix
//
//  Created by Krzysztof Gruszczynski on 05/08/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        colorView.layer.borderWidth = 5
        colorView.layer.cornerRadius = 10
        colorView.layer.borderColor = UIColor.black.cgColor
        
        
    }

    @IBAction func switchButton(_ sender: UISwitch) {
        updateColor()
        updateControls()
    }
    func updateColor() {
        var red: CGFloat = 0
        var blue: CGFloat = 0
        var green: CGFloat = 0
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
        }
        if greenSwitch.isOn {
            green = CGFloat(blueSlider.value)
        }
        if blueSwitch.isOn {
            blue = CGFloat(greenSlider.value)
        }
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
    }
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        blueSlider.isEnabled = greenSwitch.isOn
        greenSlider.isEnabled = blueSwitch.isOn
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateColor()
    }
    @IBAction func reset(_ sender: UIButton) {
        greenSlider.value = 0
        blueSlider.value = 0
        redSlider.value = 0
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        redSwitch.isOn = false
        updateColor()
    }
    
}

