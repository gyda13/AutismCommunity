//
//  autismCommunityApp.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 22/05/1444 AH.
//

import SwiftUI
import CloudKit

@main
struct autismCommunityApp: App {
    
    
    let container = CKContainer(identifier: "iCloud.demo.autismCommunity.community").publicCloudDatabase
    
    var body: some Scene {
        WindowGroup {
        Welcome()
          
            
        }
        
    }
}

struct Previews_autismCommunityApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
