//
//  Capter04.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

struct Capter04: View {
    var body: some View {
        VStack(spacing: 20) {
            // close btn
            HStack {
                Spacer()
                systemImageView
            }
            .padding(.horizontal)
            
            // main container
            VStack(spacing: 32) {
                imageView
                textView
            }
            
        }
        .padding(.vertical, 32)
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .padding()
    }
    // 图片
    private var imageView: some View {
//        Image(systemName: "globe")
//            .imageScale(.large)
//            .foregroundColor(.accentColor)
        Image("demo01")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200)
            .cornerRadius(16)
    }
    // 文字
    private var textView: some View {
        Button(action: {
            // 单击操作
        }) {
            Text("立即订阅")
                .font(.system(size: 18))
                .bold()
                .foregroundColor(.white)
                .frame(width: 120, height: 40)
    //            .padding()
                .background(.green)
                .cornerRadius(32)
        }
    }
    // 图标
    private var systemImageView: some View {
        Button(action: {
            // TODO: 
        }) {
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 23))
                .foregroundColor(Color.gray)
        }
    }
}

#Preview {
    Capter04()
}
