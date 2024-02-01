//
//  ContentView.swift
//  DoggyDating
//
//  Created by Joseph Wong on 31/10/2023.
//

import SwiftUI

// Storages
struct Dog: Hashable {
    var name: String
    var age: Int
    var rating: Double
    var index: Int
    // by default rank will be 100*
    
}

var dogList: [Dog] = [Dog(name: "Ted", age: 3, rating: 100, index: 0), Dog(name: "Sarah", age: 3, rating: 100, index: 1), Dog(name: "Leila", age: 4, rating: 100, index: 2), Dog(name: "Harry", age: 4, rating: 100, index: 3), Dog(name: "Ben", age: 4, rating: 100, index: 4), Dog(name: "Chloe", age: 2, rating: 100, index: 5), Dog(name: "Giga", age: 8, rating: 100, index: 6), Dog(name: "Georgina", age: 6, rating: 100, index: 7), Dog(name: "Snowflake", age: 5, rating: 100, index: 8)]

// Main Start Func
struct ContentView: View {
    
    @State private var isSecondViewActive = false
    
    @State
    var index1 = 0
    @State
    var index2 = 1
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Wood_BG")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: SecondView(), isActive: $isSecondViewActive) {
                        EmptyView()
                    }
                    
                    Text("Which Dog has more RIZZ!!! 🔥🫢🥶🥵").foregroundColor(Color.white).bold()
                    
                    Spacer()
                    
                    HStack{
                        VStack{
                            Text(dogList[index1].name).font(.title).foregroundColor(Color.white).bold()
                            Image(dogList[index1].name)
                                .resizable()
                                .frame(width: 200, height: 200)
                            Button(action: {
                                var dog1 = dogList[index1]
                                var dog2 = dogList[index2]
                                
                                Rating(player1: &dog1, player2: &dog2, d: 1)
                                
                                print (dog1.rating)
                                print (dog2.rating)
                                
                                dogList[index1] = dog1
                                dogList[index2] = dog2
                                
                                // Updates indexes
                                
                                if index2 == dogList.count - 1 && index1 < dogList.count - 1{
                                    index1 += 1
                                    index2 = 0
                                }
                                else if index2 == dogList.count - 2 && index1 == dogList.count - 1 {
                                    //done
                                    print("YO")
                                    isSecondViewActive = true
                                    
                                }
                                else {
                                    index2 += 1
                                    
                                    //Checks if the indexes are the same so we can skip rating the same dog by themselves
                                    if checkSame(_index1: index1, _index2: index2){
                                        index2 += 1
                                    }
                                }
                                
                            }) {
                                Text("This Dog")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                
                            }
                        }
                        VStack{
                            Text(dogList[index2].name).font(.title).foregroundColor(Color.white).bold()
 
                            Image(dogList[index2].name)
                                .resizable()
                                .frame(width: 200, height: 200)
                            Button(action: {
                                var dog1 = dogList[index1]
                                var dog2 = dogList[index2]
                                
                                Rating(player1: &dog1, player2: &dog2, d: 0)
                                
                                print (dog1.rating)
                                print (dog2.rating)
                                
                                dogList[index1] = dog1
                                dogList[index2] = dog2
                                
                                // Updates indexes
                                
                                if index2 == dogList.count - 1 && index1 < dogList.count - 1{
                                    index1 += 1
                                    index2 = 0
                                    
                                }
                                else if index2 == dogList.count - 2 && index1 == dogList.count - 1 {
                                    //done
                                    isSecondViewActive = true
                                    print("YO2")
                                }
                                else {
                                    index2 += 1
                                    
                                    //Checks if the indexes are the same so we can skip rating the same dog by themselves
                                    if checkSame(_index1: index1, _index2: index2){
                                        index2 += 1
                                    }
                                }
                                
                            }) {
                                Text("That Dog")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        //reset the indexes
                        index1 = 0
                        index2 = 1
                        
                        //reset the elo ratings
                        for index in dogList.indices {
                            dogList[index].rating = 100
                        }
                        
                    }) {
                        Text("RESET")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200)
                            .frame(height: 30)
                            .background(Color.pink)
                            .cornerRadius(10)
                        
                    }
                    
                    Spacer()
                }
            }
            .padding()
        }
    }
}

// Main Funcs
func Probability (rating1: Double, rating2: Double) -> Double {
    let value = 1.0 / ( 1.0 + pow(10, ( ( rating1 - rating2 ) / 200 ) ) )
    return value
}

func Rating (player1: inout Dog, player2: inout Dog, d: Double) {
    let K = 30.0
    
    let Pb = Probability(rating1: player1.rating, rating2: player2.rating)
    let Pa = Probability(rating1: player2.rating, rating2: player1.rating)
    
    if d == 1{
        //Case 1: Player 1 wins
        player1.rating = player1.rating + K * (1 - Pa)
        player2.rating = player2.rating + K * (0 - Pb)
    }
    else {
        player1.rating = player1.rating + K * (0 - Pa)
        player2.rating = player2.rating + K * (1 - Pb)
    }
}

func checkSame(_index1: Int, _index2: Int) -> Bool{
    return _index1 == _index2
}

// Extra Funcs
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

