//
//  GameScene + AddNodes.swift
//  WWDC22
//
//  Created by Lucas Alexandre Amorim Leoncio on 05/04/22.
//

import SpriteKit

extension GameScene{
    
    internal func addAllNodes(){
        
        addChild(gameScreen)
        addChild(startScreen)
        addChild(gameOverScreen)
        addChild(alertSituation)
        
        createBackground()
        createPcBackground()
        createKeyboardAndMouse()
    }

    internal func createBackground() {
        let backgroundTexture = SKTexture(image: #imageLiteral(resourceName: "Background.png"))
        
        background = SKSpriteNode(texture: backgroundTexture)
        background.zPosition = 0
        background.anchorPoint = CGPoint.zero
        background.position = CGPoint(x: 0, y: 0)
        addChild(background)
    }
    
    internal func createPcBackground(){
        
        let pcBackgroundTexture = SKTexture(image: #imageLiteral(resourceName: "BackgroundPc.png"))
        
        pcBackground = SKSpriteNode(texture: pcBackgroundTexture)
        pcBackground.zPosition = 0
        pcBackground.anchorPoint = CGPoint.zero
        pcBackground.position = CGPoint(x: 201, y: 1024 - 526)
        addChild(pcBackground)
        
    }
    
    internal func createKeyboardAndMouse(){
        let keyboardTexture = SKTexture(image: #imageLiteral(resourceName: "Keyboard1"))
        
        keyboard = SKSpriteNode(texture: keyboardTexture)
        keyboard.zPosition = 1
        keyboard.anchorPoint = CGPoint.zero
        keyboard.position = CGPoint(x: 269, y: 78)
        addChild(keyboard)
        
        let mouseTexture = SKTexture(image: #imageLiteral(resourceName: "Mouse.png"))
        
        mouse = SKSpriteNode(texture: mouseTexture)
        mouse.zPosition = 1
        mouse.anchorPoint = CGPoint.zero
        mouse.position = CGPoint(x: 958, y: 78)
        addChild(mouse)
    }
    
}
