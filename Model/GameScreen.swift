//
//  GameScreen.swift
//  WWDC22
//
//  Created by Lucas Alexandre Amorim Leoncio on 06/04/22.
//

import SpriteKit

public class GameScreen: SKSpriteNode{
    
    public var calendar:Calendar = Calendar()
    public var termomethers:Thermometers = Thermometers()
    public var workCard:WorkCard = WorkCard()
    public var relaxCard:RelaxCard = RelaxCard()
        
    public init (){
        super.init(texture: .none, color: .clear, size:.zero)

        addChild(termomethers)
        addChild(calendar)
        addChild(relaxCard)
        addChild(workCard)
        
        name = "GameScreen"
        isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNextCard(){
        relaxCard.nextCardText()
        workCard.nextCardText()
    }
    
}
