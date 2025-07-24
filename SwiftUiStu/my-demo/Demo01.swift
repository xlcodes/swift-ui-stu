//
//  Demo01.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/24.
//

import SwiftUI

struct Demo01: View {
    @State var count = 0
    var body: some View {
        VStack {
            Text("当前计数：\(count)")
                .onAppear {
                    print("计数当前值为：\(count)")
                }
                .onDisappear {
                    print("Text 被销毁？？？")
                }
            Button("计数+1") {
                count += 1
            }
        }
        .onChange(of: count) {
            oldValue, newValue in
            print("计数从 \(oldValue) 更新为 \(newValue)")
        }
    }
}

#Preview {
    Demo01()
}
