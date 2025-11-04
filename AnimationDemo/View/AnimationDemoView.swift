//
//  AnimationDemoView.swift
//  AnimationDemo
//
//  Created by Didier Delhaisse on 04/11/2025.
//

import SwiftUI

struct AnimationDemoView: View {
    @State private var vm = AnimationDemoViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Animation Demo!")
        }
        .padding()
    }
}

#Preview {
    AnimationDemoView()
}
