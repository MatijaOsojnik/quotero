//
//  LikedQuotesListView.swift
//  quotero
//
//  Created by Matija Osojnik on 03/01/2021.
//

import SwiftUI

struct LikedQuotesListView: View {
    
    @ObservedObject var viewModel = LikeService()
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(viewModel.quotes, id: \.id) {
                    quote in
                    QuoteCell(quote: quote)
                }
            }.onAppear() {
                self.viewModel.loadData()
            }
        }.navigationBarTitle("liked.")
    }
}

struct LikedQuotesListView_Previews: PreviewProvider {
    static var previews: some View {
        LikedQuotesListView()
    }
}
