//
//  Capter02.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

struct Capter02: View {
    
    let sentences = [
        "新鲜感总会过去，但责任和教养不会。",
        "不管我本人多么平庸，我总觉得对你的爱很美。",
        "静下来想你，觉得一切都美好得不可思议。",
        "我如果明天收不到你的信，我就摔茶杯。",
        "吾自遇汝以来，常愿天下有情人都成眷属。"
    ]
    
    @State var sentence: String = "";
    
    var body: some View {
        ZStack {
            Image("demo01")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
            Text(sentence).foregroundColor(.white)
        }
        .padding()
        .onAppear(perform: {
            self.sentence = sentences.randomElement() ?? ""
        })
        
        Button(action: {
            self.sentence = sentences.randomElement() ?? ""
        }) {
                Text("修改")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(32)
                    .padding()
        }
    }
}

#Preview {
    Capter02()
}
