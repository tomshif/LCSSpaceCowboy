//
//  HUDClass.swift
//  SpaceShooter
//
//  Created by LCS Game Design on 1/13/21.
//

import Foundation
import SpriteKit

class HUDClass
{
    var score = SKLabelNode(fontNamed: "arial" )
    
    var hudSheild = SKSpriteNode(imageNamed: "hudSheild")
    
    //var levelMap = SKSpriteNode
    
    var powerUp = SKSpriteNode(imageNamed: "blankPowerUp")
    
    var special1 = SKSpriteNode(imageNamed: "blankSpecial")
    
    var special2 = SKSpriteNode(imageNamed: "blankSpecial")
    
    var special3 = SKSpriteNode(imageNamed: "blankSpecial")
    
    var theScene: GameScene?
    
    // Variables
    
    
    
    // Constants
    
    
    // Optionals
    
    
    
    
    init()
    {
        
    }
    //init
    
    init(scene:GameScene)
    {
        theScene=scene
        
        
        theScene!.hudAnchor.addChild(hudSheild)
        
        theScene!.hudAnchor.addChild(special1)
        
        theScene!.hudAnchor.addChild(special2)
        
        theScene!.hudAnchor.addChild(special3)
        
    }
    // init(gamescene)
    
    func update ()
    {
       func updateScore()
        {
            
        }
        
        func updateCooldown()
        {
            
        }
        
        func updateLevelMap()
        {
            
        }
        
        func updateSheild()
        {
            
        }
        
        func updateSpecial()
        {
            
        }
        //func within the func (funky)
    }
    //Update function
    
    
} // HUDClass

