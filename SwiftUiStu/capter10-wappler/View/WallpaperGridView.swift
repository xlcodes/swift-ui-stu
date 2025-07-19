//
//  WallpaperGridView.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

struct WallpaperGridView: View {

    @State private var wallpapers: [Wallpaper] = []
    
    let imgUrl: String = "http://localhost:3000/"
    
    // 网格布局参数
    private var gridItemLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    // 网络请求
    func fetchPotos() {
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: URL(string: imgUrl)!) { data, response, error in
            
            if let httpResp = response as? HTTPURLResponse {
                // 获取HTTP状态码
                let statusCode = httpResp.statusCode
                if statusCode == 200, let data = data {
                    // 成功获取图片数据
                    do {
                        let decoder = JSONDecoder()
                        let decodedPhotos = try decoder.decode([Wallpaper].self, from: data); DispatchQueue.main.async {
                            self.wallpapers = decodedPhotos
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                } else {
                    // 处理状态码错误或者数据为空
                    print("Http状态码错误：\(statusCode)")
                }
            } else if let error = error {
                // 处理网络请求错误
                print("错误信息：\(error.localizedDescription)")
            } else {
                // 未知错误
                print("未知错误")
            }
        }
        task.resume()
    }
    
    var body: some View {
        NavigationView {
            // 网格视图
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: gridItemLayout, spacing: 10) {
                    ForEach(wallpapers, id: \.id) { wallpaper in
                        WebImageView(imgUrl: wallpaper.urls.small)
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("推荐壁纸")
        }
        .onAppear {
            fetchPotos()
        }
    }
}

#Preview {
    WallpaperGridView()
}
