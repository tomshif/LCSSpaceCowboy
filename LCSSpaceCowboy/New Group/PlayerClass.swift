//
//  PlayerClass.swift
//  SpaceShooter
//
//  Created by LCS Game Design on 1/13/21.
//

import Foundation
import SpriteKit

class PlayerClass
{
    var sprite = SKSpriteNode (imageNamed: "enemyBlue1")
    var shieldCurrent:CGFloat = 100
    var shieldCurrentMax:CGFloat = 100
    var shieldBase:CGFloat = 100
    var laserDamageCurrent:CGFloat = 100
    var laserDamageCurrentMax:CGFloat = 100
    var laserDamageBase:CGFloat = 100
    var laserSpeedCurrent:CGFloat = 100
    var laserSpeedCurrentMax:CGFloat = 100
    var laserSpeedBase:CGFloat = 100
    var playerSpeedCurrent:CGFloat = 100
    var playerSpeedBase:CGFloat = 100
    var hullCurrent:CGFloat = 100
    var hullCurrentMax:CGFloat = 100
    var hullBase:CGFloat = 100
    var powerUpTimeCurrent:CGFloat = 100
    var powerUpTimeBase:CGFloat = 100
    var powerUpCooldownCurrent:CGFloat = 100
    var powerUpCooldownBase:CGFloat = 100
    var active1 = TalentClass()
    var active2 = TalentClass()
    var active3 = TalentClass()
    var theScene:GameScene?
    //variables
    
    // Constants
    
    // Optionals
    
    init()
    {
        
    }// init
    
    init(scene:GameScene)
    {
        theScene = scene
        theScene!.gameAnchor.addChild(sprite)
        sprite.position.x = -200
    }// init GameScene
    
    func moveLeft ()
    {
        
    }//moveLeft
    
    func moveRight ()
    {
        
    }//moveRight

    func moveUp ()
    {
        
    }//moveUp
    
    func moveDown ()
    {
        
    }//moveDown
    
    func fireLaser ()
    {
        
    }//fireLaser
    
    func fireActive1 ()
    {
        
    }//fireActive1
    
    func fireActive2 ()
    {
       
    }//fireActive2
    
    func fireActive3 ()
    {
        
    }//fireActive3
    
    func update ()
    {
    
    }//update

} // PlayerClass
