//
//  Note.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/19.
//

import SwiftUI

struct Note: Identifiable {
    let id = UUID()
    var noteContent: String
    
    static let notes = [
        Note(noteContent: "总要为了梦想，全力以赴一次。"),
        Note(noteContent: "为了梦想，一路狂奔。"),
        Note(noteContent: "从现在开始努力，一切都还来得及。"),
        Note(noteContent: "没有失败，只有暂时不成功。"),
    ]
}
