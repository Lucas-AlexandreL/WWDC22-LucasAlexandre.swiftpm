//
//  WorkCard.swift
//  WWDC22
//
//  Created by Lucas Alexandre Amorim Leoncio on 05/04/22.
//

import SpriteKit

public class WorkCard: SKSpriteNode{
    
    public var cardText: SKLabelNode!
    private var textIndex:Int = 0
    
    public init(){
        super.init(texture: SKTexture(image: #imageLiteral(resourceName: "WorkCard.png")), color: .clear, size: CGSize(width: 374, height: 436))
        setCardText()
        name = "WorkCard"
        isHidden = true
        anchorPoint = CGPoint.zero
        position = CGPoint(x: 377, y: 512)
        zPosition = 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCardText(){
        cardText = SKLabelNode(fontNamed: "Helvetica-Bold")
        cardText.fontSize = 30
        cardText.name = "WorkCard"
        cardText.fontColor = .black
        cardText.text = ArrayText.workCardText[0]
        cardText.verticalAlignmentMode = .center
        cardText.preferredMaxLayoutWidth = 300
        cardText.numberOfLines = 10
        cardText.zPosition = 4
        cardText.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        addChild(cardText)
    }
    
    public func nextCardText(){
        textIndex = textIndex + 1
        cardText.text = ArrayText.workCardText[textIndex]
    }
}
