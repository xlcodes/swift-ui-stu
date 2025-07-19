//
//  Capter09.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI
import StoreKit

struct Capter09: View {
    // UserDefaults 是一种以 Key-Value 的方式来存储参数对象的数据存储方式
    @State private var isBellSlash: Bool = UserDefaults.standard.bool(forKey: "isBellSlash")
    // @State private var isDark: Bool = false
    // @AppStorage 属性包装器主要用于处理基本的持久化数据，相当于利用 UserDefaults 对数据进行封装，可以自动完成数据管理和同步工作
    @AppStorage("isDark") private var isDark: Bool = false
    @State private var selectedColor: Color = .blue
    
    @State private var selectedLanguage: String = "简体中文"
    @State private var languages = ["简体中文", "繁体中文", "英语"]
    
    @State private var selectedNumber: Int = 17
    
    var body: some View {
        NavigationStack {
            Form {
                // 常规设置
                Section {
                    notificationToggleView
                    darkModeToggleView
                } header: {
                    Text("常规设置")
                }
                .padding(.vertical, 3)
                
                // 个性化
                Section {
                    colorPickerView
                    languagePickerView
                    fontSizeStepperView
                } header: {
                    Text("个性化设置")
                }
                .padding(.vertical, 6)
                
                // 关于我们
                Section {
                    feedbackBtnView
                    appReviewBtnView
                    aboutAsBtnView
                } header: {
                    Text("关于我们")
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("应用设置")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // 消息通知
    private var notificationToggleView: some View {
        Toggle(isOn: $isBellSlash) {
            HStack {
                Image(systemName: "bell")
                    .font(.system(size: 20))
                Text("消息通知")
            }
        }.onChange(of: isBellSlash) { _, newValue in
            UserDefaults.standard.set(newValue, forKey: "isBellSlash")
        }
    }
    
    // 主题切换 - 深色模式
    private var darkModeToggleView: some View {
        Toggle(isOn: $isDark) {
            HStack {
                Image(systemName: "moon.stars")
                    .font(.system(size: 20))
                Text("深色模式")
            }
        }
        // 主题切换
        .preferredColorScheme(isDark ? .dark : .light)
    }
    
    // 主题色
    private var colorPickerView: some View {
        ColorPicker(selection: $selectedColor, label: {
            HStack{
                Image(systemName: "paintbrush")
                    .font(.system(size: 20))
                Text("主题颜色")
            }
        })
    }
    
    // 系统语言
    private var languagePickerView: some View {
        Picker(selection: $selectedLanguage, label:
            HStack {
                Image(systemName: "waveform")
                    .font(.system(size: 20))
                Text("系统语言")
            }
        ) {
            ForEach(languages, id: \.self) { language in
                Text(language)
            }
        }
    }
    
    // 字体大小
    private var fontSizeStepperView: some View {
        Stepper(value: $selectedNumber, in: 1 ... 48, label: {
            HStack {
                Image(systemName: "a.circle")
                    .font(.system(size: 20))
                Text("字体大小：" + "\(selectedNumber)")
            }
        } )
    }
    
    // 意见反馈
    private var feedbackBtnView: some View {
        Button(action: {}) {
            HStack {
                Image(systemName: "ellipsis.message")
                    .font(.system(size: 20))
                Text("意见反馈")
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // 去 AppStore 评分
    private var appReviewBtnView: some View {
        Button(action: {
            appReview()
        }) {
            HStack {
                Image(systemName: "star")
                    .font(.system(size: 20))
                Text("去 AppStore 评分")
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    func appReview() {
        DispatchQueue.main.async {
            if let scene = UIApplication.shared.connectedScenes.first(
                where:  {
                    $0.activationState == .foregroundActive
                }
            ) as? UIWindowScene {
                
                if #available(iOS 18.0, *) {
                    // iOS 18+ 使用新的API
                    AppStore.requestReview(in: scene)
                } else {
                    // 兼容低版本的 iOS
                    SKStoreReviewController.requestReview(in: scene)
                }
            }
        }
        
    }
    
    // 关于应用
    private var aboutAsBtnView: some View {
        Button(action: {}) {
            HStack {
                Image(systemName: "person")
                    .font(.system(size: 20))
                Text("关于应用")
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    Capter09()
}
