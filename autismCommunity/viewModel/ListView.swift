//
//  ListView.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 22/05/1444 AH.
//

import Foundation
import CloudKit


enum RecordType: String {
    case post = "PostTable"
    
    case specialistPost = "SpecialistPost"
    case comment = "CommentTable"
}

class ListView: ObservableObject {
    
    
    private var database: CKDatabase
    private var container: CKContainer
    
    init(container: CKContainer){
        
        self.container = container
        self.database = self.container.publicCloudDatabase
    }
    
    func savePost(title: String, writer: String, describtion: String,
                  content: String, num_of_comments: Int, date: Date = Date() ){
        
        let record = CKRecord(recordType: RecordType.post.rawValue)
       
        let post = PostTable(title: title, writer: writer, describtion: describtion, content: content, num_of_comments: num_of_comments, date: date)
       record.setValuesForKeys(post.toDictionary())
        
        self.database.save(record) { newRecord, error in
            if let _ = newRecord {
                print("saved")
            }
        }
        
    }
    
    func saveSpecialistPost(title: String, writer: String, describtion: String,
                  content: String, num_of_comments: Int , date: Date = Date() ){
        
        let record = CKRecord(recordType: RecordType.specialistPost.rawValue)
       
            let specialistPost = SpecialistPost(title: title, writer: writer, describtion: describtion, content: content, num_of_comments: num_of_comments, date: date )
       record.setValuesForKeys(specialistPost.toDictionary())
        
        self.database.save(record) { newRecord, error in
            if let _ = newRecord {
                print("saved")
            }
        }
        
    }
 
    func saveComment( writer: String,
                      content: String ,PostId: String, date: Date = Date() ){
        
        let record = CKRecord(recordType: RecordType.comment.rawValue)
       
            let comment = CommentTable(writer: writer, content: content, date: date, PostId: PostId )
       record.setValuesForKeys(comment.toDictionary())
        
        self.database.save(record) { newRecord, error in
            if let _ = newRecord {
                print("saved")
            }
        }
        
    }
    
    

    
}
