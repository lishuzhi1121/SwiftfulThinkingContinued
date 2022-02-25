//
//  LongPressGestureBootcamp.swift
//  SwitftfulThinkingContinued
//
//  Created by SandsLee on 2022/2/25.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    @State private var isComplete: Bool = false
    @State private var isSuccess: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(width: isComplete ? .infinity : 1)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("CLICK HERE")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 20) {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isSuccess = true
                        }
                    } onPressingChanged: { isPressing in
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    }

                
                Text("RESET")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
        
        
        /*
        Text(isComplete ? "COMPLETED" : "NOT COMPLETE")
            .padding()
            .padding(.horizontal)
            .background(isComplete ? Color.green : Color.gray)
            .cornerRadius(10)
//            .onTapGesture {
//                withAnimation {
//                    isComplete.toggle()
//                }
//            }
            .onLongPressGesture(minimumDuration: 2.0, maximumDistance: 20, perform: {
                withAnimation {
                    isComplete.toggle()
                }
            }, onPressingChanged: { changed in
                // 按压状态改变（按下&松开&达到长按时间）时回调
//                withAnimation {
//                    isComplete = changed
//                }
            })
         */
    }
}

struct LongPressGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureBootcamp()
    }
}
