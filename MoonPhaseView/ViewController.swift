//
//  ViewController.swift
//  MoonPhaseView
//
//  Created by Kyusaku Mihara on 5/9/17.
//  Copyright © 2017 epohsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moonPhaseView: MoonPhaseView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageStepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()

        ageStepper.sendActions(for: .valueChanged)
    }

    @IBAction func ageStepperValueChanged(_ sender: UIStepper) {
        ageLabel.text = String(format: "%.1f", sender.value)
        moonPhaseView.age = sender.value
    }
}

