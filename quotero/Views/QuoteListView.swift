//
//  QuoteListView.swift
//  quotero
//
//  Created by Matija Osojnik on 30/12/2020.
//

import SwiftUI

struct QuoteListView: View {
    
    var quotes: [Quote] = testDataQuotes
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(self.quotes) {
                        quote in QuoteCell(quote: quote)
                    }
                }
            }.navigationBarTitle("Quotes")
        }
    }
}

struct QuoteCell: View {
    var quote: Quote
    
    var body: some View {
        VStack {
            Text(quote.body).padding().font(.body)
            Text(quote.author).padding().font(.caption)
        }
    }
}

struct QuoteListView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteListView()
    }
}
