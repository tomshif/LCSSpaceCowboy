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
    let starSpawnDelay:Double=0.25
    
    var cam = SKCameraNode()
    
    var player:PlayerClass?
    
    
    override func didMove(to view: SKView) {
        
        addChild(cam)
        self.camera=cam
        
        
        
        addChild(mmAnchor)
        addChild(gameAnchor)
        addChild(puAnchor)
        cam.addChild(hudAnchor)
        cam.addChild(talentAnchor)
        addChild(starAnchor)
        
        
        changeState(to: GAMESTATE.MAINMENU)

    }// didMove
    
    func touchDown(atPoint pos : CGPoint) {
        switch gameState
        {
        case GAMESTATE.MAINMENU:
            handleMMClick(at: pos)
            
        default:
            break
        } // switch
    } // touchDown
    
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

        case 17: // Test - T --- Show Talent Screen
            if (gameState==GAMESTATE.INGAME)
            {
                changeState(to: GAMESTATE.TALENT)
            }
            else if (gameState==GAMESTATE.TALENT)
            {
                changeState(to: GAMESTATE.INGAME)
            }
            
        case 31:
            if (gameState==GAMESTATE.INGAME)
            {
            
            }
            
            
        case 35: // Test - P
            starAnchor.isPaused.toggle()
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    } // keyDown
    
    func handleMMClick(at: CGPoint)
    {
        for node in mmAnchor.nodes(at: at)
        {
            if node.name != nil
            {
                if node.name! == "mmNewGameButton"
                {
                    mmAnchor.removeAllChildren()
                    changeState(to: GAMESTATE.NEWGAME)
                }
            } // if not nil
        } // for each node at click spot
    } // handleMMClick
    

    
    func changeState(to: Int)
    {
        switch gameState
        {
        case GAMESTATE.PRELOAD:
            if (to == GAMESTATE.MAINMENU)
            {
                loadMainMenuScreen()
            }
            
        case GAMESTATE.MAINMENU:
                if (to == GAMESTATE.NEWGAME)
                {
                    mmAnchor.removeAllChildren()
                    loadNewGame()
                }
        case GAMESTATE.NEWGAME:
            if (to==GAMESTATE.INGAME)
            {
                loadInGame()
            }
            
        case GAMESTATE.INGAME:
            if (to == GAMESTATE.TALENT)
            {
                loadTalentTree()
            }
            
        case GAMESTATE.TALENT:
            if (to == GAMESTATE.INGAME)
            {
                talentAnchor.removeAllChildren()
                gameAnchor.isPaused=false
                starAnchor.isPaused=false
                gameState=to
                
            }
        default:
            print("Invalid gameState change.")
        } // switch
    } // changeState()
    
    func loadMainMenuScreen()
    {
        let mmLogo=SKSpriteNode(imageNamed: "mm_logo")
        mmLogo.position=CGPoint(x: -size.width*0.35, y: size.height*0.35)
        mmLogo.zPosition=10
        mmAnchor.addChild(mmLogo)
        
        let mmFrame=SKSpriteNode(imageNamed: "mmMenuFrame01")
        mmFrame.zPosition=5
        mmAnchor.addChild(mmFrame)
        
        
        let mmNewGameButton=SKSpriteNode(imageNamed: "mm_NewGameButton")
        mmNewGameButton.position.y = mmFrame.size.height*0.3
        mmNewGameButton.zPosition=10
        mmNewGameButton.name="mmNewGameButton"
        mmAnchor.addChild(mmNewGameButton)
        
        let mmLoadGameButton=SKSpriteNode(imageNamed: "mm_LoadGameButton")
        mmLoadGameButton.position.y = 0
        mmLoadGameButton.zPosition=10
        mmLoadGameButton.name="mmLoadGameButton"
        mmAnchor.addChild(mmLoadGameButton)
        
        let mmExitButton=SKSpriteNode(imageNamed: "mm_ExitButton")
        mmExitButton.position.y = -mmFrame.size.height*0.3
        mmExitButton.zPosition=10
        mmExitButton.name = "mmExitButton"
        mmAnchor.addChild(mmExitButton)
        
        
        
        gameState=GAMESTATE.MAINMENU
        
        
        // predraw stars
        for _ in 1...MAXSTARS
        {
            drawStar(existing: true)
        }
    } // loadMainMenuScreen
    
    func loadNewGame()
    {
        gameState=GAMESTATE.NEWGAME
        changeState(to: GAMESTATE.INGAME)
        
    }
    
    func loadInGame()
    {
        gameState=GAMESTATE.INGAME
    }
    
    func loadTalentTree()
    {
        gameAnchor.isPaused=true
        starAnchor.isPaused=true
        gameState=GAMESTATE.TALENT
        let talentFrame=SKSpriteNode(imageNamed: "talentTreeFrame")
        talentAnchor.addChild(talentFrame)
        talentFrame.zPosition=1000
        
    }
    
    
    
    func drawStar(existing: Bool)
    {
        // This function will add a single star to the background and have it move across the screen. It is scaled and speed adjusted for parallax effect.
        
        let tempStar=SKSpriteNode(imageNamed: "star")
        tempStar.position.x = size.width*0.5+tempStar.size.width/2
        tempStar.position.y = random(min: -size.height/2, max: size.height/2)
        let starScale=random(min: 0.1, max: 0.7)
        tempStar.setScale(starScale)
        
        var STARSPEED:Double=20-(10*Double(starScale))
        
        if(existing)
        {
            tempStar.position.x = random(min: -size.width/2, max: size.width/2)
            let distRatio = (size.width/2 + tempStar.position.x)/size.width
            STARSPEED = STARSPEED*Double(distRatio)
        }
        
        let runAction=SKAction.sequence([SKAction.moveTo(x: -size.width/2-tempStar.size.width/2, duration: STARSPEED), SKAction.removeFromParent()])
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
                drawStar(existing: false)
            }
            
            
        case GAMESTATE.INGAME:
            if starAnchor.children.count < MAXSTARS && -lastStarSpawn.timeIntervalSinceNow > starSpawnDelay
            {
                drawStar(existing: false)
            }
            
            
        default:
            break
        } // switch gameState
    } // update()
} // class GameState
