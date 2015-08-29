//
//  ViewController.swift
//  Stopwatch
//
//  Created by Durgaprasad Guduguntla on 8/16/15.
//  Copyright (c) 2015 SJ Coding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewController: UIView!
    @IBOutlet var timeLabel: UILabel!
    var timer = NSTimer();
    var count = 0;
    var seconds = 0;
    var minutes = 0;
    var hours = 0;
    var buttonSwitch = 0;
    let playImg = UIImage(named: "play_button.png") as UIImage!
    let pauseImg = UIImage(named: "pause_button.png") as UIImage!
    
    @IBOutlet var playBtn: UIButton!
    @IBOutlet var stopBtn: UIButton!
    
    func updateTime() {
        var hoursLabel = "00";
        var minutesLabel = "00";
        var secondsLabel = "00";
        
        seconds++;
        if (seconds >= 60) {
            minutes++;
            seconds -= 60;
        }
        if (minutes >= 60) {
            hours++;
            minutes -= 60;
        }
        hoursLabel = "\(hours)";
        
        minutesLabel = "\(minutes)";
        
        secondsLabel = "\(seconds)";
        
        if (seconds < 10) {
            secondsLabel = "0\(seconds)";
        }
        if (minutes < 10) {
            minutesLabel = "0\(minutes)";
        }
        if (hours < 10) {
            hoursLabel = "0\(hours)";
        }
        timeLabel.text = hoursLabel + ":" + minutesLabel + ":" + secondsLabel;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.cornerRadius = 0;
        view.layer.masksToBounds = true;
        view.layer.borderColor = UIColor.blackColor().CGColor;
        view.layer.borderWidth = 2;
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func playClicked(sender: AnyObject) {
        if (buttonSwitch == 0) {
            //println("buttonSwitch = 0")
            buttonSwitch = 1
            playBtn.setImage(pauseImg, forState: UIControlState.Normal);
            var timerInterval = 1.0;
            timer = NSTimer.scheduledTimerWithTimeInterval(timerInterval, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true);
        }  else {
            //println("buttonSwitch = 1")
            buttonSwitch = 0;
            playBtn.setImage(playImg, forState: UIControlState.Normal);
            timer.invalidate();
        }

    }
    @IBAction func stopClicked(sender: AnyObject) {
        timer.invalidate();
        seconds = 0;
        minutes = 0;
        hours = 0;
        buttonSwitch == 0;
        playBtn.setImage(playImg, forState: UIControlState.Normal);
        timeLabel.text="00:00:00";
    }


}

