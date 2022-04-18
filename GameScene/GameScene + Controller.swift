//
//  GameScene + Controller.swift
//  WWDC22
//
//  Created by Lucas Alexandre Amorim Leoncio on 06/04/22.
//

import SpriteKit

extension GameScene{
    
    
    internal func showResultGame(result: String?){
        
        guard result != nil else {            
            gameOverScreen.texture = ArrayTexture.resultTexures[2]
            return
        }
        
        if result == "RelaxCard"{
            gameOverScreen.texture = ArrayTexture.resultTexures[0]
        } else{
            gameOverScreen.texture = ArrayTexture.resultTexures[1]
        }
        
    }
    
    internal func startGame(){
        
        let wait = SKAction.wait(forDuration: 1)
        let callNextDay = SKAction.run {
            self.gameScreen.calendar.setNextDay()
        }
        let addText = SKAction.run{
            self.continueFlag = true
            self.alertSituation.showContinue()
        }

        let dayCountAction = SKAction.sequence([wait,callNextDay,wait,callNextDay,wait,callNextDay,addText])
        self.run(dayCountAction)
  
    }
    
    internal func showCards(){
        let showCards = SKAction.run {
            self.gameScreen.relaxCard.isHidden = false
            self.gameScreen.workCard.isHidden = false
            self.alertSituation.isHidden = true
            self.alertSituation.stopAction()
            self.continueFlag = false
            self.alertSituation.nextAlertText()
        }
        
        self.run(showCards)
    }
    
    internal func hiddenCardsAndSetNextCard(){
        let hiddenCardsAndSetNextCard = SKAction.run {
            self.gameScreen.relaxCard.isHidden = true
            self.gameScreen.workCard.isHidden = true
            self.alertSituation.isHidden = false
            self.gameScreen.setNextCard()
        }
        self.run(hiddenCardsAndSetNextCard)
    }
    
    internal func checkGame(node: String){
        if gameScreen.termomethers.adjustThermometers(type: node) == true{
            gameScreen.removeFromParent()
            showResultGame(result: node)
            gameOverScreen.isHidden = false
        } else if gameScreen.calendar.dayCount > 30{
            gameScreen.removeFromParent()
            showResultGame(result: nil)
            gameOverScreen.isHidden = false
        } else{
            hiddenCardsAndSetNextCard()
            startGame()
        }
    }
    
    internal func animateBackground(){
        
        let moveMouseToRight = SKAction.moveTo(x: mouse.position.x + 40, duration: 0.5)
        let mouseBackPosition = SKAction.moveTo(x: mouse.position.x, duration: 1)
        let moveMouseToLeft = SKAction.moveTo(x: mouse.position.x - 40, duration: 0.5)
        
        let wait = SKAction.wait(forDuration: 5)
        let waitRandTime = SKAction.wait(forDuration: Double.random(in: 0.3...1))
        
        let switchKeyboardTextures = SKAction.run {
            self.keyboard.texture = ArrayTexture.keyboardTextures[Int.random(in: 0...7)]
        }
        
        let mouseSequence = SKAction.sequence([wait,moveMouseToRight,moveMouseToLeft,mouseBackPosition])
        let keyboardSequence = SKAction.sequence([switchKeyboardTextures,waitRandTime])
        
        let repeatMouseAction = SKAction.repeatForever(mouseSequence)
        let repeatKeyboardAction = SKAction.repeatForever(keyboardSequence)
        
        let backgroundMusic = SKAudioNode(fileNamed: "musicToWwdc")
                
        keyboard.run(repeatKeyboardAction)
        mouse.run(repeatMouseAction)
        self.addChild(backgroundMusic)
        
    }
    
    
}
