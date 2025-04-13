//
//  TestScene.swift
//  Game2
//
//  Created by Mike on 4/12/25.
//

import Foundation
import SpriteKit


class TestScene:SKScene {
    
    var contentCreated = false
    override func didMove(to view: SKView) {
        if self.contentCreated == false {
            self.createSceneContents()
            self.contentCreated = true
        }
    }
    
    func createSceneContents() {
        self.backgroundColor = SKColor.black
        self.scaleMode = SKSceneScaleMode.aspectFit
    }
    
}
