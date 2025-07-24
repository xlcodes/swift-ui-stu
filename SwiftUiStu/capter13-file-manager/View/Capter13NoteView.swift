//
//  Capter13NoteView.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/20.
//

import SwiftUI

// 笔记卡片
struct NoteCard: View {
    var sentence: String
    var create_time: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(sentence)
                    .lineLimit(2)
                Spacer()
                Text(create_time)
                    .foregroundColor(.gray)
            }
        }
            .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 80)
            .padding()
            .background(.white)
            .cornerRadius(16)
            .padding(.horizontal)
    }
}

struct Capter13NoteView: View {
    @EnvironmentObject var viewModel: Capter13ViewModel;
//    @State var viewModel = Capter13ViewModel()

    var body: some View {
        ZStack {
            Color(.systemGray6).edgesIgnoringSafeArea(.all)
            if viewModel.sentenceModel.isEmpty {
                defaultImageView
            } else {
                noteCardList
            }
        }
    }
    
    // 笔记列表
    private var noteCardList: some View {
        ScrollView {
            ForEach(viewModel.sentenceModel) { item in
                NoteCard(sentence: item.sentence, create_time: item.create_time)
                    .contextMenu {
                        Button("删除") {
                            viewModel.deleteNote(id: item.id)
                        }
                    }
            }
        }
    }
    
    // 占位图
    private var defaultImageView: some View {
        Image("001")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .cornerRadius(4)
    }
}

#Preview {
    Capter13NoteView().environmentObject(Capter13ViewModel())
}
