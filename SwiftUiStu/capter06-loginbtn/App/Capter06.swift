//
//  Capter06.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

struct Capter06: View {
    // 用户是否同意用户条款
    @State var isAgree: Bool = false
    
    var body: some View {
        VStack(spacing: 32) {
            pageImageView
            sloganTextView
            authorizedLoginBtnView
            useAgreenmentView
        }
        .padding(40)
        .background(Color.bgColor)
    }
    
    // 封面图片
    private var pageImageView: some View {
        VStack {
            Spacer()
            Image("avatar")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
        }
    }
    
    // Slogan文字
    private var sloganTextView: some View {
        Text("遇见生活中的美好瞬间")
            .font(.title3)
            .bold()
            .foregroundColor(.purple)
    }
    
    // 快捷登录入口
    private var authorizedLoginBtnView: some View {
        VStack(spacing: 10) {
            Button(action: {
                // todo
            }) {
                LoginBtnView(btnName: "微信登录", btnTextColor: .white, btnBGColor: .green)
            }
            Button(action: {
                // todo
            }) {
                LoginBtnView(btnName: "QQ登录", btnTextColor: .white, btnBGColor: .blue)
            }
            Button(action: {
                // todo
            }) {
                LoginBtnView(btnName: "Apple登录", btnTextColor: .white, btnBGColor: .black)
            }
            Button(action: {
                // todo
            }) {
                LoginBtnView(btnName: "手机号登录", btnTextColor: .black, btnBGColor: Color(.systemGray5))
            }
        }
    }
    
    // 用户条款
    private var useAgreenmentView: some View {
        HStack {
            Button(action: {
                self.isAgree.toggle()
            }) {
                Image(systemName: isAgree ? "checkmark.circle.fill" :  "circle")
                    .foregroundColor(isAgree ? .green : .gray)
            }
            Text("已阅读并同意隐私政策和用户协议")
        }
        .font(.system(size: 14))
        .foregroundColor(.gray)
    }
}

#Preview {
    Capter06()
}
