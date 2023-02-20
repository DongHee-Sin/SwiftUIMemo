//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by 신동희 on 2023/02/18.
//

import SwiftUI

struct MainListView: View {
    
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                NavigationLink {
                    DetailView(memo: memo)
                } label: {
                    MemoCell(memo: memo)
                }
            }
            .listStyle(.plain)
            .navigationTitle("My MEMO")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showComposer) {
                ComposeView()
            }
        }
        .navigationViewStyle(.stack)
    }
}



struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}
