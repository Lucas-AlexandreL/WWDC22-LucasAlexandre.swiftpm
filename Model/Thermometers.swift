//
//  Thermometers.swift
//  WWDC22
//
//  Created by Lucas Alexandre Amorim Leoncio on 05/04/22.
//


import SpriteKit

public class Thermometers:SKSpriteNode {
    
    private var burnoutThermometer:SKSpriteNode!
    private var firedThermometer:SKSpriteNode!
    private var temperatureBurnout:[SKTexture] = ArrayTexture.temperatureBurnoutTextures
    private var temperatureFired:[SKTexture] = ArrayTexture.temperatureFiredTextures
    private var burnoutCount:Int = 0
    private var firedCount:Int = 0
    private var failedResultCheck:String = ""

    
    public init(){
        super.init(texture: SKTexture(image: #imageLiteral(resourceName: "ThermometerScreen.png")), color: .clear, size: CGSize(width: 128, height: 297))
        
        setThermometers()
        anchorPoint = CGPoint.zero
        position = CGPoint(x: 230, y: 512)
        zPosition = 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setThermometers(){

        burnoutThermometer = SKSpriteNode(texture: temperatureBurnout[burnoutCount])
        firedThermometer = SKSpriteNode(texture: temperatureFired[firedCount])
        
        burnoutThermometer.size = CGSize(width: 46, height: 219)
        burnoutThermometer.anchorPoint = CGPoint.zero
        burnoutThermometer.position = CGPoint(x: self.position.x + 11, y: self.position.y + 30)
        burnoutThermometer.zPosition = 4
        
        firedThermometer.size = CGSize(width: 46, height: 219)
        firedThermometer.anchorPoint = CGPoint.zero
        firedThermometer.position = CGPoint(x: burnoutThermometer.position.x + 61, y: burnoutThermometer.position.y)
        firedThermometer.zPosition = 4
        
        addChild(burnoutThermometer)
        addChild(firedThermometer)
    }
    
    public func adjustThermometers(type: String) -> Bool{
        
        switch type{
            
        case "WorkCard":
            burnoutCount = burnoutCount + 1
            if firedCount > 0{
                firedCount = firedCount - 1
            }
        case "RelaxCard":
            firedCount = firedCount + 1
            if burnoutCount > 0{
                burnoutCount = burnoutCount - 1
            }
        default:
            break
        }
        
        burnoutThermometer.texture = temperatureBurnout[burnoutCount]
        firedThermometer.texture = temperatureFired[firedCount]
        
        if burnoutCount | firedCount != 6{
            return false
        } else{
            failedResultCheck = type
            print(type)
            return true
        }
    }
}
