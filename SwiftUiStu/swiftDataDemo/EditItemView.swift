//
//  EditItemView.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/24.
//

import SwiftUI
import SwiftData

struct EditItemView: View {
    @Binding var myName: String
    @Binding var myPhone: String
    
    @Environment(\.modelContext) var modelContext
    @Query var presons: [SwiftDataItem]
    
    var body: some View {
        VStack {
            Text("更新个人信息记录")
                .font(.title)
                .bold()
            
            TextField("请输入你的姓名", text: $myName)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                }
                .padding()
            
            TextField("请输入你的手机号", text: $myPhone)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                }
                .padding()
            
            Button(action: {
                print("按钮被点击了。。。")
                updateNewPerson()
            }) {
                Text("更新记录")
                    .frame(width: 360, height: 48)
                    .font(.title)
                    .background(.blue)
                    .cornerRadius(12)
                    .foregroundColor(.white)
            }
        }
        .navigationTitle("更新记录")
    }
    
    func updateNewPerson () {
        if let p = presons.first(where: { $0.name == myName }) {
            p.phone = myPhone
            do {
                try modelContext.save()
            } catch {
                print("修改数据异常：\(error.localizedDescription)")
            }
        } else {
            print("当前数据不存在")
        }
    }
}
