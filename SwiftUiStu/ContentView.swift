//
//  ContentView.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

struct Example {
    let label: String
    let comp: any View
}

struct ContentView: View {

    var body: some View {
        NavigationStack {
            Form {
                SwiftUiRapidDeve()
            }
            .navigationTitle("SwiftUI 学习示例")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    ContentView()
}
