//
//  PostView.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 22/05/1444 AH.
//

import SwiftUI


struct PostView: View {
    let post: PostTable
  
    var body: some View {
        ZStack
        {
        
            RoundedRectangle(cornerRadius: 20).fill(Color.white)
                .frame(width:318,height: 144)
            .overlay( RoundedRectangle(cornerRadius: 16).stroke( Color.gray,lineWidth:1)
            )
            
            VStack (spacing: 0)
            {
                //time
              
                Text(post.date, style: .time).frame(width:300,height: 23, alignment: .bottomTrailing).font(.custom( "Helvetica", size: 14))
          
                HStack (spacing: 0){ // pic
                    ZStack{ Image(chooseRandomImage())
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(40)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                    //Text("pic")
                        
                    }.frame(width:78,height: 73)
                    VStack(spacing: 0){
                        Text(post.title).frame(width:240,height: 17,alignment: .leading).font(.custom( "Helvetica", size: 16)).bold()
                        Text(post.describtion).frame(width:220,height: 57,alignment: .topLeading).font(.custom( "Helvetica", size: 16)).foregroundColor(.gray)
                       
                        
                    }
                }
                    // wirter
                Text(post.writer).frame(width:318,height: 17,alignment: .leading).font(.custom( "Helvetica", size: 14)).foregroundColor(.gray).offset(x:8)
                    HStack{
                        Text(post.date,style: .date).offset(x:10)
                    
                        
                        Text(String(post.num_of_comments)).offset(x:146)
                            Image(systemName: "message").offset(x:140)
                        
                       
                    }.frame(width:318,height: 31,alignment:.leading).font(.custom( "Helvetica", size: 14))
                    
                
                
            }.frame(width:318,height: 144)
         
            
        }.frame(width:318,height: 144)
    }
 
}

var images = ["Image1", "Image2", "Image3", "Image4"]

func chooseRandomImage() -> String {
    let array = images

    let result = array.randomElement()!

    return result
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: PostTable(title: "", writer: "", describtion: "", content: "", num_of_comments: 0))
     

    }
}
