//
//  SwiftUiRapidDeve.swift -> SwiftUI 极简开发
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/20.
//

import SwiftUI

struct SwiftUiRapidDeve: View {
    var body: some View {
        Section {
            NavigationLink {
                Capter01()
            } label: {
                Text("capter01 - 图片按钮")
            }
            .font(.title3)
            .foregroundColor(Color(.systemGray))
            
            NavigationLink {
                Capter02()
            } label: {
                Text("capter02 - 随机字符串")
            }
            .font(.title3)
            .foregroundColor(Color(.systemGray))
            
            NavigationLink {
                Capter03()
            } label: {
                Text("capter03 - 状态示例")
            }
            .font(.title3)
            .foregroundColor(Color(.systemGray))
            
            NavigationLink {
                Capter04()
            } label: {
                Text("capter04 - 订阅卡片")
            }
            .font(.title3)
            .foregroundColor(Color(.systemGray))
            
            NavigationLink {
                Capter05()
            } label: {
                Text("capter05 - 个人简介")
            }
            .font(.title3)
            .foregroundColor(Color(.systemGray))
            
            NavigationLink {
                Capter06()
            } label: {
                Text("capter06 - 登录按钮")
            }
            .font(.title3)
            .foregroundColor(Color(.systemGray))
            
            NavigationLink {
                Capter07()
            } label: {
                Text("capter07 - 笔记应用")
            }
            .font(.title3)
            .foregroundColor(Color(.systemGray))
            
            NavigationLink {
                Capter08()
            } label: {
                Text("capter08 - BMI计算器")
            }
            .font(.title3)
            .foregroundColor(Color(.systemGray))
            
            NavigationLink {
                Capter09()
            } label: {
                Text("capter09 - 设置页案例")
            }
            .font(.title3)
            .foregroundColor(Color(.systemGray))
            
            NavigationLink {
                Capter10()
            } label: {
                Text("capter10 - 壁纸示例")
            }
            .font(.title3)
            .foregroundColor(Color(.systemGray))
            
            NavigationLink {
                Capter11()
            } label: {
                Text("capter11 - MVVM开发模式")
            }
            .font(.title3)
            .foregroundColor(Color(.systemGray))
            
        } header: {
            Text("SwiftUI 极简开发")
        }
    }
}

#Preview {
    SwiftUiRapidDeve()
}
