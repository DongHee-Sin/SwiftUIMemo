//
//  ComposeView.swift
//  SwiftUIMemo
//
//  Created by 신동희 on 2023/02/19.
//

import SwiftUI

struct ComposeView: View {
    
    var memo: Memo?
    
    @EnvironmentObject var store: MemoStore
    
    @Environment(\.dismiss) var dismiss
    
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content)
                    .padding()
                    .onAppear {
                        if let memo {
                            content = memo.content
                        }
                    }
            }
            .navigationTitle(memo != nil ? "메모 편집" : "새 메모")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        if let memo {
                            store.update(memo: memo, content: content)
                        }else {
                            store.insert(memo: content)
                        }
                        
                        dismiss()
                    } label: {
                        Text("저장")
                    }
                }
            }
        }
    }
}



struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore())
    }
}
