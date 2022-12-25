//
//  DetailsPostAndComment.swift
//  autismCommunity
//
//  Created by sarah alnasser on 25/05/1444 AH.
//


import SwiftUI
import PhotosUI
import CloudKit
import Foundation


struct DetailsPostAndComment: View {
       
    @State var commentArray : [CommentTable] = []
    @State var AddComment : String = ""
    
  // @StateObject private var vm: ListView
    
//    init(vm: ListView){
//        _vm = StateObject(wrappedValue: vm)
//    }
    
    
    let post: PostTable
    var body: some View {
        VStack{
            DetailsPostView (post: post)
         
          List  {
                
                ForEach(commentArray) { comment in
                    CommentView(comment: CommentTable(writer: comment.writer, content: comment.content, PostId:comment.PostId))
                    
                }
             
              //add comment
             // ZStack {
                  
                  TextField("Add your comment", text: $AddComment, axis: .vertical )
                      .lineLimit(2, reservesSpace: true).padding()
                      .frame(width: 318 ,height:73)
                      .background(.clear)
                      .cornerRadius(15)
                      .overlay(
                          RoundedRectangle(cornerRadius: 20)
                              .stroke(.gray, lineWidth: 1)
                              .frame(width: 318 ,height:100)).padding()
             
                  Button ("Submit"){
                      //if AddComment != nil {
                        
//                         vm.saveComment( writer: chooseRandomName(), content: AddComment,PostId: "test")
                       //   post.num_of_comments += 1
                      saveComment( writer: chooseRandomName(), content: AddComment,PostId: "test")
                          self.AddComment = " "
                     // }
                      
                  }.buttonStyle(.bordered)
                      .frame(width: 85, height: 35)
                      .background(
                        RoundedRectangle(cornerRadius: 7,style: .continuous)
                            .foregroundColor(Color.accentColor))
                      .foregroundColor(.white)
                      .font(.custom( "Helvetica", size: 16)).offset(x:230)
            //  }
              ///
              
              
            }.scrollContentBackground(.hidden)
            
            
        } .onAppear{
            fetchcomment()
        }
//        .onDisappear(){
//           commentArray = []
//        }
        
    }
    
    func fetchcomment(){
        
           let predicate = NSPredicate(value: true)
           let query = CKQuery(recordType:"CommentTable", predicate: predicate)


           let operation = CKQueryOperation(query: query)
           operation.recordMatchedBlock = { recordId, result in
               DispatchQueue.main.async {
                   switch result{
                   case .success(let record):
                       let comment = CommentTable(record: record)
                       self.commentArray.append(comment)
                   case .failure(let error):
                       print("\(error.localizedDescription)")
                   }
               }
           }

      CKContainer(identifier: "iCloud.demo.autismCommunity.community").publicCloudDatabase.add(operation)
       }

}

struct DetailsPostAndComment_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPostAndComment(post: PostTable(title: "Autism spectrum disorder (ASD)", writer: "Sarah Alnasser", describtion: " Autism spectrum disorder (ASD) is a developmental disability", content: "Autism spectrum disorder (ASD) is a developmental disability caused by differences in the brain. People with ASD often have problems with social communication and interaction, and restricted or repetitive behaviors or interests. People with ASD may also have different ways of learning, moving, or paying attention Autism spectrum disorder (ASD) is a developmental disability caused by differences in the brain. People with ASD often have problems with social communication and interaction, and restricted or repetitive behaviors or interests.", num_of_comments: 0))//, vm: ListView(container: CKContainer.default() )
    }
}



func saveComment( writer: String,
                  content: String ,PostId: String, date: Date = Date() ){
    
    let record = CKRecord(recordType: "CommentTable")
   
        let comment = CommentTable(writer: writer, content: content, date: date, PostId: PostId )
   record.setValuesForKeys(comment.toDictionary())
    
    CKContainer(identifier: "iCloud.demo.autismCommunity.community").publicCloudDatabase.save(record) { newRecord, error in
        if let _ = newRecord {
            print("saved")
        }
    }
    
}





