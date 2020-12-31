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
            VStack() {
                List {
                    ForEach(self.quotes) {
                        quote in QuoteCell(quote: quote)
                    }
                }
            }.navigationTitle("Quotes")
    }
}

struct QuoteCell: View {
    var quote: Quote
    
    var body: some View {
        VStack {
            Text(quote.body).padding().font(.body)
            Image("quoteroLogo")
                .resizable()
                .scaledToFit()
                
        
            Text(quote.author).padding().font(.caption)
        }
    }
}

struct QuoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            QuoteListView()
        }
    }
}
