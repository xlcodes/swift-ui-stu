//
//  CalendarCardView.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/24.
//

import SwiftUI

/**
 * 一个简单的日历卡片
 */
struct CalendarCardView: View {
    // 通过当前 date 获取前后 2 天
    var dates: [Date] {
        [-2,-1,0,1,2].compactMap { day in
            Calendar.current.date(
                byAdding: .day,
                value: day,
                to: .now
            )
        }
    }
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(dates, id: \.self) { date in
                // 如果是当天的话给一个卡片背景
                let isToday = date.formatted(.dateTime.day()) == Date.now.formatted(.dateTime.day())
                VStack (spacing: 20) {
                    // 调整日历样式
                    Text(date.formatted(.dateTime.day()))
                        .font(.title)
                        .fontWeight(isToday ? .bold : .regular)
                    Text(date.formatted(.dateTime.weekday()))
                        .font(.title3)
                        .fontWeight(isToday ? .medium : .thin)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 16)
                .background {
                    if isToday {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.cyan.opacity(0.8))
                            .stroke(.black, lineWidth: 2)
                    }
                }
            }
        }
        // 制作卡片效果
        .padding(24)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .stroke(.black, lineWidth: 2)
        }
        // 制造偏移效果
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.yellow.opacity(0.8))
                .stroke(.black, lineWidth: 2)
                .offset(x: 8, y: 8)
        }
    }
}

#Preview {
    CalendarCardView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.indigo)
}
