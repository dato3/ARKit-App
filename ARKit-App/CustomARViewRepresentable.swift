//
//  CustomARViewRepresentable.swift
//  ARKit-App
//
//  Created by Daulet on 21.02.2023.
//

import SwiftUI

struct CustomARViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> CustomARView {
        return CustomARView()
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) { }
}
