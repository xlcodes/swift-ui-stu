//
//  CalendarView.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/20.
//

import SwiftUI

struct CalendarView: View {
    // 可观测对象
    @StateObject var viewModel = ViewModel()
    // 工作周数组
    let daysInWeek = ["日", "一", "二", "三", "四", "五", "六"]
    // 网格参数
    let gridItemLayout = Array(repeating: GridItem(), count: 7)
    
    var body: some View {
        NavigationStack {
            VStack {
                yearMonthView
                
                LazyVGrid(columns: gridItemLayout) {
                    weekView
                    firstDayOfWeekForMonthView
                    daysOfMonthView
                }
            }
            .padding()
            .navigationTitle("日历")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // 当前年月
    private var yearMonthView: some View {
        Text("\(viewModel.currentDate,formatter: DateFormatter.yearMonth)")
            .font(.largeTitle)
            .padding(.top, 16)
    }
    
    // 工作周
    private var weekView: some View {
        ForEach(daysInWeek, id: \.self) { day in
            Text(day)
                .font(.headline)
                .frame(maxWidth: .infinity)
        }
    }
    
    // 日历时间
    private var daysOfMonthView: some View {
        ForEach(viewModel.daysOfMonth(), id: \.self) { day in
            Text("\(day.day)")
                .font(.system(size: 20))
                .foregroundColor(day.isSameDay(as: viewModel.selectedDate) ? .white : .black)
                .frame(maxWidth: .infinity, minHeight: 48)
                .background(day.isSameDay(as: viewModel.selectedDate) ? .blue : .clear)
                .cornerRadius(8)
                .onTapGesture {
                    viewModel.selectedDate = day
                }
        }
    }
    
    // 日历起始日期
    private var firstDayOfWeekForMonthView: some View {
        ForEach(0 ..< viewModel.firstDayOfWeekForMonth(), id: \.self) { _ in
            Text(" ")
                .frame(maxWidth: .infinity, minHeight: 48)
        }
    }
}

#Preview {
    CalendarView()
}
