//
//  SignUp.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 27/05/1444 AH.
//

import SwiftUI


struct SignUp: View {
    
    @State  var email = ""
    @State  var password = ""
    @State  var wrongEmail = 0
    @State  var wrongPassword = 0
    @State  var showingLonginScreen = false
    @State  var selection = "Individual"
    @State  var id = ""

    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                VStack {
                    TextField("First name", text: $email)
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
                    TextField("Last name", text: $email)
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
                    TextField("ID", text: $id)
                        .padding()
                        .frame(width: 271 ,height:50)
                        .background(.clear)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 1)
                                .frame(width: 271 ,height:50))
                    
                    Text("ID provided for autustim people and their family")
                        .font(.caption)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
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
                VStack {
                    SecureField("Confirm password", text: $password)
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
               
                
            
               
                Picker("" , selection: $selection){
                    Text("Individual").tag("Individual")
                    Text("Specialist").tag("Specialist")
                }.pickerStyle(.segmented).frame(width: 270, height: 50)
                

                NavigationLink(destination: Account().navigationBarBackButtonHidden(true)){
                    Text("Sign Up")
                }
                    .frame(width: 270, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 7,style: .continuous)
                            .foregroundColor(.accentColor))
                    .foregroundColor(.white)
                
                
//                Button("Apple"){
//
//                }
//                .frame(width: 270, height: 50)
//                .background(
//                    RoundedRectangle(cornerRadius: 7,style: .continuous)
//                        .foregroundColor(.accentColor))
//                .foregroundColor(.white)
//
                VStack {
                    HStack {
                        Text("Already have an account?")
                        NavigationLink(destination: SignIn().navigationBarBackButtonHidden(true)){
                            Text("Sign In")
                        }
                    }
                }
                
              
            } .navigationBarBackButtonHidden(true)
            .navigationBarTitle("Sign Up", displayMode: .large)
        }
    }

    
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
