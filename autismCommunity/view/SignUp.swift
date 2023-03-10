//
//  SignUp.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 27/05/1444 AH.
//

import SwiftUI


struct SignUp: View {
    
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @State var id = ""
    
    
    @State  var showingLonginScreen = false
    @State  var selection = "Individual"
   

    
    var body: some View {
        NavigationView {
            VStack {
               
                    TextField("Name", text: $name)
                        .padding()
                        .frame(width: 320 ,height:50)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 1)
                                .frame(width: 320 ,height:50))
                
           
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 320 ,height:50)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 1)
                                .frame(width: 320 ,height:50))
    
                    TextField("ID", text: $id)
                        .padding()
                        .frame(width: 320 ,height:50)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 1)
                                .frame(width: 320 ,height:50))
                    
                    Text("ID provided for autustim people and their family")
                        .font(.caption)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                
          
                    SecureField("Password", text: $password)
                        .padding()
                        .foregroundColor(.black)
                        .background(.clear)
                        .frame(width: 320 ,height:50)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 1)
                                .frame(width: 320 ,height:50))
                
           
                   
            
                Picker("" , selection: $selection){
                    Text("Individual").tag("Individual")
                    Text("Specialist").tag("Specialist")
                }.pickerStyle(.segmented).frame(width: 320, height: 50)
                
                
                    NavigationLink(destination: Account().navigationBarBackButtonHidden(true)){
                        Text("Sign Up")
                    }
                    .frame(width: 320, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .foregroundColor(.accentColor))
                    .foregroundColor(.white)
                    
                    
                    HStack {
                        Text("Already have an account?")
                        NavigationLink(destination: SignIn().navigationBarBackButtonHidden(true)){
                            Text("Sign In")
                        }
                    }
                
          
                
                
                  
              
            }.navigationBarBackButtonHidden(true)
                .navigationTitle("Sign Up")
              
        }
        
    }

    
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
