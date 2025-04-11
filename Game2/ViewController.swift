//
//  ViewController.swift
//  Game2
//
//  Created by Mike on 4/5/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animatedView: UIView!
    var animator : UIDynamicAnimator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
     
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

