//
//  BMIResultView.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

struct BMIResultView: View {
    var height: Float
    var weight: Float
    var bmiNum: Float
    var bmiResult: String
    var bmiColor: Color
    
    // 声明环境变量
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            computeResultView
            Spacer()
            reComputeBtnView
        }
        // 隐藏上方的返回按钮
        .navigationBarBackButtonHidden(true)
    }
    
    // 重新计算按钮
    private var reComputeBtnView: some View {
        Button(action: {
            // 关闭视图：相当于返回上一层路由
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "gobackward")
                Text("重新计算")
            }
            .font(.system(size: 16))
            .foregroundColor(.white)
            .frame(width: 200, height: 48)
            .background(.blue)
            .cornerRadius(8)
            .padding(.horizontal)
        }
    }
    
    // 计算结果
    private var computeResultView: some View {
        VStack(spacing: 28) {
            Text("你的BMI是")
                .font(.system(size: 16))
                .foregroundColor(.gray)
            
            Text(String(format: "%.2f", bmiNum))
                .font(.system(size: 48))
                .bold()
                .foregroundColor(bmiColor)
            
            Text(bmiResult)
                .font(.system(size: 24))
                .bold()
                .foregroundColor(.white)
                .padding(.vertical, 6)
                .padding(.horizontal, 30)
                .background(bmiColor)
                .cornerRadius(32)
            
            HStack {
                Text(String(format: "%.0f", height) + "cm")
                Text("|")
                Text(String(format: "%.0f", weight) + "kg")
            }
            .font(.system(size: 16))
            .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .padding()
    }
}

#Preview {
    BMIResultView(height: 175, weight: 65, bmiNum: 21.22, bmiResult: "肥胖", bmiColor: .red)
}
