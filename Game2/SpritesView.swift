//
//  Sprites.swift
//  Game2
//
//  Created by Mike on 4/12/25.
//

import Foundation
import SpriteKit
//Go to your storyboard and select the view controller in which you want to show SpriteKit content. Select the main view inside the view controller, and change its class to SKView.

//NOTE
//You need to have added the import SpriteKit line of code to at least one file. If you don’t, Xcode won’t add the SpriteKit framework to your code at build time, which means that when the view loads, the SKView class won’t be found, and your app will crash.

//Next, go to your view controller’s implementation, and add the following code to the viewDidLoad method:

class SpritesView:UIViewController {
    var scene3: TestScene!
    var scene4: TestScene!
    let myScene = TestScene()
    var node4: SKNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let spriteView = self.view as? SKView {
            spriteView.showsDrawCount = true
            spriteView.showsFPS = true
            spriteView.showsNodeCount = true
        }
        
        
    }
    
    @IBAction func showScene4(_ sender: Any) {
        if let spriteView = self.view as? SKView {
            let crossFade = SKTransition.crossFade(withDuration: 0.5)
            spriteView.presentScene(scene4, transition: crossFade)
        }
    }
    
    @IBAction func showScene3(_ sender: Any) {
        if let spriteView = self.view as? SKView {
            spriteView.presentScene(scene3)
        }
    }
    
    @IBAction func performActions(_ sender: Any) {
        // In this example, 'node' is any SKNode

        // Move 100 points up and 100 points to the right over 1 second
        let moveUp = SKAction.move(by: CGVector(dx: 100, dy: 100), duration: 1.0)

        // Fade out over 0.5 seconds
        let fadeOut = SKAction.fadeOut(withDuration: 0.5)

        // Run a block of code
        let runBlock = SKAction.run {
            print("Hello!")
        }

        // Remove the node
        let remove = SKAction.removeFromParent()

        // Run the movement and fading blocks at the same time
        let moveAndFade = SKAction.group([moveUp, fadeOut])

        // Move and fade, then run the block, then remove the node
        let sequence = SKAction.sequence([moveAndFade, runBlock, remove])

        // Run these actions on the node
        node4.run(sequence)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        myScene.size = self.view.bounds.size
         
        let sprite = SKSpriteNode(color: SKColor.green, size: CGSize(width: 64, height: 64))
        sprite.position = CGPoint(x: 100, y: 100)
        myScene.addChild(sprite)
                                              

        let textNode = SKLabelNode(fontNamed: "Zapfino")
        textNode.text = "Hello, world!"
        textNode.fontSize = 28
        textNode.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY)
        textNode.name = "helloNode"
        myScene.addChild(textNode)
        
        if let spriteView = self.view as? SKView {
            spriteView.presentScene(myScene)
        }
        
        scene3 = TestScene()
        scene3.size = self.view.bounds.size
        let node3 = SKSpriteNode(color: SKColor.red, size: CGSize(width: 64, height: 64))
        node3.position = CGPoint(x: 100, y: 100)
        scene3.addChild(node3)
        
        scene4 = TestScene()
        scene4.size = self.view.bounds.size
        node4 = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 64, height: 64))
        node4.position = CGPoint(x: 100, y: 100)
        scene4.addChild(node4)
        
                        
    }
    
}
