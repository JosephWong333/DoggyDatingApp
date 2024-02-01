
import SwiftUI

struct LoginView: View {
    @State private var isSecondViewActive = false
    @State private var isThirdViewActive = false
    
    @State private var username = ""
    @State private var password = ""
    
    @State private var textContent = "Enter credentials"
    @State private var textColor = Color.gray
        
    var body: some View {
        NavigationView {
            ZStack{
                Image("Wood_BG")
                    .resizable()
                    .ignoresSafeArea()
                
            VStack(alignment: .center) {
                
                Spacer()
                
                Image("Ben").resizable().aspectRatio(contentMode: .fit).padding(.horizontal, 30.0)
                
                Spacer()
                
                NavigationLink(destination: ContentView(), isActive: $isSecondViewActive) {
                    EmptyView()
                }
                
                NavigationLink(destination: View2(), isActive: $isThirdViewActive) {
                    EmptyView()
                }
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                TextField("Password", text: $password)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Text("\(textContent)")
                    .foregroundColor(textColor)

                HStack{
                    Button(action: {
                        if (username == "Joseph" && password == "1234"){
                            textContent = "Correct Credentials :D"
                            textColor = Color.green
                            
                            isSecondViewActive = true
                        }
                        else{
                            textContent = "Invalid Credentials >:("
                            textColor = Color.red
                        }
                       
                        
                    }) {
                        Text("LOGIN TO APP")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                        
                    }
                    
                    Button(action: {
                        if (username == "Joseph" && password == "1234"){
                            textContent = "Correct Credentials :D"
                            textColor = Color.green
                            
                            isThirdViewActive = true
                        }
                        else{
                            textContent = "Invalid Credentials >:("
                            textColor = Color.red
                        }
                       
                        
                    }) {
                        Text("LOGIN TO PROFILE")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                        
                    }
                    
                }

                Spacer()
                
                
            }.navigationTitle("DOGGY DATING APP").navigationBarTitleDisplayMode(.large)
            }
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}


//
//  View2.swift
//  LoginApp
//
//  Created by Joseph Wong on 7/9/2023.
//

import SwiftUI

struct View2: View {
    @State private var phone_number = "☎️: " + "+852 9999 9999"
    
    @State private var address = "🏡: " + "Tai Tam, Hong Kong"
    
    @State private var email = "📧: " + "Placeholder@gmail.com"
    
    @State private var description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("Beach2BG")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(){
                    
                    Text("Your Profile:")
                        .fontWeight(.bold)
                    
                    Image("Us")
                        .resizable()
                        .frame(width: 200, height: 200)
//                        .padding(.horizontal, 50.0)
//                        .padding(.all, 10.0)
//                        .background(Color.white)
//                        .cornerRadius(8)
//                        .shadow(color: Color.gray, radius: 4, x: 0, y: 2).font(.system(size: 120))
                    
                    Text("Your Description:")
                        .fontWeight(.bold)
                    
                    TextField("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", text: $description)
                        .padding(.horizontal, 10.0)
                        .padding(.vertical, 20.0)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.gray, radius: 4, x: 0, y: 2).font(.system(size: 15))
                    
                    Text("Your Personal Information:")
                        .fontWeight(.bold)
                    
                    TextField("☎️: +852 9999 9999", text: $phone_number)
                        .padding(.horizontal, 90.0)
                        .padding(.vertical, 20.0)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.gray, radius: 4, x: 0, y: 2).font(.system(size: 20))
                    
                    TextField("🏡: Tai Tam, Hong Kong", text: $address)
                        .padding(.horizontal, 90.0)
                        .padding(.vertical, 20.0)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.gray, radius: 4, x: 0, y: 2).font(.system(size: 20))
                    
                    TextField("📧: Placeholder@gmail.com", text: $email)
                        .padding(.horizontal, 90.0)
                        .padding(.vertical, 20.0)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.gray, radius: 4, x: 0, y: 2).font(.system(size: 15))
                    
                    Spacer()
                    
                }.navigationTitle("Welcome Joseph!").navigationBarTitle(Text("Title"), displayMode: .inline)
            }
        }
    }
}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2()
    }
}
