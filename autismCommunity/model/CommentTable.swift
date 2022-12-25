//
//  CommentTable.swift
//  autismCommunity
//
//  Created by sarah alnasser on 25/05/1444 AH.
//

import SwiftUI
import CloudKit
import PhotosUI

struct CommentTable: Identifiable {
    let id = UUID().uuidString
    let recordId: CKRecord.ID?
    var writer : String
    var content : String
    var date : Date = Date()
    var PostId : String
  

    init(recordId: CKRecord.ID? = nil,writer: String,
         content: String, date : Date = Date() , PostId: String) {
        
        self.writer = writer
        self.content = content
        self.date = date
        self.recordId = recordId
        self.PostId = PostId
        
    }
    
        init(record:CKRecord){
            self.recordId  = record.recordID
            self.writer  = record["writer"] as? String ?? "N/A"
            self.content  = record["content"] as? String ?? "N/A"
            self.date  = record["date"] as? Date ?? Date()
            self.PostId = record["PostId"] as? String ?? "N/A"
        }
    // why?
    func toDictionary() -> [String: Any] {
        return ["writer": writer, "content": content, "date": date , PostId: "PostId"]
    }
}



