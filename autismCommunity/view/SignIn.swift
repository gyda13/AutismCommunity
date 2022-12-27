//
//  SignIn.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 27/05/1444 AH.
//


import SwiftUI

struct SignIn: View {

    @State  var email = ""
    @State  var password = ""
   
   
   
    
    var body: some View {
        
        NavigationView {
            VStack  (spacing: 10){
            
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 320 ,height:50)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 1)
                                .frame(width: 320 ,height:50))
                
                    SecureField("Password", text: $password)
                        .padding()
                        .foregroundColor(.black)
                        .frame(width: 320 ,height:50)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 1)
                                .frame(width: 320 ,height:50))
               
                
                NavigationLink(destination: Account().navigationBarBackButtonHidden(true)){
                    Text("Sign In")
                }
                .frame(width: 320, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 15,style: .continuous)
                        .foregroundColor(.accentColor))
                .foregroundColor(.white)
                
                VStack {
                    HStack {
                        Text("Dont have an account?")
                        NavigationLink(destination: SignUp().navigationBarBackButtonHidden(true)){
                            Text("Sign Up")
                        }
                    }
                }
                Spacer()
              
            }
            .navigationBarTitle("Sign in", displayMode: .large).padding(70)
            
        }
    }
    
  
    struct SignIn_Previews: PreviewProvider {
        static var previews: some View {
            SignIn()
        }
    }
}
