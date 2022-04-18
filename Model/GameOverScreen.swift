//
//  GameOverScreen.swift
//  WWDC22
//
//  Created by Lucas Alexandre Amorim Leoncio on 06/04/22.
//

import SpriteKit

class GameOverScreen: SKSpriteNode{
    
    public init(){
        super.init(texture: ArrayTexture.resultTexures[0], color: .clear, size: CGSize(width: 702, height: 423))
        anchorPoint = CGPoint.zero
        position = CGPoint(x: 334, y: 520)
        zPosition = 4
        isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
