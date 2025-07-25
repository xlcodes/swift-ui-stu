//
//  ToastMessageSubView.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/25.
//

import SwiftUI

struct ToastMessageSubView: View {
    
    @Environment(\.showToast) private var showToast
    
    
    var body: some View {
        NavigationView {
            Section {
                Button("测试按钮") {
                    // TODO
                    showToast(.success("这是第二页的成功消息"))
                }
            }
            .navigationTitle("Toast消息副页")
        }
    }
}

#Preview {
    ToastMessageSubView()
}
