//
//  LastViewController.swift
//  Oprosnik
//
//  Created by Vladimir Syleimanov on 28.06.2021.
//

import UIKit

class LastViewController: UIViewController {
    @IBOutlet var resultLabel: UILabel!

    var label = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = label
    }

    @IBAction func LogOutPressed() {
    }
}
