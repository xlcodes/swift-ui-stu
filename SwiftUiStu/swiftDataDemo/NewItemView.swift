//
//  NewItemView.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/24.
//

import SwiftUI
import SwiftData

struct NewItemView: View {
    @State var myName: String = ""
    @State var myPhone: String = ""
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            Text("个人信息记录")
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
                createNewPerson()
            }) {
                Text("新建记录")
                    .frame(width: 360, height: 48)
                    .font(.title)
                    .background(.blue)
                    .cornerRadius(12)
                    .foregroundColor(.white)
            }
        }
        .navigationTitle("新建记录")
    }
    
    func createNewPerson () {
        if myName != "" && myPhone != "" {
            let newPerson = SwiftDataItem(name: myName, phone: myPhone)
            modelContext.insert(newPerson)
        } else {
            print("请输入姓名和手机号")
        }
    }
}

#Preview {
    NewItemView()
}
