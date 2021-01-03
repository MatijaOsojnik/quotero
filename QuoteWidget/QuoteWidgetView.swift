//
//  QuoteWidgetView.swift
//  quotero
//
//  Created by Matija Osojnik on 03/01/2021.
//

import SwiftUI



struct QuoteWidgetView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel = QuotesViewModel()
    
    
    var body: some View {
        ZStack {
            Color(UIColor.init())
            VStack {
                ForEach(viewModel.quotes, id: \.id) {
                    quote in
                    if quote.featured {
                        Text(quote.body)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding()
                            .foregroundColor(.white)
                    }
                }
                
            }
        }.onAppear() {
            self.viewModel.loadData()
        }
    }
}

struct QuoteWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteWidgetView()
    }
}
