//
//  Capter01.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

struct Capter01: View {
    var body: some View {
        VStack {
            Spacer()
            Image("testImg")
                .resizable()
                .scaledToFit()
            Spacer()
            Text("微信登录")
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(32)
                .padding()
            
        }
        .padding()
    }
}

#Preview {
    Capter01()
}
