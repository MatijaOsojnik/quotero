//
//  QuoteListView.swift
//  quotero
//
//  Created by Matija Osojnik on 30/12/2020.
//

import SwiftUI

struct QuoteListView: View {
    
//    var quotes: [Quote] = testDataQuotes
    
    var body: some View {
            VStack() {
//                List {
//                    ForEach(self.quotes) {
//                        quote in QuoteCell(quote: quote)
//                    }
//                }
            }.navigationTitle("Quotes")
    }
}

struct QuoteCell: View {
    var quote: Quote
    
    var body: some View {
        
        
        
        ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(Color.offWhite)
                    
                    .shadow(color:Color.black.opacity(0.2),radius: 10, x: 10, y: 10)
                    .shadow(color:Color.white.opacity(0.7),radius: 10, x: -5, y: -5)
//            VStack {
//                Text(quote.body)
//                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 20)
//                        .font(.body)
//                        .lineSpacing(5)
//                Text("- " + quote.author)
//                    .padding().font(.caption)
//            }
        }
        
        

//        VStack {
//            Text(quote.body).padding().font(.body)
//            Image("quoteroLogo")
//                .resizable()
//                .scaledToFit()
//
//
//            Text(quote.author).padding().font(.caption)
//        }
    }
}

struct QuoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            QuoteListView()
        }
    }
}
