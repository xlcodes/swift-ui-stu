//
//  Capter05.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

struct Capter05: View {
    let introductionText: String = "小林，IOS独立开发，高级前端开发工程师，稀土掘金技术社区签约作者。他拥有4年前端开发经验，从0到1负责过国内 Top 1上市企业数智化项目的产品规划工作......"
    
    var body: some View {
        ScrollView {
            // 基本信息栏目
            VStack(spacing: 32) {
                // 头像
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color(.systemGray5), lineWidth: 2)
                    )
                    .frame(width: 160)
                
                // 个人信息
                VStack(spacing: 10) {
                    Text("林间有风")
                        .font(.title2)
                        .bold()
                    Text("IOS独立开发")
                        .font(.title2)
                    
                    HStack {
                        Image(systemName: "location.circle.fill")
    //                        .foregroundColor(.gray)
                        Text("成都")
                            .font(.title3)
    //                        .foregroundColor(.gray)
                    }
                    .foregroundColor(.gray)
                }
                
                // 个人简介
                Text(introductionText)
                    .foregroundColor(.gray)
            }
            .padding()
            
            // 个人成就栏目
            HStack {
                VStack(spacing: 10) {
                    Text("30")
                        .font(.title2)
                    Text("关注")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack(spacing: 10) {
                    Text("1157")
                        .font(.title2)
                    Text("关注者")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack(spacing: 10) {
                    Text("1.2W")
                        .font(.title2)
                    Text("掘力值")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
            }
            .padding(.horizontal, 48)
            .padding(.vertical, 24)
            .background(Color(.systemGray6))
            .cornerRadius(16)
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            
            // “专栏列表” 栏目
            VStack {
                ForEach(Article.articles, id: \.title) { item in
                    HStack(spacing: 20) {
                        // 封面
                        Image(item.image)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(4)
                        // 文字信息
                        VStack(alignment: .leading) {
                            HStack {
                                Text(item.title)
                                    .font(.title2)
                                    .bold()
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            HStack(spacing: 20) {
                                Text("\(item.articleName)篇文章")
                                Text("\(item.subscriptionNum)人订阅")
                            }
                            .foregroundColor(.gray)
                        }
                    }
                    .frame(height: 80)
                    .padding(.horizontal)
                }
            }
            .padding(.vertical, 20)
        }
    }
}

#Preview {
    Capter05()
}
