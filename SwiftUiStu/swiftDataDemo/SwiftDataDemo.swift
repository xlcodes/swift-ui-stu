//
//  SwiftDataDemo.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/24.
//

import SwiftUI
import SwiftData

struct SwiftDataDemo: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("SwiftData 数据库教学")
                    .font(.title)
                    .bold()
                
                NavigationLink(destination: NewItemView()) {
                    Text("添加记录")
                        .frame(width: 360, height: 48)
                        .font(.title2)
                        .background(.blue)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                }
                
                NavigationLink(destination: ListItemView()) {
                    Text("查看记录")
                        .frame(width: 360, height: 48)
                        .font(.title2)
                        .background(.blue)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    SwiftDataDemo()
        .modelContainer(for: SwiftDataItem.self, inMemory: true)
}
