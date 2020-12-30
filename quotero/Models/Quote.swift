//
//  Quote.swift
//  quotero
//
//  Created by Matija Osojnik on 30/12/2020.
//

import Foundation

struct Quote: Identifiable {
    var id: String = UUID().uuidString
    var body: String
    var author: String
}

#if DEBUG
let testDataQuotes = [
    Quote(body: "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.", author: "Ralph Waldo Emerson"),
    Quote(body: "Twenty years from now you will be more disappointed by the things that you didn't do than by the ones you did do. So throw off the bowlines. Sail away from the safe harbor. Catch the trade winds in your sails. Explore. Dream. Discover.", author: "H. Jackson Brown Jr."),
    Quote(body: "Be who you are and say what you feel, because those who mind don't matter, and those who matter don't mind.", author: "Bernard M. Baruch")
]
#endif
