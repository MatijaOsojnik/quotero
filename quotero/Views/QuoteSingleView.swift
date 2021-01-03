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
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var quote: Quote
    
    @State var toggled = false
    
    @ObservedObject var viewModel = QuotesViewModel()
    
    @ObservedObject var likeModel = LikeService()
    
//    var quotes: [Quote] = testDataQuotes
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var isToggled = false
    var btnBack : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image(systemName: "chevron.backward.circle") // set image here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    Text("Go back")
                }
            }
        }
    
    var body: some View {
     
            ZStack {
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50.0)
                            .fill(colorScheme == .dark ? Color.white : Color.black)
                            .padding()
//                            .shadow(color: Color(.gray), radius: 3, x: 7, y: 5)
                            
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
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
                        }.padding(.all, 10)
                            
                    }
                    if isToggled {
                        Button(action: {
                            LikeService().unlikeQuote(quote: quote);
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
                            LikeService().likeQuote(quote: quote);
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
            .onAppear() {
                print(self.likeModel.isliked(quote: quote, completion: { (liked) in
                    if liked {
                        self.isToggled.toggle()
                    } else {
                        print("This quote is not liked")
                    }
                }))
            }
            .edgesIgnoringSafeArea(.horizontal)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            
        
        
        //Text(self.quotes[0].body)
    }
}

struct QuoteSingleView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteSingleView(quote: QuotesViewModel().quotes[1])
    }
}
