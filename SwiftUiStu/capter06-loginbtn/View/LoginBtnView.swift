//
//  LoginBtnView.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

// 快捷登录按钮
struct LoginBtnView: View {
    var btnName: String
    var btnTextColor: Color
    var btnBGColor: Color

    var body: some View {
        Text(btnName)
            .foregroundColor(btnTextColor)
            .frame(maxWidth: .infinity, maxHeight: 48)
            .background(btnBGColor)
            .cornerRadius(8)
    }
}
