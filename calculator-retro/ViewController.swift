//
//  ViewController.swift
//  calculator-retro
//
//  Created by Michelle Russell on 5/16/16.
//  Copyright © 2016 bananapps. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // Outlets
    @IBOutlet weak var lblScreen: UILabel!
    
    // Create audio variable
    var btnSound: AVAudioPlayer!
    
    // Calculator Variables
    var leftVal = 0.0
    var rightVal = 0.0
    var runningNumber = ""
    var op:operation = operation.empty
    
    //Enum
    enum operation: String {
        
        case add = "+"
        case subtract = "-"
        case multiply = "*"
        case divide = "/"
        case equals = "="
        case empty = ""
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundURL)
            btnSound.prepareToPlay()
        }catch let err as NSError{
            print(err.debugDescription)
        }
        
    }

    // Actions
    @IBAction func onNumberButtonPress(btn: UIButton!){
        playAudio()
        runningNumber += "\(btn.tag)"
        updateDisplay()
        
        
    }
    
    @IBAction func onAddButtonPress(sender: AnyObject) {
        playAudio()
        
    }
    
    @IBAction func onSubtractButtonPress(sender: AnyObject) {
        playAudio()
        
    }

    @IBAction func onMultiplyButtonPress(sender: AnyObject) {
        playAudio()
        
    }
    
    @IBAction func onDivideButtonPress(sender: AnyObject) {
        playAudio()
        
    }
    
    @IBAction func onEqualButtonPress(sender: AnyObject) {
        playAudio()
        
    }
    @IBAction func onClearButtonPress(sender: AnyObject) {
        playAudio()
        runningNumber = ""
        updateDisplay()
        
    }
    
    // Audio
    func playAudio(){
        
        if btnSound.playing{
            
            btnSound.stop()
            
        }
        btnSound.play()
        
    }
    
    func updateDisplay(){
        
        lblScreen.text = runningNumber
        
    }
    
    
    
    
}

