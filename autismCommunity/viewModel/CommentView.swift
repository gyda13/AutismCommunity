//
//  CommentView.swift
//  autismCommunity
//
//  Created by sarah alnasser on 25/05/1444 AH.
//








import SwiftUI
import CloudKit

struct CommentView: View {
    let comment: CommentTable
  
    var body: some View {
        ZStack
        {
    
            RoundedRectangle(cornerRadius: 20).fill(Color.white)
                .frame(width:318,height: 144)
            .overlay( RoundedRectangle(cornerRadius: 16).stroke( Color.gray,lineWidth:1)
            )
            
       
            VStack (spacing: 0)
            {
                
              
                HStack (spacing: 0){ // pic
                    VStack{
                    ZStack{ Image(chooseRandomImage())
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(40)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                        //Text("pic")
                        
                    }.frame(width:78,height: 73)//.background(.red)
                        // wirter
                    Text(comment.writer).frame(width:78,height: 14,alignment: .leading).font(.custom( "Helvetica", size: 14)).foregroundColor(.gray)//.offset(x:8)//.background(.brown)
                }
                    //VStack(spacing: 0){// title and discribtion
                        //Text(comment.title).frame(width:240,height: 17,alignment: .leading).font(.custom( "Helvetica", size: 16)).bold()//.background(.gray)
                    Text(comment.content).frame(width:232,height: 120,alignment:.center).font(.custom( "Helvetica", size: 16)).foregroundColor(.black)//.background(.purple)
                       
                        
                  //  }
                }.frame( width: 318, height: 120)
              
                    HStack{
                        Text(comment.date, style: .time).offset(x:6)
                        Text("|")
                        Text(comment.date,style: .date).offset(x:-2)
                    

                       // Text(String(post.num_of_comments)).offset(x:146)
                          //  Image(systemName: "message").offset(x:140)
                        
                       
                    }.frame(width:318,height: 20,alignment:.leading).font(.custom( "Helvetica", size: 14))//.background(.cyan)
                    
                
                
            }.frame(width:318,height: 144)
           
   
              
        }.frame(width:318,height: 144)
    }
 
}

struct CommentView_Previews:PreviewProvider {
    static var previews: some View {
    
        CommentView(comment: CommentTable(writer: "Sarah Mo", content: "I found your post very informative and would like to include my thoughts in your response to thediscussion.I completely agree with your point ", PostId: ""))

    }
}



//-- old

/*
struct CommentView: View {
    let comment: CommentTable
  
    var body: some View {
        ZStack
        {
    
            RoundedRectangle(cornerRadius: 20).fill(Color.white)
                .frame(width:318,height: 144)
            .overlay( RoundedRectangle(cornerRadius: 16).stroke( Color.gray,lineWidth:1)
            )
            
       
            VStack (spacing: 0)
            {
                
              
                Text(comment.date, style: .time).frame(width:300,height: 23, alignment: .bottomTrailing).font(.custom( "Helvetica", size: 14)).background(.gray)
                
                HStack (spacing: 0){ // pic
                    ZStack{ Image(chooseRandomImage())
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(40)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                    //Text("pic")
                        
                    }.frame(width:78,height: 73).background(.red)
                    VStack(spacing: 0){// title and discribtion
                        //Text(comment.title).frame(width:240,height: 17,alignment: .leading).font(.custom( "Helvetica", size: 16)).bold()//.background(.gray)
                        Text(comment.content).frame(width:220,height: 57,alignment: .topLeading).font(.custom( "Helvetica", size: 16)).foregroundColor(.gray).background(.purple)
                       
                        
                    }
                }
                    // wirter
                Text(comment.writer).frame(width:318,height: 17,alignment: .leading).font(.custom( "Helvetica", size: 14)).foregroundColor(.gray).offset(x:8)//.background(.brown)
                    HStack{
                        Text(comment.date,style: .date).offset(x:10)
                    

                       // Text(String(post.num_of_comments)).offset(x:146)
                          //  Image(systemName: "message").offset(x:140)
                        
                       
                    }.frame(width:318,height: 31,alignment:.leading).font(.custom( "Helvetica", size: 14)).background(.cyan)
                    
                
                
            }.frame(width:318,height: 144)
           
   
              
        }.frame(width:318,height: 144)
    }
 
}

*/
