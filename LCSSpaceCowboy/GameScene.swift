//
//  GameScene.swift
//  LCSSpaceCowboy
//
//  Created by Tom Shiflet on 1/22/21.
//  Copyright © 2021 LCS Game Design. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var mmAnchor=SKSpriteNode()
    var gameAnchor = SKSpriteNode()
    var puAnchor=SKSpriteNode()
    var hudAnchor=SKSpriteNode()
    var talentAnchor=SKSpriteNode()
    var starAnchor=SKSpriteNode()
    
    var gameState:Int = -1
    
    var currentPopUp:PopUpClass?
    

    let MAXSTARS:Int=100
    var lastStarSpawn=NSDate()
    let starSpawnDelay:Double=0.15
    
    override func didMove(to view: SKView) {
        
        addChild(mmAnchor)
        addChild(gameAnchor)
        addChild(puAnchor)
        addChild(hudAnchor)
        addChild(talentAnchor)
        addChild(starAnchor)
        
        
        changeState(to: GAMESTATE.MAINMENU)

    }
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {
 
    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {

        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    
    func changeState(to: Int)
    {
        switch gameState
        {
        case GAMESTATE.PRELOAD:
            if (to == GAMESTATE.MAINMENU)
            {
                loadMainMenuScreen()
            }
            
        default:
            print("Invalid gameState change.")
        } // switch
    } // changeState()
    
    func loadMainMenuScreen()
    {
        gameState=GAMESTATE.MAINMENU
        
    }
    
    func drawStar()
    {
        // This function will add a single star to the background and have it move across the screen. It is scaled and speed adjusted for parallax effect.
        
        let tempStar=SKSpriteNode(imageNamed: "star")
        tempStar.position.x = size.width*0.5+tempStar.size.width/2
        tempStar.position.y = random(min: -size.height/2, max: size.height/2)
        let starScale=random(min: 0.5, max: 1.0)
        tempStar.setScale(starScale)
        
        let STARSPEED:Double=15-(10*Double(starScale))
        
        let runAction=SKAction.sequence([SKAction.moveTo(x: -size.width/2, duration: STARSPEED), SKAction.removeFromParent()])
        tempStar.run(runAction)
        
        tempStar.colorBlendFactor=1
        tempStar.color=NSColor(calibratedRed: random(min: 0.7, max: 1), green: random(min: 0.7, max: 1), blue: random(min: 0.7, max: 1), alpha: 1)
        
        starAnchor.addChild(tempStar)
        lastStarSpawn=NSDate()
        
    } // drawStar
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        switch gameState
        {
        case GAMESTATE.MAINMENU:
            if starAnchor.children.count < MAXSTARS && -lastStarSpawn.timeIntervalSinceNow > starSpawnDelay
            {
                drawStar()
            }
            
        default:
            break
        } // switch gameState
    } // update()
} // class GameState
