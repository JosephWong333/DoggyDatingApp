import SwiftUI

struct ThirdView: View {
    
//    var chosenName = ""
//    var chosenRating = 0.0
//    var dogIndex = -1
//      var dogAge = 0
    
    //temp vars below, up perm
    var chosenName = "Leila"
    var chosenRating = 1.0
    var dogIndex = 0
    var dogAge = 4
    
    let dogStatements: [String] = [
        "I love bones!",
        "Where's my ball?",
        "Time for a walk!",
        "Can I have a treat?",
        "I'm a good boy/girl!",
        "Belly rubs, please!",
        "I want to play fetch!",
        "I'm so excited to see you!",
        "Let's go for a car ride!",
        "I love cuddles!"
    ]
    
    var body: some View {
        ZStack{
                Image("Wood_BG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack{
                
                Text(chosenName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Image(chosenName)
                    .resizable()
                    .frame(width: 250, height: 250)
                
                Text("Rating: \(chosenRating)")
                    .font(.title)
                    .foregroundColor(.white)
                
                Text("Age: \(dogAge)")
                    .font(.title)
                    .foregroundColor(.white)
                
                Text("Description: \(dogStatements[dogIndex])")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
            }.navigationBarTitle("Chosen Dog")
        }
    }
}

struct ThirdView_Previews: PreviewProvider{
    static var previews: some View {
        ThirdView()
    }
}

