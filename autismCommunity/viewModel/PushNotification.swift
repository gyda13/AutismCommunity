//
//  PuchNotification.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 04/06/1444 AH.
//


import SwiftUI
import CloudKit


class PushNotification: ObservableObject{
    
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

