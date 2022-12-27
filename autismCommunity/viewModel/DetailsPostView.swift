//
//  DetailsPostView.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 25/05/1444 AH.
//

import SwiftUI


struct DetailsPostView: View {
    let post: PostTable
    
    var body: some View {
        ZStack
        {
       
            RoundedRectangle(cornerRadius: 20).fill(Color.white)
                .frame(width:318,height: 400)
            .overlay( RoundedRectangle(cornerRadius: 16).stroke( Color.gray,lineWidth:1)
            )
            
          
            VStack (spacing: 0)
            {
        
                HStack (spacing: 0){ // pic
                    ZStack{ Image(chooseRandomImage())
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(40)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                 
                    }.frame(width:78,height: 73)
                   VStack(spacing: 0){// title and discribtion
                        Text(post.title).frame(width:240,height: 40,alignment: .leading).font(.custom( "Helvetica", size: 16)).bold()
                       // wirter
                     Text("By :" + post.writer)  .frame(width:240,height: 10,alignment: .trailing).font(.custom( "Helvetica", size: 14)).foregroundColor(.gray).offset(x:-5)
        
                    }
                }.padding(2)
            
                Text(post.content).frame(width:310,height: 288,alignment: .topLeading).font(.custom( "Helvetica", size: 16)).foregroundColor(.black)
              
                
                
                    HStack{
                        Text(post.date, style: .time).offset(x:6)
                        Text("|")
                        Text(post.date,style: .date).offset(x:-2)
                        Text(String(post.num_of_comments)).offset(x:76)
                            Image(systemName: "message").offset(x:70)
                        
                       
                    }.frame(width:318,height: 31,alignment:.leading).font(.custom( "Helvetica", size: 14))
                    
                
                
            }.frame(width:318,height: 400)
           
   
        }.frame(width:318,height: 400)
    }
   
}

struct DetailsPostView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPostView(post: PostTable(title: "Autism spectrum disorder (ASD)", writer: "Sarah Alnasser", describtion: " Autism spectrum disorder (ASD) is a developmental disability", content: "Autism spectrum disorder (ASD) is a developmental disability caused by differences in the brain. People with ASD often have problems with social communication and interaction, and restricted or repetitive behaviors or interests. People with ASD may also have different ways of learning, moving, or paying attention Autism spectrum disorder (ASD) is a developmental disability caused by differences in the brain. People with ASD often have problems with social communication and interaction, and restricted or repetitive behaviors or interests.", num_of_comments: 0))
     
    }
}
