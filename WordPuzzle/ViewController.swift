//
//  ViewController.swift
//  WordPuzzle
//
//  Created by ahmed tantawy on 07/01/2021.
//

import UIKit

class ViewController: UIViewController {

    var cluesLabel : UILabel!
    var scoreLabel : UILabel!
    var answerLabel : UILabel!
    var currentAnswer : UITextField!
    var LetterButtons = [UIButton]()
    
    
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    var level = 1
    var activatedButton = [UIButton]()
    var solutions = [String]()
    

   
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
//        more code to come
        
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .right
        scoreLabel.text = "Score : 0"
        view.addSubview(scoreLabel)
        
        cluesLabel = UILabel()
        cluesLabel.translatesAutoresizingMaskIntoConstraints = false
        cluesLabel.font = UIFont.systemFont(ofSize: 24)
        cluesLabel.text = "CLUES"
        cluesLabel.numberOfLines = 0
        view.addSubview(cluesLabel)
        
        answerLabel = UILabel()
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.numberOfLines = 0
        answerLabel.text = "Answer"
        answerLabel.textAlignment = .right
        answerLabel.font=UIFont.systemFont(ofSize: 24)
        
        cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        answerLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        
        
        
        // entering the answer , se we will define text box and feed it with placeholder prperty
        
        
        
        
        
        
        currentAnswer = UITextField()
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        currentAnswer.placeholder = "guess here"
        currentAnswer.textAlignment = .center
        currentAnswer.font = UIFont.systemFont(ofSize: 44)
        currentAnswer.isUserInteractionEnabled  = false
        view.addSubview(currentAnswer)
        
        
        
        view.addSubview(answerLabel)
        cluesLabel.backgroundColor = .red
        answerLabel.backgroundColor = .blue
        
        
        
        let submit =  UIButton(type: .system)
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.setTitle("Submit", for: .normal)
        view.addSubview(submit)
        
        submit.addTarget(self, action: #selector(submitTapped) , for: .touchUpInside)
        
        
        let clear = UIButton(type: .system)
        clear.translatesAutoresizingMaskIntoConstraints = false
        clear.setTitle("Clear", for: .normal)
        view.addSubview(clear)
        clear.addTarget(self, action: #selector(clearTapped), for: .touchUpInside)
        
        let buttonsView = UIView()
        
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsView)
        
        buttonsView.backgroundColor = .green
        
        
        NSLayoutConstraint.activate([scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor , constant: 0), cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor , constant: 100) ,
cluesLabel.widthAnchor.constraint(equalTo: view.widthAnchor , multiplier: 0.6 , constant: -100)
,answerLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
answerLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor ,constant: -100),
answerLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6,constant: -100)
, answerLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor , constant: 20)
, currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5) ,

submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor) ,
submit.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -100) ,
clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 120),
submit.centerYAnchor.constraint(equalTo: clear.centerYAnchor) ,
submit.heightAnchor.constraint(equalToConstant: 44),
clear.heightAnchor.constraint(equalToConstant: 44),
buttonsView.widthAnchor.constraint(equalToConstant: 750),
buttonsView.heightAnchor.constraint(equalToConstant: 320),
buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
buttonsView.topAnchor.constraint(equalTo: submit.bottomAnchor,constant: 20) ,
buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor,constant: -20)
])
  
        
        let width = 150
        let height = 80
        
        for row in 0 ..< 4 {
            for column in 0 ..< 5 {
                
                let letterButton = UIButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                letterButton.setTitle("WWW", for: .normal)
                let frame = CGRect(x: column*width, y: height*row, width: width, height: height)
                letterButton.frame = frame
                buttonsView.addSubview(letterButton)
                LetterButtons.append(letterButton)
                letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
            }
            
        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadLevel()
    }
    
    
    // now we are gonna declare three methhods
    
    @objc func letterTapped(_ sender : UIButton){
        
        guard let buttonTitle = sender.titleLabel?.text else {
            return
        }
        
        currentAnswer.text = currentAnswer.text?.appending(buttonTitle)
        activatedButton.append(sender)
        sender.isHidden = true
    }
    
    
    @objc func submitTapped(_ sender : UIButton){
      
        
        guard let answerText = currentAnswer.text else {
            return
        }
        
        if let solutionPosition = solutions.firstIndex(of: answerText){
            
            activatedButton.removeAll()
            
            var splitAnswers = answerLabel.text?.components(separatedBy: "\n")
            splitAnswers?[solutionPosition] = answerText
            answerLabel.text = splitAnswers?.joined(separator: "\n")

                   currentAnswer.text = ""
                   score += 1

                   if score % 7 == 0 {
                       let ac = UIAlertController(title: "Well done!", message: "Are you ready for the next level?", preferredStyle: .alert)
                       ac.addAction(UIAlertAction(title: "Let's go!", style: .default, handler: levelUp))
                       present(ac, animated: true)
                   }
        }
    }

    
    
    @objc func clearTapped(_ sender : UIButton){
        currentAnswer.text = ""
        
        for button in activatedButton {
            
            button.isHidden = false
            
        }
        activatedButton.removeAll()
        
    }
    
    func levelUp(action: UIAlertAction) {
        level += 1
        solutions.removeAll(keepingCapacity: true)

        loadLevel()

        for btn in LetterButtons {
            btn.isHidden = false
        }
    }
    
    func loadLevel(){
        
        var clueString = ""
        var solutionString = ""
        var letterChunks = [String]()
        
        
        if let levelFileUrl = Bundle.main.url(forResource: "level\(level)", withExtension: "txt"){
            
            if let levelContents = try? String(contentsOf : levelFileUrl){
                var lines = levelContents.components(separatedBy: "\n")
                lines.shuffle()
             
                for (index,line) in lines.enumerated(){
                    
                    let parts = line.components(separatedBy: ": ")
                    let answer = parts[0]
                    let clue = parts[1]
                    clueString += "\(index + 1). \(clue)\n"
                    
                    let finalAnswer = answer.replacingOccurrences(of: "|", with: "")
                    solutionString += "\(finalAnswer.count)\n"
                    solutions.append(finalAnswer)
                    let bits = answer.components(separatedBy: "|")
                    letterChunks += bits
                }
                
                
            }
            
            
        }
        
        
        cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
        answerLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)

        letterChunks.shuffle()

        if letterChunks.count == LetterButtons.count {
            for i in 0 ..< LetterButtons.count {
                LetterButtons[i].setTitle(letterChunks[i], for: .normal)
            }
        }
        
    }

}

