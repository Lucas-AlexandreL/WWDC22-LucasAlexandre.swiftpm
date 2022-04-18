//
//  RelaxCard.swift
//  WWDC22
//
//  Created by Lucas Alexandre Amorim Leoncio on 05/04/22.
//

import SpriteKit

public class RelaxCard:SKSpriteNode{
    
    public var cardText: SKLabelNode!
    private var textIndex:Int = 0
    
    public init(){
        super.init(texture: SKTexture(image: #imageLiteral(resourceName: "RelaxCard.png")), color: .clear, size: CGSize(width: 374, height: 436))
        setCardText()
        name = "RelaxCard"
        isHidden = true
        anchorPoint = CGPoint.zero
        position = CGPoint(x: 771, y: 512)
        zPosition = 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCardText(){
        cardText = SKLabelNode(fontNamed: "Helvetica-Bold")
        cardText.fontSize = 30
        cardText.name = "RelaxCard"
        cardText.fontColor = .black
        cardText.verticalAlignmentMode = .center
        cardText.text = ArrayText.relaxCardText[textIndex]
        cardText.preferredMaxLayoutWidth = 300
        cardText.numberOfLines = 10
        cardText.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        cardText.zPosition = 4
        addChild(cardText)
    }
    
    public func nextCardText(){
        self.textIndex = self.textIndex + 1
        cardText.text = ArrayText.relaxCardText[textIndex]
    }
}
