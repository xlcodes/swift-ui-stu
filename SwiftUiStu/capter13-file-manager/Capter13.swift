//
//  Capter13.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/20.
//

import SwiftUI

struct Capter13: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(.white)
    }
    
    var body: some View {
        TabView {
            Capter13HomeView()
                .tabItem{
                    Label("推荐", systemImage: "square.filled.on.square")
                }
            
            Capter13NoteView()
                .tabItem {
                    Label("笔记", systemImage: "note.text")
                }
        }
    }
}

#Preview {
    Capter13().environmentObject(Capter13ViewModel())
}
