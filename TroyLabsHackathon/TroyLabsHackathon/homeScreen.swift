//
//  homeScreen.swift
//  TroyLabsHackathon
//
//  Created by Joshua Jenkins on 9/12/24.
//

import SwiftUI

struct homeScreen: View {
    @State var balance: Int = 70
    @State var items: [String] = ["flowers", "earbuds", "snacks", "recordplayer", "iphone"]
    @State var costs: [Int] = [5, 10, 15, 20, 50]
    @State var cartItems: [String] = []
    @State var totalCost: Int = 0
    @State private var showCart: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("\(balance)")
                    .font(.headline)
                Image("coin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                Text("RevSend Shop")
                    .font(.title)
                    .frame(width: 200)
                Button(action: {
                    showCart = true
                }) {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .foregroundStyle(.black)
                }
                .sheet(isPresented: $showCart) {
                        // This will present the CartView as a sheet
                        CartView(cost: $totalCost, items: $cartItems)
                    }
            }
            .padding(20)
            
            //scrollview of items
            ScrollView {
                VStack {
                    ForEach(items.indices, id: \.self) { index in
                        itemView(imageName: items[index], size: 100, cost: costs[index], balance: $balance, cartItems: $cartItems)
                            .padding(30)
                    }
                }
            }
            .shadow(radius: 5)
            Spacer()
        }
    }
}

#Preview {
    homeScreen()
}
