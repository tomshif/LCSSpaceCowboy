//
//  TalentClass.swift
//  SpaceShooter
//
//  Created by LCS Game Design on 1/13/21.
//

import Foundation
import SpriteKit

class TalentClass
{
    // Variables
    var shieldInc:CGFloat = 0
    var damageInc:CGFloat = 0
    var hullInc:CGFloat = 0
    var powerUpDuration: CGFloat = 0
    var activeAbilityCooldown: CGFloat = 0
    var shieldRecharge:CGFloat = 0
    var laserCooldown:CGFloat = 0
    var hullHeal:CGFloat = 0
    var coolDown:Double = 0
    var lastUsed = NSDate()
    var theScene:GameScene?
    
    let SHOTGUNDIST:CGFloat=650
    
    func pulseKnockback()
    {
        
    }//knocks back enemies that are close
    
    func laserBeam()
    {
        
    }//fires a continuous laser
    
    func reflectShield()
    {
        
    }//reflects enemy lasers
    
    func slowTime()
    {
        
    }//slows down enemy movements
    
    func missileSwarm()
    {
        
    }//fires a swarm of missiles that target enemies
    
    func shotgunLaser()
    {
        for _ in (1...12)
        {
            let angle = random(min: -CGFloat.pi/8, max: CGFloat.pi/8)
            let tempLaser=SKSpriteNode(imageNamed: "laserGreen15")
            tempLaser.setScale(0.5)
            let dx=cos(angle)*SHOTGUNDIST+theScene!.player!.sprite.position.x
            let dy=sin(angle)*SHOTGUNDIST+theScene!.player!.sprite.position.y
            tempLaser.position=theScene!.player!.sprite.position
            
            let laserAction=SKAction.sequence([SKAction.move(to: CGPoint(x: dx, y: dy), duration: 0.35),SKAction.removeFromParent()])
            tempLaser.run(laserAction)
            tempLaser.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat.pi*2, duration: 0.25)))
            theScene!.plAnchor.addChild(tempLaser)
            
            
        } // for each shotgun projectile
    }//wide spread laser
    
    func deployMine()
    {
        
    }//deploys mines that explode on contact

    
    
    init()
    {
        
    } // init()
    
    init(scene: GameScene)
    {
        theScene = scene
    }//init gamescene
    
    func update()
    {
        
    }//Update
    
} // TalentClass
