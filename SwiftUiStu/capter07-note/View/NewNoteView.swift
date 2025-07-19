//
//  NewNoteView.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

struct NewNoteView: View {
    @State private var inputText: String = ""
    
    @Binding var showNoteView: Bool
    @Binding var notes: [Note]
    
    var body: some View {
        VStack(spacing: 20) {
            
            HStack {
                closeBtnView
                Spacer()
                submitBtnView
            }
            .padding()
            inputTextView
            Spacer()
        }
    }
    
    // 文本框
    private var inputTextView: some View {
        TextField("请输入", text: $inputText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
    }
    
    // 关闭按钮
    private var closeBtnView: some View {
        Button(action: {
            self.showNoteView.toggle()
        }) {
            Image(systemName: "chevron.down.circle.fill")
                .font(.system(size: 28))
                .foregroundColor(Color(.systemGray3))
        }
    }
    
    // 完成按钮
    private var submitBtnView: some View {
        Button(action: {
            self.showNoteView.toggle()
            self.notes.append(Note(noteContent: inputText))
        }) {
            Text("完成")
                .font(.system(size: 16))
                .foregroundColor(.white)
                .padding(.all, 8)
                .background(.green)
                .cornerRadius(8)
        }
    }
}

#Preview {
    NewNoteView(showNoteView: .constant(false), notes: .constant([]))
}
