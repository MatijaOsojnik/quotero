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
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}

struct QuoteSingleView: View {
    
//    var quotes: [Quote] = testDataQuotes
    
    @State private var isToggled = false
    
    var body: some View {
     
            ZStack {
                Color.offWhite
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .fill(Color.offWhite)
                            .padding()
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
//                        Text(self.quotes[0].body)
//                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 20)
//                            .font(.body)
//                            .lineSpacing(5)
                            
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
                }.padding()
                
            }
            .edgesIgnoringSafeArea(.all)
        
        
        //Text(self.quotes[0].body)
    }
}

struct QuoteSingleView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteSingleView()
    }
}
