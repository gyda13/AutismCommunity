//
//  Account.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 22/05/1444 AH.
//

import SwiftUI



struct Account: View {
    
    @State private var isOn = false
    
    @StateObject private var vm = PushNotification()


    var body: some View {
        NavigationView{
            VStack{
                VStack{
                               VStack {
                                  Image("Image1")
                                       .resizable().frame(width:120,height:120).clipShape(Circle()).overlay(Circle().stroke(Color.blue, lineWidth: 4))
                                   Text("Individual")
                                       .font(.body)
                                       .fontWeight(.light)
                               }
                                 
               
                               List{
                                   Section{
                                       VStack{
                                           Text("Name")
                                           HStack {
                                               Image(systemName: "person")
                                               Text("osamah")}
                                       }}
                                       
                                   Section{
                                       VStack{
                                           Text("Password")
                                           HStack{Image(systemName: "key")
                                               Text("*************")}}
               }
                                   
                             
                               }.listStyle(.inset)
                                .scrollDisabled(true)
                                .frame(width: 400, height: 140)
                             
                           }
                
                VStack{
                 
                    Toggle(isOn: $isOn) {
                        Text("Notifications")
                    }
                    .onChange(of: isOn) { newValue in
                        if newValue {
                            vm.subscribeToNotifications()
                        }
                        else{
                            vm.unsubscribeToNotifications()
                            
                        }
                        
                    }
                  
                }.padding(40)
                
                NavigationLink(destination: SignIn().navigationBarBackButtonHidden(true)){
                    
                    Text("Sign out")
                        .bold()
                        .frame(width: 320, height: 50)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                    
                }
            
                
            }
            .navigationBarTitle("Profile",displayMode: .automatic)
                .navigationBarItems( trailing: Button(action:{},label: {Image(systemName: "pencil")
                        .foregroundColor(.black)
                        .font(.title3)
                        
                }))
                
                
        }
    }
}

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account()
    }
}
