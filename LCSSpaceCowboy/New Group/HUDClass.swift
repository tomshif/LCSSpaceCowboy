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
        
    //theScene!.size.width
    
    theScene!.hudAnchor.addChild(powerUp)
        powerUp.position.x = theScene!.size.width*0.45
        powerUp.position.y = -theScene!.size.height*0.40
        
    theScene!.hudAnchor.addChild(hudSheild)
        hudSheild.position.x = -theScene!.size.width*0.48
        hudSheild.position.y = -theScene!.size.height*0.40
        
        theScene!.hudAnchor.addChild(special1)
        special1.position.x = -theScene!.size.width*0.45
        special1.position.y = -theScene!.size.height*0.20

        
    theScene!.hudAnchor.addChild(special2)
        special2.position.x = -theScene!.size.width*0.45
        special2.position.y = -theScene!.size.height*0.30

        
    theScene!.hudAnchor.addChild(special3)
        special3.position.x = -theScene!.size.width*0.45
        special3.position.y = -theScene!.size.height*0.10
        
    theScene!.hudAnchor.addChild(score)
        score.text = "Score: "
        score.fontSize = 25
        score.fontColor = NSColor.white
        score.position.x = theScene!.size.width*0.2
        score.position.y = theScene!.size.height*0.44
        

        
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

