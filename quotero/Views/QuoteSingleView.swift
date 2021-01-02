//
//  QuoteSingleView.swift
//  quotero
//
//  Created by Matija Osojnik on 31/12/2020.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

struct SimpleButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.white)
                            .foregroundColor(Color.white)
//                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
//                            .shadow(color: Color.white.opacity(0.7), radius: 5, x: 10, y: 10)
                    } else {
                        Circle()
                            .fill(Color.white)
//                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 10, y: 10)
//                            .shadow(color: Color.white.opacity(0.7), radius: 5, x: -5, y: -5)
                    }
                }
            )
    }
}

struct QuoteSingleView: View {
    
    @State var quote: Quote
    
    @ObservedObject var viewModel = QuotesViewModel()
    
//    var quotes: [Quote] = testDataQuotes
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isToggled = false
    
    var body: some View {
     
            ZStack {
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50.0)
                            .fill(colorScheme == .dark ? Color.white : Color.black)
//                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
//                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        VStack {
                            Text(quote.body)
                                .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 20)
                                .font(.body)
                                .lineSpacing(5)
                                
                            Text(quote.author)
                                .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                                .font(.caption)
                                .padding(.all, 5)
                        }
                            
                    }
                    if isToggled {
                        Button(action: {
                            self.isToggled.toggle()
                        }) {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 20.0, height: 20.0)
                                .foregroundColor(.red)
                                
                        }
                        .padding()
                        .buttonStyle(SimpleButtonStyle())
                    }
                    else {
                        Button(action: {
                            self.isToggled.toggle()
                        }) {
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: 20.0, height: 20.0)
                                .foregroundColor(.red)
                              

                        }
                        .padding()
                        .buttonStyle(SimpleButtonStyle())
                    }
                }
                
            }
            .edgesIgnoringSafeArea(.horizontal)
        
        
        //Text(self.quotes[0].body)
    }
}

struct QuoteSingleView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteSingleView(quote: QuotesViewModel().quotes[0])
    }
}
