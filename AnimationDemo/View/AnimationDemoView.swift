//
//  AnimationDemoView.swift
//  AnimationDemo
//
//  Created by Didier Delhaisse on 04/11/2025.
//

import SwiftUI

struct AnimationDemoView: View {
    @State private var model = AnimationDemoViewModel()

    var body: some View {
        @Bindable var vm = model        // projection for controls

        GeometryReader { geo in
            VStack {
                TimelineView(.animation) { ctx in
                    let t = ctx.date.timeIntervalSinceReferenceDate * vm.speed

                    // use the correct initializer (requires iOS 17/macOS 14)
                    let function = ShaderFunction(library: .default, name: "lavaLampShader")
                    let shader = Shader(function: function, arguments: [
                        .float2(Float(geo.size.width), Float(geo.size.height)),
                        .float(Float(t)),
                        .float(vm.threshold),
                        .float(vm.distanceFactor),
                        .color(vm.palette.bottom),
                        .color(vm.palette.top)
                    ])

                    ZStack {
                        RoundedRectangle(cornerRadius: vm.rounded)
                            .fill(.black)
                            .overlay(
                                Rectangle()
                                    .fill(.clear)
                                    .layerEffect(shader, maxSampleOffset: .zero)
                                    .clipShape(RoundedRectangle(cornerRadius: vm.rounded))
                            )

                        if vm.showFrame {
                            RoundedRectangle(cornerRadius: vm.rounded)
                                .stroke(.white.opacity(0.08), lineWidth: 1)
                        }
                    }
                    .padding(16)
                    .background(.black)
                }

                Picker("Phase", selection: $vm.phase) {
                    ForEach(FlightPhase.allCases) { phase in
                        Text(phase.rawValue.capitalized).tag(phase)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                Toggle("Frame", isOn: $vm.showFrame)
                    .tint(.orange)
                    .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    AnimationDemoView()
}
