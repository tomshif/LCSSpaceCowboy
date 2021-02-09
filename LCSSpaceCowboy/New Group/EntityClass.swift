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
    
    
    var sprite = SKSpriteNode(imageNamed:"enemyBlack1")
    var laser = SKSpriteNode(imageNamed:"laserRed03")
   // var enemy2 = SKSpriteNode(imageNamed:"enemyBlack2")
   // var enemy3 = SKSpriteNode(imageNamed:"enemyBlack3")
    
    
    // Variables
    var health:CGFloat = 0
    var shieldHealth:CGFloat = 0
    var isAlive:Bool = true
    var enemyMovementType:Int = Int(random(min: 1, max:2.99999))
    // Constants
    var speedY:CGFloat = 5
    var speedX:CGFloat = 10
    // Optionals
    var cactus:Bool = false
    var boss:Bool = false
    var theGame:GameClass?
    var theScene:GameScene?
    
    
    init(scene:GameScene, game:GameClass){
        theScene = scene
        theScene!.gameAnchor.addChild(sprite)
        theScene!.gameAnchor.addChild(laser)
        sprite.position.x = 400
        sprite.position.y = random(min: -400, max: 400)
        sprite.zRotation = CGFloat.pi

        //135
    }//init scene:gamescene
    
    
    init()
    {
        
    } // init()
   // func fireLaser(){
       // let laser=SKSpriteNode(imageNamed: "laserGreen11")
       // laser.position = sprite.position
       // laser.zRotation = sprite.zRotation
       // laser.zPosition = 10
        //laserDaddy.addChild(laser)
               
       // let tempx = cos(laser.zRotation)*1000+laser.position.x
      //  let tempy = sin(laser.zRotation)*1000+laser.position.y
     //   let   laserSeq = SKAction.sequence([SKAction.move(to: CGPoint(x: tempx, y: tempy), duration: 0.25), SKAction.removeFromParent()])
      //  laser.run(laserSeq)
      
           
           
       //}//fired
    
    
    func movement(){
      
        
        // All movement should be modified by the theScene!.gameAnchor.speed in order to handle the time slow
    sprite.position.y += speedY*theScene!.gameAnchor.speed
    if(sprite.position.y > 600){
        speedY = -5
            }//if positon is higher than 600
    if(sprite.position.y < -600){
        speedY = 5
            }//if positon is higher than 600
        if(sprite.position.y < -100){
            speedY = 0
            sprite.position.x -= speedX*theScene!.gameAnchor.speed
            
        }
        if(sprite.position.x < -800){
            sprite.position.x = 800
            if(sprite.position.x == 400){
                speedX = 0
                speedY = 5
                sprite.position.y += speedY*theScene!.gameAnchor.speed
            }//back to normal
        }
    
    
    }//movement function
    
    
    func update(){
    movement()
    }//update
    
    
    
    
} // EntityClass
