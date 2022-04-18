//
//  ContentView.swift
//  WWDC22
//
//  Created by Lucas Alexandre Amorim Leoncio on 05/04/22.
//

import SpriteKit
import SwiftUI

final class GameScene: SKScene {
        
    internal var background:SKSpriteNode!
    internal var keyboard:SKSpriteNode!
    internal var mouse:SKSpriteNode!
    internal var pcBackground:SKSpriteNode!
    internal let startScreen:StartScreen = StartScreen()
    internal let gameScreen:GameScreen = GameScreen()
    internal let alertSituation:AlertSituation = AlertSituation()
    internal let gameOverScreen:GameOverScreen = GameOverScreen()
    internal var continueFlag:Bool = false
        
    public override func didMove(to view: SKView) {
        animateBackground()
    }

    
    override func sceneDidLoad() {
        addAllNodes()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
                
        if let touch = touches.first{
            let nodeTouched = self.nodes(at: touch.location(in: self)).first
            if nodeTouched?.name == "ButtonContinue"{
                startScreen.removeFromParent()
                gameScreen.isHidden = false
                alertSituation.isHidden = false
                startGame()
                
            }
            
            if "RelaxCard" == nodeTouched?.name || "WorkCard" == nodeTouched?.name{
                checkGame(node: (nodeTouched?.name!)!)
            }
            
            if "alertText" == nodeTouched?.name && continueFlag{
                showCards()
            }
        }
    }
}
