//
//  QuoteListView.swift
//  quotero
//
//  Created by Matija Osojnik on 30/12/2020.
//

import SwiftUI

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }
}

struct QuoteListView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel = QuotesViewModel()
    
    var body: some View {
        ScrollView {
            VStack() {
                NavigationLink(
                    destination: PostList(),
                    label: {
                        VStack(alignment: .leading) {
                            
                            ZStack {
                                Image("quotes_background")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                VStack (alignment: .leading) {
                                    Text("Popular quotes")
                                        .font(.headline)
                                        .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                                    Text("Find your favorite quote")
                                        .font(.callout)
                                        .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                                }

                            }
                        }
                    })
            
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color:Color(.white).opacity(0.3), radius: 7, x: 0, y: 7)
                .shadow(color:Color(.white).opacity(0.1), radius: 2, x: 0, y: 2)
                
                
                VStack(alignment: .leading) {
                    ForEach(viewModel.quotes, id: \.id) {
                        quote in
                        VStack {
                            Text(quote.body).padding()
                            Text(quote.author).padding(.all, 5)
                            NavigationLink(
                                destination: QuoteSingleView(quote: quote),
                                label: {
                                    Text("View Quote")
                                })
                        }.clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color:Color(.white).opacity(0.3), radius: 7, x: 0, y: 7)
                        .shadow(color:Color(.white).opacity(0.1), radius: 2, x: 0, y: 2)
                    }.lineLimit(3)
                }.onAppear() {
                    self.viewModel.loadData()
                    
                }
//                List(viewModel.quotes) {
//                    quote in
//                    VStack {
//                        Text(quote.body).padding()
//                        Text(quote.author)
//                        NavigationLink(
//                            destination: QuoteSingleView(quote: quote),
//                            label: {
//                                Text("View Quote")
//                            })
//                    }.cornerRadius(10.0)
//                }.lineLimit(3)
//                .navigationBarTitle(Date().dayOfWeek()!.lowercased() + ".")
//                .onAppear() {
//                    self.viewModel.loadData()
//                }
            }
        }.navigationTitle(Date().dayOfWeek()!.lowercased() + ".")
    }
}


struct QuoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            QuoteListView()
        }
    }
}
