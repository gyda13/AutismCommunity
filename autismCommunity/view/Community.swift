//
//  Community.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 22/05/1444 AH.
//


import SwiftUI
import CloudKit


struct Community: View {
    
    @State var searchQuery = ""
    @State var selection: String = "Individual"
    
    @State var postArray : [PostTable] = []
    @State var SpecialistPostArray : [SpecialistPost] = []
    @State var commentArray : [CommentTable] = []
    
    @StateObject private var vm: ListView

    @State private var AddComment : String = ""

    
    init(vm: ListView){
        _vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                
                
                Picker("" , selection: $selection){
                    
                    Text("Individual").tag("Individual")
                    Text("Specialisit").tag("Specialisit")
                    
                    
                }.pickerStyle(.segmented).padding()
                
                if selection == "Individual"{
                    
                    
                    List{
                        
                        ForEach(postArray) { post in
                            NavigationLink {
                                DetailsPostView(post: PostTable(title: post.title, writer: post.writer, describtion: post.describtion, content: post.content, num_of_comments: post.num_of_comments, date: post.date))
                                List{
                                    ForEach(commentArray) { comment in
                                        CommentView(comment: CommentTable(writer: comment.writer, content: comment.content, PostId:comment.PostId))
                                    }
                                    TextField("Add your comment", text: $AddComment, axis: .vertical )
                                        .lineLimit(2, reservesSpace: true).padding()
                                        .frame(width: 318 ,height:73)
                                        .background(.clear)
                                        .cornerRadius(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(.gray, lineWidth: 1)
                                                .frame(width: 318 ,height:100)).padding()
                               
                                    .onSubmit {
                                        vm.saveComment( writer: chooseRandomName(), content: AddComment,PostId: "test")
                                            self.AddComment = " "
                                   
                                        
                                    }.submitLabel(.send)
                                }.scrollContentBackground(.hidden)
                            } label: {
                              
                                PostView(post: PostTable(title: post.title, writer: post.writer, describtion: post.describtion, content: post.content, num_of_comments: post.num_of_comments, date: post.date))
                                                              
                            }
                            
                        }
                        
                        
                    }.scrollContentBackground(.hidden)
                    
                }
                else{
                    List{
                        ForEach(SpecialistPostArray) { spost in
                            NavigationLink {
                                
                                DetailsSPostView(specialistPost: SpecialistPost(title: spost.title, writer: spost.writer, describtion: spost.describtion, content: spost.content, num_of_comments: spost.num_of_comments, date: spost.date)) 
                            } label: {
                              
                                SpecialistPostView(specialistPost: SpecialistPost(title: spost.title, writer: spost.writer, describtion: spost.describtion, content: spost.content, num_of_comments: spost.num_of_comments, date: spost.date))
                            
                            }
                            
                            
                            
                        }
                        
                    }.scrollContentBackground(.hidden)
                }
                
                
                
            }
            .onAppear{
                 fetchPost()
                fetchSPost()
                fetchcomment()
            }

            .searchable(text: $searchQuery)
            .navigationTitle("Community")
          
            .toolbar {
                VStack{
                    Button {
                        print("Edit button was tapped")
                    } label: {
                        VStack{
                            Image(systemName: "list.bullet.clipboard")
                                .foregroundColor(Color.black)
                            Text("Survey").foregroundColor(.black)
                        }
                    }
                   
                    
                }
            }
          
        }
    
    }
    
    
    
    func fetchPost(){
        postArray = []
     
           let predicate = NSPredicate(value: true)
           let query = CKQuery(recordType:"PostTable", predicate: predicate)

    
           let operation = CKQueryOperation(query: query)
           operation.recordMatchedBlock = { recordId, result in
               DispatchQueue.main.async {
                   switch result{
                   case .success(let record):
                       let posts = PostTable(record: record)
                       self.postArray.append(posts)
                   case .failure(let error):
                       print("\(error.localizedDescription)")
                   }
               }
           }

      CKContainer(identifier: "iCloud.demo.autismCommunity.community").publicCloudDatabase.add(operation)
       }
    
    func fetchSPost(){
         SpecialistPostArray = []
           let predicate = NSPredicate(value: true)
           let query = CKQuery(recordType:"SpecialistPost", predicate: predicate)

           let operation = CKQueryOperation(query: query)
           operation.recordMatchedBlock = { recordId, result in
               DispatchQueue.main.async {
                   switch result{
                   case .success(let record):
                       let posts = SpecialistPost(record: record)
                       self.SpecialistPostArray.append(posts)
                   case .failure(let error):
                       print("\(error.localizedDescription)")
                   }
               }
           }

      CKContainer(identifier: "iCloud.demo.autismCommunity.community").publicCloudDatabase.add(operation)
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
        
    struct Community_Previews: PreviewProvider {
        static var previews: some View {
            Community(vm: ListView(container: CKContainer.default()))
        }
    }
}
