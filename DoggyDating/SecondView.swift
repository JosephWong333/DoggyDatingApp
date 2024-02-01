import SwiftUI

struct SecondView: View {
    var sortedDogList: [Dog] {
        dogList.sorted { $0.rating > $1.rating }
    }
    
    var body: some View {
        ZStack {
//            Image("BG")
//                .resizable()
//                .edgesIgnoringSafeArea(.all) // Ensure the image covers the entire view
            
            List(sortedDogList, id: \.self) { dog in
                NavigationLink(destination: ThirdView(chosenName: dog.name, chosenRating: dog.rating, dogIndex: dog.index, dogAge: dog.age)) {
                    
                    HStack {
                        Image(dog.name)
                            .resizable()
                            .frame(width: 55, height: 55)
                        VStack(alignment: .leading) {
                            Text(dog.name)
                                .font(.headline)
                            Text("Rating: \(dog.rating)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
                    .background(Image("Beach2BG")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                        .scaledToFill()) 
            
            .navigationBarTitle("Dog List")
        }
        .background(Color.clear)
    }
}
