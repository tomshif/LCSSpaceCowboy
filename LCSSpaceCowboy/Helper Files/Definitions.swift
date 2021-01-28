//
//  Definitions.swift
//  LCSSpaceCowboy
//
//  Created by Tom on 1/28/21.
//  Copyright © 2021 LCS Game Design. All rights reserved.
//

import Foundation

struct GAMESTATE
{
    static let PRELOAD:Int = -1
    static let MAINMENU:Int = 1
    static let INGAME:Int = 2
    static let TALENT:Int=3
    static let LOADGAME:Int=4
    static let NEWGAME:Int=5
    
    static let POPUP:Int=100

}

struct POPTYPE
{
    static let DISABLED:Int = -1
    static let YESNO:Int = 1
    static let INFO:Int = 2
}

struct PUBUTTONS
{
    static let ERROR:Int = -1
    static let NO:Int=0
    static let YES:Int=1
    static let OK:Int=5
} // PUBUTTONS
