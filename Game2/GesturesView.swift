//
//  THirdView.swift
//  Game2
//
//  Created by Mike on 4/11/25.
//


import Foundation
import UIKit
import QuartzCore


class GesturesView: UIViewController {

    @IBOutlet weak var rotationView: UIView!
    @IBOutlet weak var rotationStatusLabel: UILabel!

    @IBOutlet weak var customGestureView : UIView!
    @IBOutlet weak var customGestureStatusLabel : UILabel!

    // The current angle of the rotation, in radians
    var angle : Float = 0.0

    // Converts self.angle from radians to degrees,
    // and wrap around at 360 degrees
    var angleDegrees : Float {
        get {
            return (self.angle * 180.0 / .pi)
                .truncatingRemainder(dividingBy: 360)
        }
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rotated = #selector(ViewController.rotated(rotationGesture:))
        
        // Set up the rotation gesture
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: rotated)
        
        self.rotationView.isUserInteractionEnabled = true
        self.rotationView.addGestureRecognizer(rotationGesture)
        self.rotationStatusLabel?.text = "\(self.angleDegrees)°"
        

        let downUp = #selector(GesturesView.downUp(downUpGesture:))
        let downUpGesture = DownUpGestureRecognizer(target:self, action:downUp)
        
        self.customGestureView.isUserInteractionEnabled = true
        self.customGestureView.addGestureRecognizer(downUpGesture)
    }

    @objc func downUp(downUpGesture: DownUpGestureRecognizer) {

        switch downUpGesture.state {
        case .began:
            self.customGestureStatusLabel.text = "Gesture began"

        case .changed:
            self.customGestureStatusLabel.text = "Gesture changed, phase = " +
            "\(downUpGesture.phase)"

        case .ended:
            self.customGestureStatusLabel.text = "Gesture ended"

        case .cancelled:
            self.customGestureStatusLabel.text = "Gesture cancelled"

        case .possible:
            self.customGestureStatusLabel.text = "Gesture possible"

        case .failed:
            self.customGestureStatusLabel.text = "Gesture failed"


        }
    }


    // When the rotation changes, update self.angle
    // and use that to rotate the view
    @objc func rotated(rotationGesture : UIRotationGestureRecognizer) {

        switch rotationGesture.state {

        case .changed:
            self.angle += Float(rotationGesture.rotation)

            rotationGesture.rotation = 0.0

            self.rotationView.transform =
                CGAffineTransform(rotationAngle: CGFloat(self.angle))

        default: () // do nothing

        }

        // Display the rotation
        self.rotationStatusLabel?.text = "\(self.angleDegrees)°"

    }

}
