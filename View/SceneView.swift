//
//  SceneView.swift
//  WWDC22
//
//  Created by Lucas Alexandre Amorim Leoncio on 07/04/22.
//

import SwiftUI
import SpriteKit

struct SceneView: View {
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 1366, height: 1024)
        scene.scaleMode = .fill
        return scene
    }

    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
            .statusBar(hidden: true)
    }
}
