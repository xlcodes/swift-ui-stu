//
//  Capter11.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/20.
//

import SwiftUI

struct Capter11: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("首页")
                }
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("日历")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("我的")
                }
        }
    }
}

#Preview {
    Capter11()
}
