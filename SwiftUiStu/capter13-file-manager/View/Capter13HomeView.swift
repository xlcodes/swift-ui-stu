//
//  Captar13HomeView.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/20.
//

import SwiftUI

// 文字卡片
struct TextCard: View {
    var bgColor: Color
    var text: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(bgColor)
                .cornerRadius(16)
                .opacity(0.5)
            
            Text(text)
                .font(.system(size: 20))
                .foregroundColor(.white)
                .padding(32)
        }
        .frame(height: UIScreen.main.bounds.height / 3)
        .padding()
    }
}

struct Capter13HomeView: View {
    @State var sentences: [(Color, String)] = [
        (.red, "在那些心情低落经历挫折的日子，幸好有这么一些图书能赶走阴霾，治愈伤痛。"),
        (.green, "这理应是一个审美多元的年代，每个人都有爱美的权利。"),
        (.blue, "这个世界有无数种可能，专注追寻一种可能，它终将会发生。"),
        (.pink, "最好的教育方式，是真诚述说真实的故事。"),
        (.purple, "文艺感是一直潮流的东西，很多人只是想追随潮流而已。")
    ]
    
    @State private var selectedTabIndex = 0
    @State var sentence: String = ""
//    @State var viewModel = Capter13ViewModel()
    @EnvironmentObject var viewModel: Capter13ViewModel
    
    var body: some View {
        ZStack {
            Color(.systemGray6).edgesIgnoringSafeArea(.all)
            VStack (spacing: 48) {
                slideCard
                copyBtnView
            }
            
        }
        .onAppear() {
            sentence = sentences[selectedTabIndex].1
        }
    }
    // 滑动卡片
    private var slideCard: some View {
        TabView(selection: $selectedTabIndex) {
            ForEach(0..<sentences.count, id: \.self) { index in
                TextCard(bgColor: sentences[index].0, text: sentences[index].1)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: UIScreen.main.bounds.height / 3)
        .onChange(of: selectedTabIndex) { _, newIndex in
            sentence = sentences[newIndex].1
        }
    }
    // 收藏按钮
    private var copyBtnView: some View {
        Button(action: {
            viewModel.addNote(sentence: sentence)
        }, label: {
            Label("收藏", systemImage: "square.filled.on.square")
                .bold()
                .foregroundColor(.white)
                .padding(.vertical)
                .padding(.horizontal, 48)
                .background(.green)
                .cornerRadius(16)
        })
    }
}

#Preview {
    Capter13HomeView().environmentObject(Capter13ViewModel())
}
