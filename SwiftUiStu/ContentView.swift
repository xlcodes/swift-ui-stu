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
    @State var viewModel = Capter13ViewModel()
    
    var body: some View {
//        NavigationStack {
//            Form {
//                SwiftUiRapidDeve()
//            }
//            .navigationTitle("SwiftUI 学习示例")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//        Capter13().environmentObject(viewModel)
//        SwiftDataDemo()
        ToastMessageDemoView()
            .whitToast()
    }
}

#Preview {
    ContentView()
}
