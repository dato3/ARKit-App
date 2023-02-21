//
//  CustomARView.swift
//  ARKit-App
//
//  Created by Daulet on 21.02.2023.
//

import ARKit
import RealityKit
import Combine
import SwiftUI

class CustomARView: ARView {
    
    private var bag: Set<AnyCancellable> = []
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        
        setupActions()
    }
    
    private func setupActions() {
        ARManager.shared
            .actionStream
            .sink { [weak self] (action) in
                switch action {
                case .placeBlock(let color):
                    self?.placeBlock(of: color)
                case .removeAllAnchors:
                    self?.scene.anchors.removeAll()
                }
            }
            .store(in: &bag)
    }
    
    private func placeBlock(of color: Color) {
        let block = MeshResource.generateBox(size: 0.1)
        let material = SimpleMaterial(color: UIColor(color), isMetallic: true)
        let entity = ModelEntity(mesh: block, materials: [material])
        
        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(entity)
        
        scene.addAnchor(anchor)
    }
}
