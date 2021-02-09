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
    //player
    var verticalSpeed:CGFloat = 16
    var horizontalSpeed:CGFloat = 10
    var edgeSpeed:CGFloat = 0
    //speeds
    var shieldCurrent:CGFloat = 10
    var shieldCurrentMax:CGFloat = 100
    var shieldBase:CGFloat = 100
    //shields
    var lastShieldFail=NSDate()
    let SHIELD_COOLDOWN:Double=5
    //shield physics
    var laserDamageCurrent:CGFloat = 100
    var laserDamageCurrentMax:CGFloat = 100
    var laserDamageBase:CGFloat = 100
    //laser damage
    var laserSpeedCurrent:CGFloat = 100
    var laserSpeedCurrentMax:CGFloat = 100
    var laserSpeedBase:CGFloat = 100
    //laser speed
    var lastLaserFire=NSDate()
    let LASER_COOLDOWN:Double=0.15
    //laser physics
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
        theScene!.plAnchor.addChild(sprite)
        sprite.position.x = -200
    }// init GameScene
    
    func moveLeft ()
    {
        sprite.position.x += -horizontalSpeed*theScene!.plAnchor.speed
        
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
        sprite.position.x += horizontalSpeed*theScene!.plAnchor.speed
        
        if sprite.position.x > -theScene!.size.width/7 + sprite.size.width/2
        {
            horizontalSpeed = edgeSpeed
            sprite.position.x = -theScene!.size.width/7 + sprite.size.width/2 - 2
        }
    }//moveRight

    func moveUp ()
    {
        sprite.position.y += verticalSpeed*theScene!.plAnchor.speed
        
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
        sprite.position.y -= verticalSpeed*theScene!.plAnchor.speed
        
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
            laser.zRotation = sprite.zRotation
            laser.zPosition = sprite.zPosition - 1
            theScene!.plAnchor.addChild(laser)
            
            let tempx = cos(laser.zRotation)*1000 + sprite.position.x
            let tempy = sin(laser.zRotation)*1000 + sprite.position.y
            
            let laserSeq = SKAction.sequence([SKAction.move(to: CGPoint(x: tempx, y: tempy), duration: 0.3), SKAction.removeFromParent()])
            laser.run(laserSeq)
            lastLaserFire=NSDate()
        }
    }//fireLaser
    
    func shieldRegen ()
    {
        if -lastShieldFail.timeIntervalSinceNow > SHIELD_COOLDOWN
        {
            if shieldCurrent < shieldCurrentMax
            {
                shieldCurrent += 0.0166
            }
        }
    }//shieldRegen
    
    func damage (amount:CGFloat)
    {
        shieldCurrent -= amount
        if (shieldCurrent < 0)
        {
            hullCurrent += shieldCurrent
            shieldCurrent = 0
        }
    }//damage
    
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
