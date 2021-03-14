//
//  ContentView.swift
//  MediumStockPriceText
//
//  Created by Water Lou on 14/3/2021.
//

import SwiftUI

struct ContentView: View {
    @State var price: Double = 100.0
    var body: some View {
        VStack(spacing: 16) {
            StockPriceText(price: self.price).font(.title)
            HStack {
                Button("Down") {
                    price = price - 1
                }
                Button("Up") {
                    price = price + 1
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
