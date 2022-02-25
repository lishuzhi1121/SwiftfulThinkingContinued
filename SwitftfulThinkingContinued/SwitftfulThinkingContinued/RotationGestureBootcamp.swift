//
//  RotationGestureBootcamp.swift
//  SwitftfulThinkingContinued
//
//  Created by SandsLee on 2022/2/25.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    @State private var angle: Angle = .zero
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(50)
            .background(Color.blue)
            .cornerRadius(10)
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged({ value in
                        angle = value
                    })
                    .onEnded({ value in
                        withAnimation {
                            angle = .zero
                        }
                    })
            )
    }
}

struct RotationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureBootcamp()
    }
}
