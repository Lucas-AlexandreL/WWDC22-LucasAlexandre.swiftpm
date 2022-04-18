//
//  File.swift
//  
//
//  Created by Lucas Alexandre Amorim Leoncio on 08/04/22.
//

import SpriteKit

class AlertSituation: SKSpriteNode{
    
    private var alertText:SKLabelNode!
    private var continueText:SKLabelNode!
    private var alertCount:Int = 0
    
    required public init(){
        super.init(texture: SKTexture(imageNamed: "TipsBackground"),color: .clear, size: CGSize(width: 702, height: 436))
        anchorPoint = CGPoint.zero
        setCardText()
        setContinueText()
        name = "alertText"
        position = CGPoint(x: 399, y: 512)
        zPosition = 4
        isHidden = true
        
    }
    
    private func setCardText(){
        alertText = SKLabelNode(fontNamed: "Helvetica-Bold")
        alertText.fontSize = 50
        alertText.name = "alertText"
        alertText.fontColor = .black
        alertText.text = ArrayText.alertMessager[alertCount]
        alertText.verticalAlignmentMode = .center
        alertText.preferredMaxLayoutWidth = 650
        alertText.numberOfLines = 10
        alertText.zPosition = 4
        alertText.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        addChild(alertText)
    }
    
    private func setContinueText(){
        continueText = SKLabelNode(fontNamed: "Helvetica-Bold")
        continueText.fontSize = 25
        continueText.name = "alertText"
        continueText.fontColor = .black
        continueText.text = "Tap to Continue..."
        continueText.numberOfLines = 1
        continueText.zPosition = 4
        continueText.isHidden = true
        continueText.alpha = 0
        continueText.position = CGPoint(x: self.frame.width - 120, y: self.frame.height - 420)
        addChild(continueText)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func nextAlertText(){
        alertCount = alertCount + 1
        alertText.text = ArrayText.alertMessager[alertCount]
    }
    
    public func showContinue(){
        continueText.isHidden = false
        
        let fadeOut = SKAction.fadeOut(withDuration: 1)
        let fadeIn = SKAction.fadeIn(withDuration: 1)
        let sequence = SKAction.sequence([fadeIn,fadeOut])
        let repeatAction = SKAction.repeatForever(sequence)
        
        continueText.run(repeatAction)
        
    }
    
    public func stopAction(){
        continueText.isHidden = true
        continueText.alpha = 0
        continueText.removeAllActions()
    }
    
}

