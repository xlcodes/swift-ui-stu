//
//  SentenceModel.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/20.
//

import SwiftUI

struct SentenceModel: Identifiable, Codable {
    var id: UUID = UUID()
    var sentence: String
    var create_time: String
}
