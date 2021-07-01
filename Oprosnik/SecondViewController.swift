//
//  SecondViewController.swift
//  Oprosnik
//
//  Created by Vladimir Syleimanov on 28.06.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var progressBar: UIProgressView!
    
    @IBOutlet var firstStackQuestion: UILabel!
    @IBOutlet var firstStackFirstanswer: UIButton!
    @IBOutlet var firstStackSecondAnswer: UIButton!
    @IBOutlet var firstStackThitdAnswer: UIButton!
    @IBOutlet var firstStackFourthAnswer: UIButton!
    
    @IBOutlet var secondStackQuestion: UILabel!
    @IBOutlet var secondStackFirstSwitch: UISwitch!
    @IBOutlet var secondStackSecondSwitch: UISwitch!
    @IBOutlet var secondStackFThirdSwitch: UISwitch!
    @IBOutlet var secondStackFourthSwitch: UISwitch!
    
    @IBOutlet var thirdStackQuestion: UILabel!
    @IBOutlet var thirdStackSlider: UISlider!
    
    @IBOutlet var stackOne: UIStackView!
    @IBOutlet var stackTwo: UIStackView!
    @IBOutlet var stackThree: UIStackView!
    
    let animals = Animals.getAnimal()
    let questions = Questions()
    let answers = QuestionAnswers.getAnswers()
    
    var dogCounter = 0
    var catCounter = 0
    var rabbitCounter = 0
    var turtleCounter = 0
    
    var winner = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackNumberShown()
        stackOne.isHidden = false
        stackTwo.isHidden = true
        stackThree.isHidden = true
        firstStackFirstanswer.setTitle(answers.questionAnswers1[0], for: .normal)
        firstStackSecondAnswer.setTitle(answers.questionAnswers1[1], for: .normal)
        firstStackThitdAnswer.setTitle(answers.questionAnswers1[2], for: .normal)
        firstStackFourthAnswer.setTitle(answers.questionAnswers1[3], for: .normal)
        
        firstStackQuestion.text = questions.allQuestions.first
        progressBar.progress = 0
        thirdStackSlider.maximumValue = 4
        thirdStackSlider.minimumValue = 1
        thirdStackSlider.value = 3
    }
    
    @IBAction func firstStackButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0 :
            progressBarCount()
            dogCounter += 1
            stackOne.isHidden = true
            stackTwo.isHidden = false
            stackNumberShown()
            secondStackQuestion.text = questions.allQuestions[1]
        case 1 :
            progressBarCount()
            catCounter += 1
            stackOne.isHidden = true
            stackTwo.isHidden = false
            stackNumberShown()
            secondStackQuestion.text = questions.allQuestions[1]
        case 2:
            progressBarCount()
            rabbitCounter += 1
            stackOne.isHidden = true
            stackTwo.isHidden = false
            stackNumberShown()
            secondStackQuestion.text = questions.allQuestions[1]
        default:
            progressBarCount()
            turtleCounter += 1
            stackOne.isHidden = true
            stackTwo.isHidden = false
            stackNumberShown()
            secondStackQuestion.text = questions.allQuestions[1]
        }
    }
    
    func stackNumberShown() {
        if stackOne.isHidden == false {
            navigationItem.title = "Вопрос № 1"
        } else if stackTwo.isHidden == false {
            navigationItem.title = "Вопрос № 2"
        } else if stackThree.isHidden == false {
            navigationItem.title = "Вопрос № 3"
        }
    }
    
    @IBAction func switchesPressed(_ sender: UISwitch) {
        switch sender.tag {
        case 0 :
            dogCounter += 1
        case 1 :
            catCounter += 1
        case 2:
            rabbitCounter += 1
        default:
            turtleCounter += 1
        }
    }
    
    func progressBarCount() {
        progressBar.setProgress(1, animated: true)
        let progressNumber = progressBar.progress / Float(questions.allQuestions.count)
        progressBar.progress = progressNumber
    }
    
    @IBAction func nextPressed() {
        stackTwo.isHidden = true
        stackThree.isHidden = false
        progreeBarResult()
        stackNumberShown()
        thirdStackQuestion.text = questions.allQuestions[2]
    }
    
    func progreeBarResult() {
        progressBar.progress = 1
        let progressNumber = progressBar.progress / Float(questions.allQuestions.count) //1/3
        progressBar.setProgress(progressNumber + progressNumber, animated: true)
    }
    
    func resultCheck() {
        if dogCounter > catCounter && dogCounter > rabbitCounter && dogCounter > turtleCounter {
            print("DogCounter is the winner")
            winner = animals.dog
        } else if catCounter > dogCounter && catCounter > rabbitCounter && catCounter > turtleCounter {
            print("CatCounter is a winner")
            winner = animals.cat
        } else if rabbitCounter > dogCounter && rabbitCounter > catCounter && rabbitCounter > turtleCounter {
            print("RabbitCounter is a winner")
            winner = animals.rabbit
        } else if turtleCounter > dogCounter && turtleCounter > catCounter && turtleCounter > rabbitCounter {
            print("TurtleCounter is a winner")
            winner = animals.turtle
        } else {
            winner = "асьол"
        }
    }
    
    @IBAction func thirdStackAnswerPressed() {
        if thirdStackSlider.value == 1 {
            dogCounter += 1
        } else if thirdStackSlider.value == 2 {
            catCounter += 1
        } else if thirdStackSlider.value == 3 {
            rabbitCounter += 1
        } else if thirdStackSlider.value == 4 {
            turtleCounter += 1
        }
        
        performSegue(withIdentifier: "lastSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let lastVC = segue.destination as? LastViewController else { return }
        lastVC.label = "Вы \(winner)"
        print("Prepare result \(winner)")
    }
}
