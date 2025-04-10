//
//  MainMenuViewController.swift
//  Game2
//
//  Created by Mike on 4/9/25.
//

import Foundation
import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var ball: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        UIView.animate(withDuration: 2.0, animations: { () -> Void in
            self.ball.center = CGPoint(x: 0, y: 0)
        })
    }


}


