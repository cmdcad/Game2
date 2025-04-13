//
//  ViewController.swift
//  Game2
//
//  Created by Mike on 4/5/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animatedView: UIView!
    @IBOutlet weak var rotationAngleLabel: UILabel!
    var animator : UIDynamicAnimator?

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
            let rotationGesture = UIRotationGestureRecognizer(target: self,
                                                              action: rotated)

            self.animatedView.isUserInteractionEnabled = true
            self.animatedView.addGestureRecognizer(rotationGesture)

            self.rotationAngleLabel?.text = "\(self.angleDegrees)°"
            
            self.animatedView.isUserInteractionEnabled = true

            let dragged = #selector(ViewController.dragged(dragGesture:))

            let drag = UIPanGestureRecognizer(target: self, action: dragged)
            self.animatedView.addGestureRecognizer(drag)
            
//            // Load the nib
//            let nib = UINib(nibName: "PauseMenu", bundle: nil)
//
//            // Instantiate a copy of the objects stored in the nib
//            let loadedObjects = nib.instantiate(withOwner: self,
//                options: nil)
//            
//            // Try to get the first object, as a UIView
//            if let pauseMenuView = loadedObjects[0] as? UIView {
//                // Add it to the screen and center it
//                self.view.addSubview(pauseMenuView)
//                pauseMenuView.center = self.view.center
//            }
            
            
        }

        // When the rotation changes, update self.angle
        // and use that to rotate the view
        @objc func rotated(rotationGesture : UIRotationGestureRecognizer) {
            switch rotationGesture.state {

            case .changed:
                self.angle += Float(rotationGesture.rotation)

                rotationGesture.rotation = 0.0

                self.animatedView.transform =
                    CGAffineTransform(rotationAngle: CGFloat(self.angle))

            default: () // do nothing

            }

            // Display the rotation
            self.rotationAngleLabel?.text = "\(self.angleDegrees)°"

        }


    @objc func dragged(dragGesture: UIPanGestureRecognizer) {
        if dragGesture.state == .began ||
            dragGesture.state == .changed {

            var newPosition = dragGesture.translation(in: dragGesture.view)
            newPosition.x += dragGesture.view!.center.x
            newPosition.y += dragGesture.view!.center.y

            dragGesture.view!.center = newPosition
            dragGesture.setTranslation(CGPoint.zero, in: dragGesture.view)
        }
    }


    @IBAction func bounce(_ sender: Any) {
           
           self.animator = UIDynamicAnimator(referenceView: self.view)
           let gravity = UIGravityBehavior(items: [self.animatedView])
           self.animator?.addBehavior(gravity)


           let collision = UICollisionBehavior(items: [self.animatedView])
           collision.translatesReferenceBoundsIntoBoundary = true

           collision.setTranslatesReferenceBoundsIntoBoundary(
               with: UIEdgeInsets(top: 10,
                                  left: 10,
                                  bottom: 10,
                                  right: 10))
           
           // Anchor = top of the screen, centered
   //        let anchor = CGPoint(x: self.view.bounds.width / 2, y: 0)
   //
   //        let attachment = UIAttachmentBehavior(item: self.animatedView,
   //            attachedToAnchor: anchor)

         //  self.animator?.addBehavior(attachment)
           
           self.animator?.addBehavior(collision)
    }
}

