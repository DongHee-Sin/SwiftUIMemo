//
//  DetailView.swift
//  SwiftUIMemo
//
//  Created by 신동희 on 2023/02/20.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    
    @Environment(\.dismiss) var dismiss
    
    @State private var showComposer = false
    @State private var showDeleteAlert = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(memo.content)
                            .padding()
                        Spacer(minLength: 0)
                    }
                    Text(memo.insertDate, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("MEMO")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    showDeleteAlert = true
                } label: {
                    Image(systemName: "trash")
                }
                .foregroundColor(.red)
                .alert("삭제 확인", isPresented: $showDeleteAlert) {
                    Button(role: .destructive) {
                        store.delete(memo: memo)
                        dismiss()
                    } label: {
                        Text("삭제")
                    }

                } message: {
                    Text("메모를 삭제할까요?")
                }

                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }

            }
        }
        .sheet(isPresented: $showComposer) {
            ComposeView(memo: memo)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(memo: Memo(content: "memo"))
                .environmentObject(MemoStore())
        }
    }
}
