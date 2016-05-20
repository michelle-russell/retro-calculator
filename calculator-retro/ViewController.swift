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
    var opNew:operation = operation.empty
    var opOld:operation = operation.empty
    
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
        updateRunningDisplay()
        
        if opNew == operation.equals{
            
            opNew = operation.empty
        }
        
        
    }
    
    @IBAction func onAddButtonPress(sender: AnyObject) {
        playAudio()
        operationHandle(operation.add)
        
    }
    
    @IBAction func onSubtractButtonPress(sender: AnyObject) {
        playAudio()
        operationHandle(operation.subtract)
        
    }

    @IBAction func onMultiplyButtonPress(sender: AnyObject) {
        playAudio()
        operationHandle(operation.multiply)
        
    }
    
    @IBAction func onDivideButtonPress(sender: AnyObject) {
        playAudio()
        operationHandle(operation.divide)
    }
    
    @IBAction func onEqualButtonPress(sender: AnyObject) {
        playAudio()
        operationHandle(operation.equals)
        
    }
    @IBAction func onClearButtonPress(sender: AnyObject) {
        playAudio()
        runningNumber = "0"
        opNew = operation.empty
        updateRunningDisplay()
        runningNumber = ""
        
    }
    
    // Audio
    func playAudio(){
        
        if btnSound.playing{
            
            btnSound.stop()
            
        }
        btnSound.play()
        
    }
    
    // Display
    func updateRunningDisplay(){
        
        lblScreen.text = runningNumber
        
    }
    
    func operationHandle(op:operation){
        
        if runningNumber == ""{
            opNew = op
            return
        }
        
        
        opOld = opNew
        opNew = op
        
        if opOld == operation.empty {
        
            leftVal = Double(runningNumber)!
            runningNumber = ""
            
        }else{
            
            switch opOld{
                
                
            case operation.add:
                leftVal = leftVal + Double(runningNumber)!
                
            case operation.subtract:
                leftVal = leftVal - Double(runningNumber)!
                
                
           case operation.multiply:
                leftVal = leftVal * Double(runningNumber)!
                
            case operation.divide:
                leftVal = leftVal / Double(runningNumber)!
                
            case operation.equals: break
                
            default: break
                
                
                
            }
            runningNumber = "\(leftVal)"
            updateRunningDisplay()
            runningNumber = ""
            
            
            
        }
     
        
    }
    
        
}

