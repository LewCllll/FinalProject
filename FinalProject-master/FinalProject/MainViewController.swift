//
//  MainViewController.swift
//  FinalProject
//
//  Created by 江鈺云 on 2016/12/22.
//  Copyright © 2016年 江鈺云. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var currentTime = 0
    var timer = Timer()
    
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var TimerSliderOutlet: UISlider!
    
    @IBAction func TimerSlider(_ sender: UISlider) {
        currentTime = Int(sender.value)
        TimerLabel.text = "\(currentTime)"
    }
    
    @IBOutlet weak var StartOutlet: UIButton!
    @IBAction func StartButton(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainViewController.counter), userInfo: nil, repeats: true)
        
        StartOutlet.isHidden = true
        StopOutlet.isHidden = false
        TimerSliderOutlet.isHidden = true
    }
    
    @IBOutlet weak var StopOutlet: UIButton!
    @IBAction func StopButton(_ sender: UIButton) {
        timer.invalidate()
        currentTime = 0
        TimerLabel.text = "\(currentTime)"
        TimerSliderOutlet.setValue(0, animated: true)
        
        StartOutlet.isHidden = false
        StopOutlet.isHidden = true
        TimerSliderOutlet.isHidden = false
    }
    
    
    func counter() {
        currentTime -= 1
        TimerLabel.text = "\(currentTime)"
        if (currentTime == 0){
            timer.invalidate()
            TimerSliderOutlet.setValue(0, animated: true)
            StartOutlet.isHidden = false
            TimerSliderOutlet.isHidden = false
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StopOutlet.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
