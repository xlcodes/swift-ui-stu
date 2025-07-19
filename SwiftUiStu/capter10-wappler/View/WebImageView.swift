//
//  WebImageView.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

struct WebImageView: View {
    
    let imgUrl: String
    
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack {
            if let image = image {
                webImageView(image: image)
            } else {
                emptyImageView
            }
        }
    }
    
   func webImageView(image: UIImage) -> some View {
       Image(uiImage: image)
           .resizable()
           .aspectRatio(contentMode: .fit)
           .frame(minWidth: 0, maxWidth: .infinity)
           .frame(height: 300)
           .cornerRadius(8)
   }
    
    private var emptyImageView: some View {
        VStack(spacing: 20) {
            ProgressView()
            Text("加载中")
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 300)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .onAppear(perform: loadImage)
    }
    
    // 网路请求图片
    func loadImage() {
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: URL(string: imgUrl)!) { data, response, error in
            
            if let httpResp = response as? HTTPURLResponse {
                // 获取http状态码
                let statusCode = httpResp.statusCode
                
                if statusCode == 200, let data = data, let fetchedImage = UIImage(data: data) {
                    // 成功获取图片数据
                    DispatchQueue.main.sync {
                        self.image = fetchedImage
                    }
                } else {
                    // 处理 http 状态码错误或数据为空
                    print("Http状态码错误：\(statusCode)")
                }
            } else if let error = error {
                // 处理网络请求错误
                print("错误信息：\(error.localizedDescription)")
            } else {
                // 未知错误或数据为空
                print("未知错误")
            }
        }
        task.resume()
    }
}

struct WebImageView_Previews: PreviewProvider {
    static var previews: some View {
        WebImageView(imgUrl: "https://env-00jxtnwq7p82.normal.cloudstatic.cn/wallpaper/20250618/1750216745175_2.webp?expire_at=1752944566&er_sign=821092bac9a977c123934ab109ff3348")
    }
}
