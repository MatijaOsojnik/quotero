//
//  QuoteListView.swift
//  quotero
//
//  Created by Matija Osojnik on 30/12/2020.
//

import SwiftUI
import AVKit



extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }
}

//class ViewController: UIViewController, YTPlayerViewDelegate {
//    @IBOutlet var playerView: YTPlayerView!
//
//    override func viewDidLoad(){
//        super.viewDidLoad()
//        playerView?.delegate = self
//        playerView?.load(withVideoId: "g-jwWYX7Jlo")
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
//        playerView.playVideo()
//    }
//}

struct QuoteListView: View{
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel = QuotesViewModel()
    
    @State var quoteOfTheDay:Quote?
    
    
    
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
                    .padding(.all, 10)
            
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color:Color(.white).opacity(0.3), radius: 7, x: 0, y: 7)
                .shadow(color:Color(.white).opacity(0.1), radius: 2, x: 0, y: 2)

                
                VStack(alignment: .leading) {
                    Text("quote of the day.")
                        .bold()
                        
                        .font(.headline)
                    ForEach(viewModel.quotes, id: \.id) {
                        quote in
                        if quote.featured {
                            QuoteCell(quote: quote)
                        }
                    }
                }
                .padding()
                .onAppear() {
                    self.viewModel.loadData()
                }
//                VStack(alignment: .leading) {
//                    Text("be inspired.")
//                        .bold()
//                        .font(.headline)
//                    VideoPlayer(player: AVPlayer(url: URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4")!))
//                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300, maxHeight: 500)
//                        .padding()
//                }
                
                
            }
        
        }.navigationTitle(Date().dayOfWeek()!.lowercased() + ".")
    }
}

struct QuoteCell: View {
    
    var quote: Quote
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showingDetail: Bool = false
    
    var body: some View {
//        NavigationLink(
//            destination: QuoteSingleView(quote: quote),
//            label: {
//                ZStack {
//                    RoundedRectangle(cornerRadius: 20).fill(colorScheme == .dark ? Color.white : Color.black)
//                        
//                    VStack {
//                        Text(quote.body).foregroundColor(colorScheme == .dark ? Color.black : Color.white)
//                            .fixedSize(horizontal: false, vertical: true)
//                            .font(.body)
//                            .padding(.all, 10)
//                        
//                        Text(quote.author)
//                            .foregroundColor(colorScheme == .dark ? Color.black : Color.white).padding()
//                            .font(.caption)
//                        
//                    }
//                    .padding()
//                    
//                }
//                .padding(.all, 10)
//            }
//            )
        Button(action: {
            showingDetail.toggle()
        }, label: {
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
        }).sheet(isPresented: $showingDetail, content: {
            QuoteSingleView(quote: quote)
        })
        
//        ZStack {
//            RoundedRectangle(cornerRadius: 20).fill(colorScheme == .dark ? Color.white : Color.black)
//
//            VStack {
//                Text(quote.body).foregroundColor(colorScheme == .dark ? Color.black : Color.white)
//                    .fixedSize(horizontal: false, vertical: true)
//                    .font(.body)
//                    .padding(.all, 10)
//
//                Text(quote.author)
//                    .foregroundColor(colorScheme == .dark ? Color.black : Color.white).padding()
//                    .font(.caption)
//
//            }
//            .padding()
//
//        }
//        .padding(.all, 10)
//
//
        }
    
}


struct QuoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            QuoteListView()
        }
    }
}
