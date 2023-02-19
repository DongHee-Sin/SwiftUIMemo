//
//  MemoStore.swift
//  SwiftUIMemo
//
//  Created by 신동희 on 2023/02/19.
//

import Foundation


final class MemoStore: ObservableObject {
    
    @Published var list: [Memo]
    
    init() {
        self.list = [
            Memo(content: "Hello"),
            Memo(content: "Swift", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "UI", insertDate: Date.now.addingTimeInterval(3600 * -48)),
            Memo(content: "Hello SwiftUI", insertDate: Date.now.addingTimeInterval(3600 * -72))
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo else { return }
        
        memo.content = content
    }
    
    func delete(memo: Memo) {
        list.removeAll { $0.id == memo.id }
    }
    
    func delete(set: IndexSet) {
        set.forEach { list.remove(at: $0) }
    }
}
