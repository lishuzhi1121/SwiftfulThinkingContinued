//
//  ScrollViewReaderBootcamp.swift
//  SwitftfulThinkingContinued
//
//  Created by SandsLee on 2022/3/2.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    
    @State private var text: String = ""
    @State private var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            TextField("Go to # here...", text: $text)
                .frame(height: 55)
                .padding(.horizontal)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button {
                if let index = Int(text) {
                    scrollToIndex = index
                    text = ""
                }
            } label: {
                Text("Go Now!")
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { newValue in
                        withAnimation(.spring()) {
                            proxy.scrollTo(newValue, anchor: .top)
                        }
                    }
                }
            }
        }
    }
}

struct ScrollViewReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderBootcamp()
    }
}
