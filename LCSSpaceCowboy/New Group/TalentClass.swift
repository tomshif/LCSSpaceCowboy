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
        for n in (1...5)
        {
            let angle = random(min: -CGFloat.pi/8, max: CGFloat.pi/8)
        }
    }//wide spread laser
    
    func deployMine()
    {
        
    }//deploys mines that explode on contact
    // Constants

    
    // Optionals
    
    
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
