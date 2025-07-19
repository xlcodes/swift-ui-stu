//
//  Capter07.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

struct Capter07: View {
    @State private var notes = Note.notes
    @State private var showNoteView: Bool = false
    
    var body: some View {
        // 视图布局
        ZStack(alignment: .bottomTrailing) {
            VStack {
                noteTitleView
                noteListView
            }
            addBtnView
        }
        // 打开弹窗功能实现
        .sheet(isPresented: $showNoteView) {
            NewNoteView(showNoteView: $showNoteView, notes: $notes)
                .presentationDetents([.medium])
        }
    }
    
    private var noteTitleView: some View {
        Text("Note笔记")
            .font(.title)
            .bold()
    }
    
    private var noteListView: some View {
        List($notes, editActions: .all) { $note in
            Text(note.noteContent)
        }
        .listStyle(.plain)
    }
    
    private var addBtnView: some View {
        Button(action: {
            self.showNoteView.toggle()
        }) {
          Image(systemName: "plus.circle.fill")
                .font(.system(size: 48))
                .padding(.horizontal)
        }
    }
}

#Preview {
    Capter07()
}
