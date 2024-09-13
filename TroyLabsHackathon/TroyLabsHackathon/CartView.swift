//
//  CartView.swift
//  TroyLabsHackathon
//
//  Created by Joshua Jenkins on 9/12/24.
//

import SwiftUI

struct CartView: View {
    @Binding var cost: Int
    @Binding var items: [String]
    var body: some View {
        VStack {
            HStack {
                Text("Cost: \(cost)")
                    .font(.headline)
                Image("coin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                Text("Cart")
                    .font(.title)
                    .frame(width: 100)
                Button(action: {
                    
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.gray)
                            .opacity(0.5)
                            .frame(width: 100, height: 40)
                        Text("Checkout")
                            .foregroundStyle(.black)
                            .font(.subheadline)
                    }
                }
            }
            .padding(20)
            
            //scrollview of items
            ScrollView {
                VStack {
                    ForEach(items.indices, id: \.self) { index in
                        Image(items[index])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                            .border(.black, width: 3)
                            .padding(20)
                    }
                }
            }
            .shadow(radius: 5)
            Spacer()
        }
    }
}

struct cart_Previews: PreviewProvider {
    static var previews: some View {
        // We use a wrapper to handle @State
        wrap()
    }
}

struct wrap: View {
    @State private var cost: Int = 20
    @State private var items: [String] = ["flowers"]

    var body: some View {
        CartView(cost: $cost, items: $items)
    }
}
