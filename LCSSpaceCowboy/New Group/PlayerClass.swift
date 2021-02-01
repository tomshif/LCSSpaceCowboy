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
    
    //objects
    var verticalSpeed:CGFloat = 16
    var horizontalSpeed:CGFloat = 10
    var edgeSpeed:CGFloat = 0
    //speeds
    var shieldCurrent:CGFloat = 100
    var shieldCurrentMax:CGFloat = 100
    var shieldBase:CGFloat = 100
    //shields
    var laserDamageCurrent:CGFloat = 100
    var laserDamageCurrentMax:CGFloat = 100
    var laserDamageBase:CGFloat = 100
    //laser damage
    var laserSpeedCurrent:CGFloat = 100
    var laserSpeedCurrentMax:CGFloat = 100
    var laserSpeedBase:CGFloat = 100
    //laser speed
    var lastLaserFire=NSDate()
    let LASER_COOLDOWN:Double=0.1
    //laser creation
    var playerSpeedCurrent:CGFloat = 100
    var playerSpeedBase:CGFloat = 100
    //player speed
    var hullCurrent:CGFloat = 100
    var hullCurrentMax:CGFloat = 100
    var hullBase:CGFloat = 100
    //hull integrity
    var powerUpTimeCurrent:CGFloat = 100
    var powerUpTimeBase:CGFloat = 100
    //power up time
    var powerUpCooldownCurrent:CGFloat = 100
    var powerUpCooldownBase:CGFloat = 100
    //power up cooldown
    var active1 = TalentClass()
    var active2 = TalentClass()
    var active3 = TalentClass()
    //active talents
    var theScene:GameScene?
    //game scene
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
        sprite.position.x += -horizontalSpeed
        
        if sprite.position.x < -theScene!.size.width/2 + sprite.size.width/2
        {
            horizontalSpeed = edgeSpeed
            sprite.position.x = -theScene!.size.width/2 + sprite.size.width/2 + 2
        }
        
        if sprite.position.x > -theScene!.size.width/2 + sprite.size.width/2
        {
            horizontalSpeed = 10
        }
    }//moveLeft
    
    func moveRight ()
    {
        sprite.position.x += horizontalSpeed
        
        if sprite.position.x > -theScene!.size.width/7 + sprite.size.width/2
        {
            horizontalSpeed = edgeSpeed
            sprite.position.x = -theScene!.size.width/7 + sprite.size.width/2 - 2
        }
    }//moveRight

    func moveUp ()
    {
        sprite.position.y += verticalSpeed
        
        if sprite.position.y > theScene!.size.height/2 - sprite.size.height/2
        {
            verticalSpeed = edgeSpeed
            sprite.position.y = theScene!.size.height/2 - sprite.size.height/2 - 1
        }
        
        if sprite.position.y < theScene!.size.height/2 - sprite.size.height/2
        {
            verticalSpeed = 16
        }
    }//moveUp
    
    func moveDown ()
    {
        sprite.position.y -= verticalSpeed
        
        if sprite.position.y < -theScene!.size.height/2 + sprite.size.height/2
        {
            verticalSpeed = edgeSpeed
            sprite.position.y = -theScene!.size.height/2 + sprite.size.height/2 + 4
        }
    }//moveDown
    
    func fireLaser ()
    {
        if -lastLaserFire.timeIntervalSinceNow > LASER_COOLDOWN
        {
            let laser = SKSpriteNode (imageNamed: "laserGreen05")
            laser.position = sprite.position
            laser.zPosition = sprite.zPosition - 1
            theScene!.gameAnchor.addChild(laser)
        }
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
