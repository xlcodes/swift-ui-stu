//
//  Wallpaper.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

struct Wallpaper: Codable {
    let id: String
    let urls: UnsplashPhotoUrls
}

struct UnsplashPhotoUrls: Codable {
    let small: String
}
