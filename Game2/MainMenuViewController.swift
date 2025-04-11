//
//  MainMenuViewController.swift
//  Game2
//
//  Created by Mike on 4/9/25.
//

import Foundation
import UIKit
import QuartzCore


class MainMenuViewController: UIViewController {

    @IBOutlet weak var fish2: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var showBtn: UIButton!
    @IBOutlet weak var fish: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.showBtn.tintColor = UIColor.red

        let image = UIImage(named: "Ball")
        self.showBtn.setBackgroundImage(image, for: .normal)

        self.progressView.progressTintColor = UIColor.orange
        
        UIProgressView.appearance().progressTintColor = UIColor.purple
        
        UINavigationBar.appearance()
            .setBackgroundImage(image, for: UIBarMetrics.default)
    }

    var hidden:Bool = false
    @IBAction func activate(_ sender: Any) {
        if hidden {
            self.fish.alpha = 1
        }
        else{
            UIView.animate(withDuration: 2.0, animations: { () -> Void in
                self.fish.center = CGPoint(x: 0, y: 0)
                self.fish.alpha = 0.50
            })
            
            self.fish.transform =
                CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
        }
        hidden = self.fish.alpha != 1
    }
    
    @IBAction func transform2(_ sender: Any) {
        var transform = CGAffineTransform.identity
        transform = transform.translatedBy(x: 50, y: 0)
        transform = transform.rotated(by: CGFloat(Double.pi / 2))
        transform = transform.scaledBy(x: 0.5, y: 2)

        self.fish.transform = transform
    }
    
    @IBAction func popView(_ sender: Any) {

        let keyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

        keyframeAnimation.keyTimes = [0.0, 0.7, 1.0]

        keyframeAnimation.values = [0.0, 1.2, 1.0]

        keyframeAnimation.duration = 0.4

        keyframeAnimation.timingFunction =
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)

        self.fish2.layer.add(keyframeAnimation, forKey: "pop")
    }
    
    @IBAction func do3D(_ sender: Any) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")

        animation.fromValue = 0.0
        animation.toValue = .pi * 2.0

        animation.repeatCount = Float.infinity
        animation.duration = 2.0

        self.fish.layer.add(animation, forKey: "spin")

        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / 500.0
        self.fish.layer.transform = transform
    }
    
    @IBAction func DoMore(_ sender: Any) {
         let animation = CABasicAnimation(keyPath: "transform.rotation.y")

         animation.fromValue = 0.0
         animation.toValue = .pi * 2.0

         animation.repeatCount = Float.infinity
         animation.duration = 2.0

         self.fish.layer.add(animation, forKey: "spin")

         var transform = CATransform3DIdentity
         transform.m34 = 1.0 / 500.0
         self.fish.layer.transform = transform
    }
    
    @IBAction func RemoveSpin(_ sender: Any) {
        self.fish.layer.removeAnimation(forKey: "spin")
    }
}


