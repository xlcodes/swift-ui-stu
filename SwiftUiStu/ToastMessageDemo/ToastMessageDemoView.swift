//
//  ToastMessageDemoView.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/25.
//

import SwiftUI

enum ToastType {
    case success(String)
    case error(String)
    case info(String)
    
    var backgroundColor: Color {
        switch self {
        case .success:
            return Color.green.opacity(0.9)
        case .error:
            return Color.red.opacity(0.9)
        case .info:
            return Color.blue.opacity(0.9)
        }
    }
    
    var icon: Image {
        switch self {
        case .success:
            return Image(systemName: "checkmark.circle")
        case .error:
            return Image(systemName: "xmark.octagon")
        case .info:
            return Image(systemName: "info.circle")
        }
    }
    
    var message: String {
        switch self {
        case .success(let msg), .error(let msg), .info(let msg):
            return msg
        }
    }
}

struct ToastView: View {
    let type: ToastType

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            type.icon
                .foregroundColor(.white)
            Text(type.message)
                .foregroundColor(.white)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .background(type.backgroundColor)
        .cornerRadius(12)
        .shadow(radius: 4)
        .padding(.horizontal, 16)
    }
}

#Preview {
    ToastView(type: .success("自定义成功消息"))
    ToastView(type: .error("自定义失败消息"))
    ToastView(type: .info("自定义提示消息"))
}

struct ShowToastAction {
    typealias Action = (ToastType) -> Void
    let action: Action
    
    func callAsFunction(_ type: ToastType) {
        action(type)
    }
}

extension EnvironmentValues {
    @Entry var showToast = ShowToastAction(action: { _ in })
}

struct ToastModifier: ViewModifier {
    @State private var type: ToastType?
    @State private var dismissTask: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .environment(\.showToast, ShowToastAction(action: { type in
                withAnimation(.easeInOut) {
                    self.type = type
                }
                
                dismissTask?.cancel()
                
                let task = DispatchWorkItem {
                    withAnimation(.easeInOut) {
                        self.type = nil
                    }
                }
                
                self.dismissTask = task
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: task)
            }))
            .overlay(alignment: .top) {
                if let type {
                    ToastView(type: type)
                        .transition(.move(edge: .top).combined(with: .opacity))
                        .padding(.top, 50)
                }
            }
    }
}

extension View {
    func whitToast() -> some View {
        modifier(ToastModifier())
    }
}

struct ToastMessageDemoView: View {
    @Environment(\.showToast) private var showToast
    @State private var isShow = false
    
    var body: some View {
        VStack(spacing: 24) {
            Button("成功消息") {
                showToast(.success("自定义成功提示"))
            }
            Button("失败消息") {
                showToast(.error("自定义失败提示"))
            }
            Button("info消息") {
                showToast(.info("自定义消息提示"))
            }
            Button("显示副页") {
                isShow = true
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .sheet(isPresented: $isShow) {
            ToastMessageSubView()
                .whitToast()
        }
    }
}

#Preview {
    ToastMessageDemoView()
        .whitToast()
}
