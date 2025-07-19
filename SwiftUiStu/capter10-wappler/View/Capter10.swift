//
//  Capter10.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

struct Capter10: View {
    
    let imgUrl = "https://img1.baidu.com/it/u=3217838212,795208401&fm=253&fmt=auto&app=138&f=JPEG?w=514&h=500"
    
    @State private var imageID: UUID = UUID()
    
    var body: some View {
//        VStack(spacing: 20) {
//            webImageView
//            refreshBtnView
//        }
        WallpaperGridView()
    }
    
    // 网络图片
    private var webImageView: some View {
        AsyncImage(url: URL(string: imgUrl)) { phase in
            if let image = phase.image {
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .padding()
            } else if phase.error != nil {
                Text("图片加载失败...")
            } else {
                EmptyView()
            }
        }.id(imageID)
    }
    
    // 刷新按钮
    private var refreshBtnView: some View {
        Button(action: {
            self.imageID = UUID()
        }, label: {
            HStack {
                Image(systemName: "gobackward")
                Text("重新加载")
            }
            .foregroundColor(.white)
            .padding()
            .background(.green)
            .cornerRadius(8)
            .padding()
        })
    }
}

#Preview {
    Capter10()
}
