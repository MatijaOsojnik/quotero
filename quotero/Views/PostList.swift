//
//  PostList.swift
//  quotero
//
//  Created by Matija Osojnik on 31/12/2020.
//

import SwiftUI

struct PostList: View {
    @ObservedObject var viewModel = QuotesViewModel()
    
    var body: some View {
        List(viewModel.quotes) {
            quote in
            VStack {
                Text(quote.body).padding()
                Text(quote.author)
            }
        }
        .navigationBarTitle("Quotes")
        .onAppear() {
            self.viewModel.loadData()
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
