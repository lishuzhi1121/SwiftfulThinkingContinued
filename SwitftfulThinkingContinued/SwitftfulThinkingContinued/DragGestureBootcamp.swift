//
//  DragGestureBootcamp.swift
//  SwitftfulThinkingContinued
//
//  Created by SandsLee on 2022/3/2.
//

import SwiftUI

struct DragGestureBootcamp: View {
    
    @State private var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack {
                Text("offset: \(offset.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(x: offset.width, y: 0)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        })
            )
        }
    }
    
    
    private func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width * 0.5
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    private func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width * 0.5
        let currentAmount = offset.width
        let percentage = Double(currentAmount / max)
        let maxDegree: Double = 10.0
        return percentage * maxDegree
    }
    
    
}

struct DragGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp()
    }
}
