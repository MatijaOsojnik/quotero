//
//  PostList.swift
//  quotero
//
//  Created by Matija Osojnik on 31/12/2020.
//

import SwiftUI

struct PostList: View {
    @State var quotes: [Quote] = []
    var body: some View {
        List(quotes) {
            quote in Text(quote.author)
        }
        .onAppear {
            Api().getQuotes { (quotes) in self.quotes = quotes
            }
        }

    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
