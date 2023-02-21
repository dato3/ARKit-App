//
//  ARManager.swift
//  ARKit-App
//
//  Created by Daulet on 21.02.2023.
//

import Combine

class ARManager {
    
    static let shared = ARManager()
    
    private init() { }
    
    var actionStream = PassthroughSubject<ARAction, Never>()
}
