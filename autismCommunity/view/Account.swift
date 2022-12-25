//
//  Account.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 22/05/1444 AH.
//

import SwiftUI
import CloudKit

class PushNotificationViewModel: ObservableObject{
    
    func requestNotificationPermissions(){
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options){ success, error in
            if let error = error {
                print(error)
            } else if success {
                print("Notification permissions success!")
                
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                print("Notification permissions failure.")
            }
            
        }
    }
    
    func subscribeToNotifications(){
        let predicate = NSPredicate(value: true)
        
        let subscription = CKQuerySubscription(recordType: "SpecialistPost", predicate: predicate, subscriptionID: "SpecialistPost_added_to_DB", options: .firesOnRecordCreation)
        
        let notification = CKSubscription.NotificationInfo()
        notification.title = "New Specialist Post"
        notification.alertBody = "Open the app to check what's new !!"
        notification.soundName = "default"
        subscription.notificationInfo = notification
        
        CKContainer(identifier: "iCloud.demo.autismCommunity.community").publicCloudDatabase.save(subscription) { returnedSubscription, returnedError in
            if let error = returnedError {
                print(error)
            } else {
                print("Successfully subsribed to notifications.")
            }
            
        }
    }
    
    func unsubscribeToNotifications(){
        
        CKContainer(identifier: "iCloud.demo.autismCommunity.community").publicCloudDatabase.delete(withSubscriptionID: "SpecialistPost_added_to_DB") { returnedID, returnedError in
            if let error = returnedError {
                print(error)
            } else {
                print("Successfully Unsubsribed.")
            }
        }
    }
    
}


struct Account: View {
    
    @State private var isOn = false
    
    
    @StateObject private var vm = PushNotificationViewModel()


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
                               }.padding(10)
                               Spacer()
                                   
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
                                   
                                   Section{
                                       VStack(alignment: .leading){
                                       Text("     Email")
                                       HStack{Image(systemName: "envelope")
                                       Text("osama@gmail.com")}}
                                       
                                   }
                                   
                               }.listStyle(.inset)
                                   .padding(30)
                                .scrollDisabled(true)
                             
                           }
                
                VStack{
                    Button(
                        action: { vm.requestNotificationPermissions() }){ Text("Request Notification Permissions").underline()}
                    
                    
                    
                    
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
                  
                }.padding(60)
                
                NavigationLink(destination: SignIn().navigationBarBackButtonHidden(true)){
                    
                    Text("Sign out")
                        .bold()
                        .frame(width: 270, height: 50)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
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
