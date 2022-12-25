//
//  SignIn.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 27/05/1444 AH.
//


import Foundation
import SwiftUI

struct SignIn: View {

    @State  var email = ""
    @State  var password = ""
    @State  var wrongEmail = 0
    @State  var wrongPassword = 0
    @State  var showingLonginScreen = false
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        
        NavigationView {
            VStack  (spacing: 10){
                
                VStack {
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 271 ,height:50)
                        .background(.clear)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 1)
                                .frame(width: 271 ,height:50))
                }
                VStack {
                    SecureField("Password", text: $password)
                        .padding()
                        .foregroundColor(.black)
                        .background(.clear)
                        .border(.red, width:CGFloat(wrongPassword))
                        .frame(width: 271 ,height:50)
                        .background(.clear)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 1)
                                .frame(width: 271 ,height:50))
                }
            
                
                NavigationLink(destination: Account().navigationBarBackButtonHidden(true)){
                    Text("Sign In")
                }
                .frame(width: 270, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 7,style: .continuous)
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
