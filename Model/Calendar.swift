//
//  Calendar.swift
//  WWDC22
//
//  Created by Lucas Alexandre Amorim Leoncio on 05/04/22.
//

import SpriteKit

public class Calendar:SKSpriteNode {
    
    private var dateText:SKLabelNode!
    private var dayTextCount:SKLabelNode!
    public var dayCount:Int = 1

    public init(){
        super.init(texture: SKTexture(image: #imageLiteral(resourceName: "Calendar.png")), color: .clear, size: CGSize(width: 128, height: 128))
        
        setDate()
        anchorPoint = CGPoint.zero
        position = CGPoint(x: 230, y: 819)
        zPosition = 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDate(){
        
        dateText = SKLabelNode(fontNamed: "Helvetica-Bold")
        dateText.fontColor = .black
        dateText.text = "DAY"
        dateText.preferredMaxLayoutWidth = 90
        dateText.numberOfLines = 2
        dateText.fontSize = 42
        dateText.position = CGPoint(x: self.frame.maxX , y: self.frame.maxY * 0.70)
        dateText.zPosition = 4
        addChild(dateText)
        
        dayTextCount = SKLabelNode(fontNamed: "Helvetica-Bold")
        dayTextCount.text = "\(dayCount)"
        dayTextCount.fontColor = .black
        dayTextCount.verticalAlignmentMode = .top
        dayTextCount.position = CGPoint(x: self.frame.maxX , y: self.dateText.frame.minY)
        dayTextCount.preferredMaxLayoutWidth = 90
        dayTextCount.fontSize = 42
        dayTextCount.zPosition = 4
        
        addChild(dayTextCount)
        
    }
    
    public func setNextDay(){
        dayCount = dayCount + 1
        dayTextCount.text = "\(dayCount)"
    }
}
