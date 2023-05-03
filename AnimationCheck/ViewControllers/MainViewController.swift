//
//  MainViewController.swift
//  AnimationCheck
//
//  Created by Рома Баранов on 02.05.2023.
//

import UIKit
import SpringAnimation


final class MainViewController: UIViewController {
    @IBOutlet var animationView: SpringView!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    private var animation = Animation.getAnimation()
    private var status = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presetLabel.text = "Preset: \(animation.preset)"
        curveLabel.text = "Curve: \(animation.curve)"
        forceLabel.text = "Force: \(String(format: "%.2f", animation.force))"
        durationLabel.text = "Duration: \(String(format: "%.2f", animation.duration))"
        delayLabel.text = "Delay: \(animation.delay)"
    }
    
    @IBAction func moveToTheNextAnimation(_ sender: SpringButton) {
        let result = Animation.getAnimation()
    
        switch status {
        case true:
            assignsData(animation)
            animation = result
            sender.setTitle("Next: \(animation.preset)", for: .normal)
            status.toggle()
        case false:
            assignsData(animation)
            animation = result
            sender.setTitle("Next: \(animation.preset)", for: .normal)
            status.toggle()
        }
    }
    
    private func assignsData(_ animation: Animation) {
        presetLabel.text = "Preset: \(animation.preset)"
        curveLabel.text = "Curve: \(animation.curve)"
        forceLabel.text = "Force: \(String(format: "%.2f", animation.force))"
        durationLabel.text = "Duration: \(String(format: "%.2f", animation.duration))"
        delayLabel.text = "Delay: \(animation.delay)"
        
        animationView.animation = animation.preset
        animationView.curve = animation.curve
        animationView.force = animation.force
        animationView.duration = animation.duration
        animationView.delay = animation.delay
        animationView.animate()
    }
}

