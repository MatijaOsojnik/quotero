//
//  QuoteWidgetView.swift
//  quotero
//
//  Created by Matija Osojnik on 03/01/2021.
//

import SwiftUI



struct QuoteWidgetView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var quote = Quote(id: "1235132rafvsdfAs", body: "You know you're in love when you can't fall asleep because reality is finally better than your dreams.", author: "Dr. Seuss", featured: true)
    
    
    var body: some View {
        ZStack {
            Color(UIColor.black)
            VStack {
                QuoteCellWidget(quote: quote)
            }
        }
    }
}

struct QuoteCellWidget: View {
    var quote: Quote
    
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            Text(quote.body)
                .font(.headline)
                .lineSpacing(5)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
            
            Text(quote.author)
                .font(.caption)
                .foregroundColor(.white)
        }
    }
}

struct QuoteWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteWidgetView()
    }
}
