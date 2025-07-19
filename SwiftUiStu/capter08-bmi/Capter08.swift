//
//  Capter08.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

/// 文本输入框支持输入浮点数
struct FloatTextField: View {
    let title: String
    @Binding var value: Float
    var body: some View {
        TextField(title, text: Binding(
            get: { String(value) },
            set: { value = Float($0) ?? value }
        ))
    }
}

struct Capter08: View {
    @State private var height: Float = 175
    @State private var weight: Float = 65
    @State private var showBMIResultView: Bool = false
    @State private var bmiNum: Float = 0
    @State private var bmiResult: String = "正常"
    @State private var bmiColor: Color = .green
    
    private var inputFormView: some View {
        Form {
            LabeledContent("身高（cm）") {
//                TextField("请输入身高", text: Binding(
//                    get: { String(height) },
//                    set: { height = Float($0) ?? height }
//                ))
//                .foregroundColor(.black)
                FloatTextField(title: "请输入身高", value: $height)
                    .foregroundColor(.black)
            }
            
            LabeledContent("体重（kg）") {
//                TextField("请输入体重", text: Binding(
//                    get: { String(weight) },
//                    set: { weight = Float($0) ?? weight }
//                ))
                FloatTextField(title: "请输入体重", value: $weight)
                .foregroundColor(.black)
            }
        }
        // 右对齐
        .multilineTextAlignment(.trailing)
        .foregroundColor(.gray)
    }
    
    // 参考标准
    private var bmiReferenceView: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: "paperplane")
                Text("参考标准")
                    .font(.title3)
                    .bold()
            }
            
            BMIReferenceItemView(bmiColor: .blue, bmiResult: "过轻", bmiScope: "BMI<=18.5")
            BMIReferenceItemView(bmiColor: .green, bmiResult: "正常", bmiScope: "18.5<BMI<=24")
            BMIReferenceItemView(bmiColor: .yellow, bmiResult: "过重", bmiScope: "24<BMI<=28")
            BMIReferenceItemView(bmiColor: .orange, bmiResult: "肥胖", bmiScope: "28<BMI<=32")
            BMIReferenceItemView(bmiColor: .red, bmiResult: "重度肥胖", bmiScope: "BMI>32")
        }
        .padding()
        .background(.white)
        .cornerRadius(16)
        .padding(.horizontal)
    }
    
    // 计算按钮
    private var computeBtnView: some View {
        Button(action: {
            computeBMI()
            self.showBMIResultView.toggle()
        }) {
            Text("立即计算")
                .font(.system(size: 16))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(.green)
                .cornerRadius(16)
                .padding(.horizontal)
        }
    }
    
    // 更新BMI结果
    func updateBMIResult() {
        switch bmiNum {
        case ...18.5:
            bmiResult = "过轻"
            bmiColor = .blue
        case 18.5 ..< 24:
            bmiResult = "正常"
            bmiColor = .green
        case 24 ..< 28:
            bmiResult = "过胖"
            bmiColor = .yellow
        case 28 ..< 32:
            bmiResult = "肥胖"
            bmiColor = .orange
        default:
            bmiResult = "重度肥胖"
            bmiColor = .red
         }
    }
    
    // 计算BMI
    // BMI = 体重(kg) ÷ 身高²(m²)
    func computeBMI() {
        let squaredHeight = (height / 100) * (height / 100)
        bmiNum = weight / squaredHeight
        updateBMIResult()
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                inputFormView
                
                VStack(spacing: 48) {
                    bmiReferenceView
                    computeBtnView
                }
            }
            .navigationTitle("BMI 计算器")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $showBMIResultView) {
                BMIResultView(height: height, weight: weight, bmiNum: bmiNum, bmiResult: bmiResult, bmiColor: bmiColor)
            }
        }
    }
}

// 参考标准 Item
struct BMIReferenceItemView: View {
    var bmiColor: Color
    var bmiResult: String
    var bmiScope: String
    
    var body: some View {
        HStack(spacing: 20) {
            // 色块
            Rectangle()
                .fill(bmiColor)
                .frame(width: 60, height: 20)
                .cornerRadius(4)
            // 参考结果
            Text(bmiResult)
                .foregroundColor(bmiColor)
            
            Spacer()
            // BMI 范围
            Text(bmiScope)
        }
    }
}

#Preview {
    Capter08()
}
