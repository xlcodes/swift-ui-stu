//
//  ViewModel.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/20.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var historyDaily: [HistoryDaily] = []
    
    let dataURL = "http://localhost:3000/"
    
    @Published var currentDate: Date = Date()
    @Published var selectedDate: Date = Date()
    
    // 网络请求
    func fetchTodayInHistory() {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: URL(string: dataURL)!) { data, response, error in
            if let httpResp = response as? HTTPURLResponse {
                // 获取HTTP状态码
                let statusCode = httpResp.statusCode
                if statusCode == 200, let data = data {
                    // 成功获取今日历史数据
                    do {
                        let decoder = JSONDecoder()
                        let decodedPhotos = try decoder.decode([HistoryDaily].self, from: data); DispatchQueue.main.async {
                            self.historyDaily = decodedPhotos
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
    
    // 获得日期数组
    func daysOfMonth() -> [Date] {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: currentDate)!
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate))!
        
        return (1 ..< range.count + 1).map{
            calendar.date(byAdding: .day, value: $0 - 1, to: startOfMonth)!
        }
    }
    
    // 匹配正确日期
    func firstDayOfWeekForMonth() -> Int {
        let calendar = Calendar.current
        let firstDay = daysOfMonth().first ?? Date()
        return calendar.component(.weekday, from: firstDay) - 1
    }
}
