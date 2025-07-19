//
//  ArticleView.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

struct Article {
    var image: String
    var title: String
    var articleName: Int
    var subscriptionNum: Int
    
    static let articles = [
        Article(image: "001", title: "SwiftUI项目实战", articleName: 22, subscriptionNum: 245),
        Article(image: "002", title: "SwiftUI 100天", articleName: 37, subscriptionNum: 309),
        Article(image: "003", title: "SwiftUI机简教程", articleName: 42, subscriptionNum: 425),
    ]
}
