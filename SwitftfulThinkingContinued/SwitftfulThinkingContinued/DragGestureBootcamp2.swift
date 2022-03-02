//
//  DragGestureBootcamp2.swift
//  SwitftfulThinkingContinued
//
//  Created by SandsLee on 2022/3/2.
//

import SwiftUI

struct DragGestureBootcamp2: View {
    @State private var signUpShow: Bool = false
    @State private var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State private var currentDragOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                Text("\(currentDragOffsetY)")
                Spacer()
            }
            
            MySignUpView(signUpShow: $signUpShow)
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring()) {
                                currentDragOffsetY = value.translation.height
                            }
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                if currentDragOffsetY < -280 {
                                    startingOffsetY = 0
                                    signUpShow = true
                                } else if currentDragOffsetY > 280 {
                                    startingOffsetY = UIScreen.main.bounds.height * 0.85
                                    signUpShow = false
                                }
                                currentDragOffsetY = 0
                            }
                        })
                )
            
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct DragGestureBootcamp2_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp2()
    }
}

struct MySignUpView: View {
    @Binding var signUpShow: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: signUpShow ? "chevron.down" : "chevron.up")
                .padding(.top)
            
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the description of our app. This is my favorite SwiftUI course and I recommend to all of my friends to subscribe to Swift Thinking!")
                .multilineTextAlignment(.center)
            
            Text("CREATE AN ACCOUNT")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black)
                .cornerRadius(10)
            
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
    }
}
