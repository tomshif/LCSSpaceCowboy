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
    var turnRate:CGFloat = 0.08
    var shieldHealth:CGFloat = 0
    var isAlive:Bool = true
    var enemyMovementType:Int = Int(random(min: 1, max:2.99999))
    // Constants
    var speedY:CGFloat = 5
    var speedX:CGFloat = 10
    var speed:CGFloat = 4
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
    
    func pursuePlayer(){
        let dx = theScene!.player!.sprite.position.x - sprite.position.x
        let dy = theScene!.player!.sprite.position.y - sprite.position.y
        var angleToPlayer = atan2(dy,dx)
        if(angleToPlayer < 0){
            angleToPlayer += CGFloat.pi*2
            
        }//anfgl
        if (sprite.zRotation < 0){
            sprite.zRotation += CGFloat.pi*2
        }//sprite angle
        if (sprite.zRotation > CGFloat.pi*2){
            sprite.zRotation -= CGFloat.pi*2
        }//sprite angle
        
        var angleDiff = sprite.zRotation - angleToPlayer
        if(angleDiff < 0){
            angleDiff += CGFloat.pi*2
        }
        if(angleDiff < CGFloat.pi){
            sprite.zRotation -= turnRate
        }//turn RIGHT RIGHT RIGHT RIVGHT RIGHT RIGHT RIGHT RIGHT RIGHT RITGH RIGGGHHHHHT
        else{
            sprite.zRotation += turnRate
            
        }//TURN LEFT LEFT LEFT LEFT LEFT LFETLFET LEFT LEFT LEFT LEFT LEFT
        
        //compute angle difference, rotate towards player.
        let moveX = cos(sprite.zRotation)*speed*theScene!.gameAnchor.speed
        let moveY = sin(sprite.zRotation)*speed*theScene!.gameAnchor.speed
        
        sprite.position.x += moveX
        sprite.position.y += moveY
        
        //move
    
    
    
    }//pursue
    
    
    
    
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
        if(sprite.position.y < -100 ){ //player position here to dive bomb the player
            speedY = 0
            sprite.position.x -= speedX*theScene!.gameAnchor.speed
            
        }
        if(sprite.position.x < -800){
            sprite.position.x = 800
            if(sprite.position.x == 400){
                speedX = 0
                speedY = 5
                sprite.position.y += speedY*theScene!.gameAnchor.speed
            }//back to original position
        }
    
    
    }//movement function
    
    
    func update(){
    //movement() //fix movement then readd in
        pursuePlayer()
    }//update
    
    
    
    
} // EntityClass
