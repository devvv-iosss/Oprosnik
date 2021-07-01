//
//  FirstViewController.swift
//  Oprosnik
//
//  Created by Vladimir Syleimanov on 28.06.2021.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet var dog: UILabel!
    @IBOutlet var cat: UILabel!
    @IBOutlet var rabbit: UILabel!
    @IBOutlet var turtle: UILabel!
    
    let animals = Animals.getAnimal()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dog.text = animals.dog
        cat.text = animals.cat
        rabbit.text = animals.rabbit
        turtle.text = animals.turtle
    }
    
    @IBAction func unwindSegue (segue: UIStoryboardSegue) {
      
    }
}
