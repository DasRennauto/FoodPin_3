//  ContentView.swift
//  FoodPin
//
//  Created by Kilian Heitzinger on 11.11.2024
//
 
import SwiftUI

struct Restaurant{
    var name: String;
    var type:String;
    var phone:String;
    var image: String;
    var priceLevel:Int;
    var isFavorite:Bool?;
    var isCheckIn:Bool?
}

struct BasicImageRow:View {
    let restaurant: Restaurant;
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(5)
            VStack(alignment: .leading){
                Text(restaurant.name)
                    .font(.body)
                    .fontWeight(.bold)
                Text(restaurant.type)
                    .font(.footnote)
                Text(restaurant.phone)
                    .font(.footnote)
            }
            Spacer()
            VStack(alignment: .trailing){
                HStack(){
                    if let isFavorite = restaurant.isFavorite {
                        Image(systemName: "star.circle.fill")
                            .foregroundStyle(.white,.yellow)
                    }
                    
                    if let isCheckIn = restaurant.isCheckIn {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.white,.green)
                    }
                }
                Spacer()
                    
                HStack(){
                    ForEach(0..<restaurant.priceLevel, id: \.self) { price in
                        Image(systemName: "eurosign.circle.fill")
                            .foregroundStyle(.white,.orange)
                    }
                    
                }
            }
        }
    }
}

struct FullImageRow:View {
    let restaurant: Restaurant;
    
    var body: some View {
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(height: 200)
            .overlay(
                    Color.black.opacity(0.2)
                )
            .cornerRadius(10)
            .overlay(
                VStack{
                    HStack{
                        Text(restaurant.name)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .colorInvert()
                        Spacer()
                        
                        if let isCheckIn = restaurant.isCheckIn {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.white,.green)
                        }
                        if let isFavorite = restaurant.isFavorite {
                            Image(systemName: "star.circle.fill")
                                .foregroundStyle(.white,.yellow)
                        }
                        
                    }
                    
                    
                    HStack(alignment: .bottom){
                        HStack(alignment: .bottom){
                            ForEach(0..<restaurant.priceLevel, id: \.self) { price in
                                Image(systemName: "eurosign.circle.fill")
                                    .foregroundStyle(.white,.orange)
                            }
                        }
                        Spacer()
                        VStack(alignment: .trailing){
                            Text(restaurant.type)
                                .font(.callout)
                                .colorInvert()
                            Text(restaurant.phone)
                                .font(.callout)
                                .colorInvert()
                        }
                        
                    }
                }
                    .padding(25.0)
            )
    }
}

struct ContentView: View {
    var restaurants = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", phone: "232-923423", image: "cafedeadend", priceLevel: 3),
        Restaurant(name: "Homei", type: "Cafe", phone: "348-233423", image: "homei", priceLevel: 3),
        Restaurant(name: "Teakha", type: "Tea House", phone: "354-243523", image: "teakha", priceLevel: 3, isFavorite: true, isCheckIn: true),
        Restaurant(name: "Cafe loisl", type: "Austrian / Casual Drink", phone: "453-333423", image: "cafeloisl", priceLevel: 2, isFavorite: true, isCheckIn: true),
        Restaurant(name: "Petite Oyster", type: "French", phone: "983-284334", image: "petiteoyster", priceLevel: 5, isCheckIn: true),
        Restaurant(name: "For Kee Restaurant", type: "Hong Kong", phone: "232-434222", image: "forkeerestaurant", priceLevel: 2, isFavorite: true, isCheckIn: true),
        Restaurant(name: "Po's Atelier", type: "Bakery", phone: "234-834322", image: "posatelier", priceLevel: 4),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", phone: "982-434343", image: "bourkestreetbakery", priceLevel: 4, isCheckIn: true),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", phone: "734-232323", image: "haighschocolate", priceLevel: 3, isFavorite: true),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", phone: "872-734343", image: "palominoespresso", priceLevel: 2),
        Restaurant(name: "Upstate", type: "Seafood", phone: "343-233221", image: "upstate", priceLevel: 4),
        Restaurant(name: "Traif", type: "American", phone: "985-723623", image: "traif", priceLevel: 5),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", phone: "455-232345", image: "grahamavenuemeats", priceLevel: 3, isCheckIn: true),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", phone: "434-232322", image: "wafflewolf", priceLevel: 3),
        Restaurant(name: "Five Leaves", type: "Bistro", phone: "343-234553", image: "fiveleaves", priceLevel: 4, isFavorite: true, isCheckIn: true),
        Restaurant(name: "Cafe Lore", type: "Latin American", phone: "342-455433", image: "cafelore", priceLevel: 2, isFavorite: true, isCheckIn: true),
        Restaurant(name: "Confessional", type: "Spanish", phone: "643-332323", image: "confessional", priceLevel: 4),
        Restaurant(name: "Barrafina", type: "Spanish", phone: "542-343434", image: "barrafina", priceLevel: 2, isCheckIn: true),
        Restaurant(name: "Donostia", type: "Spanish", phone: "722-232323", image: "donostia", priceLevel: 1),
        Restaurant(name: "Royal Oak", type: "British", phone: "343-988834", image: "royaloak", priceLevel: 2, isFavorite: true),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", phone: "432-344050", image: "caskpubkitchen", priceLevel: 1)
        ]
    
    @State private var basicViewState: Bool = false;
 
    var body: some View {
        NavigationView {
            VStack {
                Toggle("Show large view", isOn: $basicViewState)
                    .padding()
                
                List(0..<restaurants.count, id: \.self) { index in
                        if(basicViewState==true){
                            FullImageRow(restaurant: restaurants[index])
                        }else{
                            BasicImageRow(restaurant: restaurants[index])
                        }
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
