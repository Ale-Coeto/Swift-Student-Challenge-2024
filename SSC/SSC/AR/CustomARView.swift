//
//  File.swift
//  
//
//  Created by Alejandra Coeto on 13/02/24.
//

import ARKit
import RealityKit
import SwiftUI
import Combine

class CustomARView: ARView {
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("init coder not implemented")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        configure()
        subscribeToActionStream()
    }
    
    func configure() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.vertical]
        session.run(configuration)
        addCoaching()
    }
    
    func createAnchor() {
        let anchor = AnchorEntity(world: .zero)
        scene.addAnchor(anchor)
        
    }
    
    private var cancellables: Set<AnyCancellable> = []
    
    func subscribeToActionStream() {
        ARManager.shared
            .actionStream
            .sink { [weak self] action in
                switch action {
                    case .placeHold(let type):
                    self?.loadObj(type)
                        
                    case .removeAllAnchors:
                    self?.scene.anchors.removeAll()
                }
            }
            .store(in: &cancellables)
    }
    
    
    func loadObj(_ hold: String) {
        let box = try? (Entity.load(named: hold))
        addCoaching()
        let m = MeshResource.generateBox(size: 0.1)
        let material = SimpleMaterial(color: .blue, isMetallic: false)
        let entity = ModelEntity(mesh: m, materials: [material])
        
//        let anchor = AnchorEntity(world: SIMD3(x:0.4, y: 0.4, z: 0))
        let anchor = AnchorEntity(.plane(.vertical, classification: .any, minimumBounds: SIMD2(repeating: 0)))
        //Este es el bueno
//        let anchor = AnchorEntity(plane: [ .vertical],
//                                 classification: [.any],
//                                  minimumBounds: [0.2, 0.2])
        
//        anchor.addChild(entity)
        
        anchor.addChild(box ?? entity)
        
        scene.addAnchor(anchor)
//        scene.addAnchor(anchor)
    }
}

extension CustomARView: ARCoachingOverlayViewDelegate {
    func addCoaching() {
        // Create a ARCoachingOverlayView object
        let coachingOverlay = ARCoachingOverlayView()
        // Make sure it rescales if the device orientation changes
        coachingOverlay.autoresizingMask = [
          .flexibleWidth, .flexibleHeight
        ]
        self.addSubview(coachingOverlay)
        // Set the Augmented Reality goal
        coachingOverlay.goal = .verticalPlane
        // Set the ARSession
        coachingOverlay.session = self.session
        // Set the delegate for any callbacks
        coachingOverlay.delegate = self
      }
      // Example callback for the delegate object
//      func coachingOverlayViewDidDeactivate(
//        _ coachingOverlayView: ARCoachingOverlayView
//      ) {
//        self.loadObj("Jug")
//      }
    

}
