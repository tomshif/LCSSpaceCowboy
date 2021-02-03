//
//  GameClass.swift
//  SpaceShooter
//
//  Created by LCS Game Design on 1/13/21.
//

import Foundation
import SpriteKit

class GameClass
{
    // Variables
    var player:PlayerClass?
    var theScene:GameScene?
    var score:Int=0
    
    
    // Constants
    
    
    // Optionals
    
    
    init()
    {
        
    } // init()
    
    init(scene:GameScene)
    {
        theScene=scene
    }
    
} // GameClass
