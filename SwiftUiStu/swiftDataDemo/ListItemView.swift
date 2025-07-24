//
//  ListItemView.swift
//  SwiftUiStu
//
//  Created by 刘林 on 2025/7/24.
//

import SwiftUI
import SwiftData

struct ListItemView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query private var persons: [SwiftDataItem]
    
    var body: some View {
        List {
            ForEach(persons) {
                person in
                
                NavigationLink(destination: EditItemView(
                    myName: Binding(
                        get: { person.name }, set: {
                            newName in
                            person.name = newName
                        }
                    ),
                    myPhone: Binding(
                        get: { person.phone }, set: {
                            newPhone in
                            person.phone = newPhone
                        }
                    )
                )) {
                    HStack {
                        Text(person.name)
                        Text(" => ")
                        Text(person.phone)
                    }
                }
                
                
            }
            .onDelete(perform: deletePerson)
        }
        .navigationTitle("记录列表")
    }
    
    func deletePerson(at offsets: IndexSet) {
        for index in offsets {
            let delPersion = persons[index]
            modelContext.delete(delPersion)
        }
        do {
            try modelContext.save()
        } catch {
            print("删除失败：\(error.localizedDescription)")
        }
    }
}

#Preview {
    ListItemView()
}
