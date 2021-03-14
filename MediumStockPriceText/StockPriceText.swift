//
//  StockPriceText.swift
//  MediumStockPriceText
//
//  Created by Water Lou on 14/3/2021.
//

import SwiftUI

struct StockPriceText: View {
    
    class Context: ObservableObject {
        var lastPrice: Double?
        @Published var color: Color = Color.black
        var timer: Timer?
    }
    
    var price: Double
    @StateObject var context = Context()
    
    var body: some View {
                
        if let lastPrice = context.lastPrice {
            if price > lastPrice {
                context.color = .green
                context.timer?.invalidate()
                context.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                    withAnimation(.easeInOut(duration: 0.1)) {
                        context.color = .black
                    }
                }
            }
            else if price < lastPrice {
                context.color = .red
                context.timer?.invalidate()
                context.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                    withAnimation(.easeInOut(duration: 0.1)) {
                        context.color = .black
                    }
                }
            }
        }
        context.lastPrice = price

        return Text(String(price))
            .foregroundColor(Color.white)
            .colorMultiply(context.color)
    }

    

    init(price: Double) {
        self.price = price
    }
}

struct StockPriceText_Previews: PreviewProvider {
    static var previews: some View {
        StockPriceText(price: 100.0)
    }
}
