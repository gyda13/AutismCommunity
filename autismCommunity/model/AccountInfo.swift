//
//  AccountInfo.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 04/06/1444 AH.
//


import CloudKit


struct AccountInfo: Identifiable {
    let id = UUID().uuidString
    let recordId: CKRecord.ID?
    var name: String
    var email : String
    var  password : String
    var userID : String
    var type : String
    
    init(recordId: CKRecord.ID? = nil,name: String,
         email: String, password: String, userID: String, type: String) {
        
        self.name = name
        self.email = email
        self.password = password
        self.userID = userID
        self.type = type
        self.recordId = recordId
        
    }
    
        init(record:CKRecord){
            self.recordId  = record.recordID
            self.name  = record["name"] as? String ?? "N/A"
            self.email  = record["email"] as? String ?? "N/A"
            self.password = record["password"] as? String ?? "N/A"
            self.userID = record["userID"] as? String ?? "N/A"
            self.type = record["type"] as? String ?? "N/A"
        }

    func toDictionary() -> [String: Any] {
        return ["name": name, "email": email, "password": password, "userID": userID, "type": type]
    }
}
