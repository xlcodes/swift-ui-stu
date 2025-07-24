//
//  FaceIDAuthManager.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/20.
//

import SwiftUI
import LocalAuthentication

class FaceIDAuthManager: ObservableObject {
    @Published var isFaceIDAuthenticated = false
    
    func authenticateWithFaceID() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "使用FaceID进行认证。"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, _ in
                DispatchQueue.main.async {
                    if success {
                        self.isFaceIDAuthenticated = true
                        print("成功认证")
                    } else {
                        self.isFaceIDAuthenticated = false
                        print("认证失败")
                    }
                }
            }
        } else {
            print("没有身份识别")
        }
    }
}
