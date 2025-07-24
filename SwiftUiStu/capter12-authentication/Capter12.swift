//
//  Capter12.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/20.
//

import SwiftUI

// 认证卡片
struct ColumnCardView: View {
    var title: String
    var desc: String
    var columnImage: UIImage
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.title2)
                    .bold()
                Text(desc)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(uiImage: columnImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
        }
        .padding(.horizontal, 32)
        .frame(maxWidth: .infinity, maxHeight: 160)
        .background(.white)
        .cornerRadius(16)
    }
}

struct Capter12: View {
    
    @StateObject var faceIDAuthManager = FaceIDAuthManager()
    @State var showingImageSourceSelection: Bool = false
    @State var showingImagePicker = false
    // 图像来源：相机拍摄 or 相册
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var selectedImage: UIImage?
    // 身份证正面图像
    @State var portraitImage: UIImage?
    // 身份证背面图像
    @State var backSideImage: UIImage?
    
    // 是否为身份证正面
    @State var isPortrait: Bool = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6).edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    ColumnCardView(title: "人脸识别", desc: "识别你的身份", columnImage: UIImage(named: "001")!)
                        .onTapGesture {
                            if !faceIDAuthManager.isFaceIDAuthenticated {
                                faceIDAuthManager.authenticateWithFaceID()
                            }
                        }
                    ColumnCardView(title: "身份证正面", desc: "上传身份证人像面", columnImage: portraitImage ?? UIImage(named: "002")!)
                        .onTapGesture {
                            self.isPortrait = true
                            self.showingImageSourceSelection.toggle()
                        }
                    ColumnCardView(title: "身份证反面", desc: "上传身份证国徽面", columnImage: backSideImage ?? UIImage(named: "003")!)
                        .onTapGesture {
                            self.isPortrait = false
                            self.showingImageSourceSelection.toggle()
                        }
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("身份认证")
            .navigationBarTitleDisplayMode(.inline)
        }
        // 打开 ActionSheet 视图
        .actionSheet(isPresented: $showingImageSourceSelection) {
            selectedImageSheet
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: {
            if isPortrait {
                portraitImage = selectedImage
            } else {
                backSideImage = selectedImage
            }
        }) {
            ImageUploadView(selectedImage: $selectedImage, sourceType: sourceType)
        }
    }
    
    // 搭建 ActionSheet 视图
    private var selectedImageSheet: ActionSheet {
        ActionSheet(title: Text("选择上传方式"),
            buttons: [
                .default(Text("相机"), action: {
                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
                        // 打开相机
                        self.sourceType = .camera
                        self.showingImagePicker.toggle()
                    } else {
                        print("相机不可用")
                    }
                }),
                .default(Text("相册"), action: {
                    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                        // 打开相册
                        self.sourceType = .photoLibrary
                        self.showingImagePicker.toggle()
                    } else {
                        print("相册不可用")
                    }
                }),
                .cancel(Text("取消"))
            ]
        )
    }
}

#Preview {
    Capter12()
}
