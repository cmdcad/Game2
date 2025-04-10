//
//  GameObject.swift
//  Game2
//
//  Created by Mike on 4/5/25.
//

import Foundation
import GameplayKit

class GraphicsComponent:GKComponent {
    override func update(deltaTime seconds: TimeInterval) {
        print("Drawing Graphics")
    }
}

class PhysicsComponent : GKComponent {
    override func update(deltaTime seconds: TimeInterval) {
        print("simulating physics!")
    }
}

//let entity = GKEntity()
//entity.addComponent(GraphicsComponent())
//entity.addComponent(PhysicsComponent())
//
//for entity in entities {
//    entity.update(deltaTime: 0.0333)
//}


class GameObject {
    func update(deltaTime: Float){
        
    }
    
    var components: [Component] = []
    
    func add(component: Component){
        components.append(component)
        component.gameObject = self
        
        if let index = components.firstIndex(where: {$0 === component}){
            component.gameObject = nil
            components.remove(at: index)
        }
    }
    
    func update(deltaName: Float) {
        for component in self.components {
            component.update(deltaTime: deltaName)
        }
    }
    
    func findComponent<T:Component> () -> T?{
        for component in self.components {
            if let theComponent = component as? T {
                return theComponent
            }
        }
        return nil;
    }
    
    func findComponents<T:Component>() -> [T] {
        var foundComponents:[T] = []
        
        for component in self.components {
            if let theComponent = component as? T {
                foundComponents.append(theComponent)
            }
        }
        return foundComponents
    }
    
    
    
    
    class DamageTaking: Component {
        var hitpoints : Int = 10
        
        func takeDamage(amount: Int){
            hitpoints -= amount
        }
        
//        let monster = GameObject()
//        monster.add(component: DamageTaking())
//        
//        let damage : DamageTaking? = monster.findComponent()
//        damage?.takeDamage(amount: 5)
        
       
    }
}

class monster: GameObject {
    var hitPoints: Int = 10
    var target:GameObject?
    
    override func update(deltaTime: Float) {
       
    }
}

class Component {
    var gameObject:GameObject?
    
    func update(deltaTime: Float) {
        
    }
}
 
class GameNode: GKGridGraphNode {
    var name:String
    
    init(name:String, gridPosition:vector_int2){
        self.name = name
        super.init(gridPosition: gridPosition)
    }
    
    override var description: String {
        return self.name
    }
    
    required init?(coder aDecoder:NSCoder){
        fatalError("not implemented")
    }
}


func controls(){
    
    func add<NodeType>(node:NodeType, to graph:GKGridGraph<NodeType>){
        if let existingNode = graph.node(atGridPosition: node.gridPosition) {
            graph.remove([existingNode])
        }
        
        graph.connectToAdjacentNodes(node: node)
    }
    
//    let playerNode = GameNode(name: "Player", gridPosition: [0,2])
//    let exitNode = GameNode(name: "Exit", gridPosition: [0,3])

//    add(node: playerNode, to: graph)
//    add(node: exitNode, to: graph)
}


 
