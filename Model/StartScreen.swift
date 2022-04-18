//
//  StartScreen.swift
//  WWDC22
//
//  Created by Lucas Alexandre Amorim Leoncio on 05/04/22.
//

import SpriteKit

public class StartScreen: SKSpriteNode{
    
    private var button:SKSpriteNode!
    
    public init (){
        super.init(texture: SKTexture(image: #imageLiteral(resourceName: "StartScreen.png")), color: .clear, size: CGSize(width: 400, height: 238))
        
        setButton()
        anchorPoint = CGPoint.zero
        position = CGPoint(x: 485, y: 1024 - 411)
        zPosition = 3
        name = "StartScreen"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setButton(){
        let buttonTexture = SKTexture(image: #imageLiteral(resourceName: "ContinueButton.png"))
        button = SKSpriteNode(texture: buttonTexture, color: .clear, size: CGSize(width: 84, height: 25))
        button.name = "ButtonContinue"
        
        button.anchorPoint = CGPoint.zero
        button.position = CGPoint(x: self.position.x + 290, y: self.position.y + 25)
        button.zPosition = 4
        
        addChild(button)
        
    }
}
