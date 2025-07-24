//
//  SwiftDataItem.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/24.
//

import Foundation
import SwiftData

@Model
final class SwiftDataItem {
    var name: String = ""
    var phone: String = ""
    
    init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }
}
