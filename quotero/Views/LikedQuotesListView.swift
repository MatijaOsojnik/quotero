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
                    ZStack {
                        RoundedRectangle(cornerRadius: 20).fill(colorScheme == .dark ? Color.white : Color.black)
                            
                        VStack {
                            Text(quote.body).foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .padding(.all, 10)
                            
                            Text(quote.author)
                                .foregroundColor(colorScheme == .dark ? Color.black : Color.white).padding()
                                .font(.caption)
                            
                        }
                        .padding()
                        
                    }
                    .padding(.all, 10)
                }
            }.onAppear() {
                self.viewModel.loadData()
            }
        }
    }
}

struct LikedQuotesListView_Previews: PreviewProvider {
    static var previews: some View {
        LikedQuotesListView()
    }
}
