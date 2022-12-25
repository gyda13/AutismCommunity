//
//  PostTable.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 22/05/1444 AH.
//

import CloudKit
import PhotosUI



struct PostTable: Identifiable {
    let id = UUID().uuidString
    let recordId: CKRecord.ID?
    var title: String
    var writer : String
    var  describtion : String
    var content : String
    var date : Date = Date()
    var num_of_comments : Int = 0
  

    init(recordId: CKRecord.ID? = nil, title: String, writer: String, describtion: String,
         content: String, num_of_comments: Int,  date : Date = Date()) {
        
        self.title = title
        self.writer = writer
        self.describtion = describtion
        self.content = content
        self.date = date
        self.num_of_comments = num_of_comments
        self.recordId = recordId
        
    }
    
        init(record:CKRecord){
            self.recordId  = record.recordID
            self.title = record["title"] as? String ?? "N/A"
            self.writer  = record["writer"] as? String ?? "N/A"
            self.describtion    = record["describtion"] as? String ?? "N/A"
            self.content    = record["content"] as? String ?? "N/A"
            self.num_of_comments  = record["num_of_comments"] as? Int ?? 0
            self.date  = record["date"] as? Date ?? Date()
        }
    
    func toDictionary() -> [String: Any] {
        return ["title": title, "writer": writer, "describtion": describtion, "content": content, "num_of_comments": num_of_comments, "date": date]
    }
}



