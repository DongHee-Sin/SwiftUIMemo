//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by 신동희 on 2023/02/18.
//

import Foundation
import SwiftUI


final class Memo: Identifiable, ObservableObject {
    
    let id: UUID
    @Published var content: String  // Published를 추가하면 반응형으로 구현된다. (바인딩된 요소가 자동으로 변경됨)
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date.now) {
        self.id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
}
