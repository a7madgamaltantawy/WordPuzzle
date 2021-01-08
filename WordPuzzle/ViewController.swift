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
    var currentAnswer : UILabel!
    var LetterLabel : UILabel!
    
    
   
    
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
        
        view.addSubview(answerLabel)
        cluesLabel.backgroundColor = .red
        answerLabel.backgroundColor = .blue
        
        
        
        
        NSLayoutConstraint.activate([scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor , constant: 0), cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor , constant: 100) ,
cluesLabel.widthAnchor.constraint(equalTo: view.widthAnchor , multiplier: 0.6 , constant: -100)
,answerLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
answerLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor ,constant: -100),
answerLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6,constant: -100)
, answerLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
                                     
        
        
        ])
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

