//
//  itemView.swift
//  TroyLabsHackathon
//
//  Created by Joshua Jenkins on 9/12/24.
//

import SwiftUI

struct itemView: View {
    var imageName: String
    var size: Double
    var cost: Int
    @Binding var balance: Int
    @Binding var cartItems: [String]
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size)
                .border(.black, width: 3)
                .padding(.trailing, 15)
                .foregroundStyle(.black)
            VStack {
                Button(action: {
                    if (balance-cost >= 0) {
                        balance-=cost
                    }
                }) {
                    Image(systemName: "cart.fill.badge.plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40)
                        .foregroundStyle(.black)
                        .padding(.bottom, 10)
                }
                HStack(spacing: 0) {
                    Text("\(cost)")
                        .padding(.trailing, 5)
                    Image("coin")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                }
            }
        }
    }
}

struct itemView_Previews: PreviewProvider {
    static var previews: some View {
        // We use a wrapper to handle @State
        StateWrapper()
    }
}

struct StateWrapper: View {
    @State private var balance: Int = 20
    @State private var cartItems: [String] = []

    var body: some View {
        itemView(imageName: "flowers", size: 100, cost: 5, balance: $balance, cartItems: $cartItems)
    }
}
