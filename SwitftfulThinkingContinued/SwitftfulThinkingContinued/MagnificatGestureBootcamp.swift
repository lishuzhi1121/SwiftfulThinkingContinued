//
//  MagnificatGestureBootcamp.swift
//  SwitftfulThinkingContinued
//
//  Created by SandsLee on 2022/2/25.
//

import SwiftUI

struct MagnificatGestureBootcamp: View {
    
    @State private var currentAmount: CGFloat = 0
    @State private var endAmount: CGFloat = 0
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                HStack {
                    Circle()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.pink)
                    Text("Swiftful Thinking")
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .padding(.horizontal)
                
                Spacer()
                    .frame(height: 300)
                
                HStack {
                    Image(systemName: "heart.fill")
                    Image(systemName: "text.bubble.fill")
                    Spacer()
                }
                .font(.headline)
                .padding(.horizontal)
                
                
                Text("This is the caption for my photo!")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }
            
            Image(uiImage: UIImage(named: "background")!)
                .resizable()
                .frame(height: 300)
                .scaleEffect(1.0 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged({ value in
                            currentAmount = value - 1.0
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                currentAmount = 0
                            }
                        })
                )
            
        }
        
//        Text("Hello, World!")
//            .font(.title)
//            .padding(40)
//            .background(Color.red)
//            .cornerRadius(10)
//            .scaleEffect(1.0 + currentAmount + endAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged({ value in
//                        currentAmount = value - 1.0
//                    })
//                    .onEnded({ value in
//                        endAmount += currentAmount
//                        currentAmount = 0
//                    })
//            )
    }
}

struct MagnificatGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MagnificatGestureBootcamp()
    }
}
