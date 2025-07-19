//
//  Capter03.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

/// 自定义按钮样式
struct CustomButtonStyle: ButtonStyle {
    var bgColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding(.horizontal, 32)
            .padding(.vertical, 12)
            .background(bgColor)
            .cornerRadius(8)
    }
}

struct Capter03: View {
    
    @State var isStarted: Bool = false
    @State var isPaused: Bool = false
    
    var body: some View {
        VStack {
            if isPaused {
                HStack {
                    Button("停止") {
                        self.isStarted = false
                        self.isPaused = false
                    }
                    .buttonStyle(CustomButtonStyle(bgColor: .red))
                    
                    Button("继续") {
                        self.isPaused = false
                    }
                    .buttonStyle(CustomButtonStyle(bgColor: .green))
                }
            } else {
                Button(isStarted ? "暂停" : "开始") {
                    withAnimation {
                        if !isStarted {
                            self.isStarted = true
                        } else {
                            self.isPaused = true
                        }
                    }
                }
                .buttonStyle(CustomButtonStyle(bgColor: isStarted ? .gray : .blue))
                .transition(.asymmetric(insertion: .slide, removal: .scale))
//                .transition(.scale.combined(with: .slide))
            }
            

//            Button("开始") {
//                
//            }.buttonStyle(.borderedProminent)
//            
//            Button("继续") {
//                // TODO:
//            }.buttonStyle(CustomButtonStyle(bgColor: .blue))
//            .font(.system(size: 20))
//            .foregroundColor(.white)
//            .padding(.horizontal, 32)
//            .padding(.vertical, 10)
//            .background(.blue)
//            .cornerRadius(8)
//            
//            Button("停止") {
//                // TODO:
//            }.buttonStyle(CustomButtonStyle(bgColor: .red))
//            .font(.system(size: 20))
//            .foregroundColor(.white)
//            .padding(.horizontal, 32)
//            .padding(.vertical, 10)
//            .background(.red)
//            .cornerRadius(8)
        }
        .animation(.easeOut(duration: 0.3), value: isPaused)
        .animation(.spring(), value: isStarted)
    }
}

#Preview {
    Capter03()
}
