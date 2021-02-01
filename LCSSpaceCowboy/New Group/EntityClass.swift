//
//  EntityClass.swift
//  SpaceShooter
//
//  Created by LCS Game Design on 1/13/21.
//

import Foundation
import SpriteKit

class EntityClass
{
    
    func update(){
        
        
        
    }//update()
    
    
    var sprite = SKSpriteNode(imageNamed:"enemyBlack1")
   // var enemy2 = SKSpriteNode(imageNamed:"enemyBlack2")
   // var enemy3 = SKSpriteNode(imageNamed:"enemyBlack3")
    
    
    // Variables
    var health:CGFloat = 0
    var shieldHealth:CGFloat = 0
    var isAlive:Bool = true
    // Constants
    var speed:Int = 0
    
    // Optionals
    var cactus:Bool = false
    var boss:Bool = false
    
   
    var theScene:GameScene?
    init(scene:GameScene){
        theScene = scene
        theScene!.gameAnchor.addChild(sprite)
        sprite.position.x = 400
        
    }//init scene:gamescene
    
    
    init()
    {
        
    } // init()
    
} // EntityClass
