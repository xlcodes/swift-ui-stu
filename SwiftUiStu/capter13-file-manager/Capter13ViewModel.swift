//
//  Capter13ViewModel.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/20.
//

import SwiftUI

class Capter13ViewModel: ObservableObject {
    
    private var jsonPath = "sentenceModel.json"
    
    @Published var sentenceModel: [SentenceModel] = []
    
    init() {
        loadData()
    }
    
    // 添加笔记方法
    func addNote(sentence: String) {
        let newNote = SentenceModel(sentence: sentence, create_time: "")
        sentenceModel.append(newNote)
    }
    
    // 存储笔记方法
    func saveDate() {
        do {
            let data = try JSONEncoder().encode(sentenceModel)
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectory.appendingPathComponent(jsonPath)
                
                print(fileURL.path())
                
                try data.write(to: fileURL)
            }
        } catch {
            print("保存信息失败：\(error)")
        }
    }
    
    // 读取笔记方法
    func loadData() {
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDirectory.appendingPathComponent(jsonPath)
            
            do {
                let data = try Data(contentsOf: fileURL)
                sentenceModel = try JSONDecoder().decode([SentenceModel].self, from: data)
            } catch {
                print("数据读取失败：\(error)")
            }
        }
    }
    
    // 删除笔记方法
    func deleteNote(id: UUID) {
        if let index =  sentenceModel.firstIndex(where: { $0.id == id }) {
            sentenceModel.remove(at: index)
            saveDate()
        }
    }
    
    // 获取当前时间方法
    func getCurrentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentTime = Date()
        let formattedTime = dateFormatter.string(from: currentTime)
        return formattedTime
    }
}
