
//
//  DetailsPostView.swift
//  autismCommunity
//
//  Created by sarah alnasser on 25/05/1444 AH.
//

import SwiftUI
import CloudKit
struct DetailsSPostView: View {
    let specialistPost: SpecialistPost
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
                    //Text("pic")
                        
                    }.frame(width:78,height: 73)//.background(.red)
                   VStack(spacing: 0){// title and discribtion
                        Text(specialistPost.title).frame(width:240,height: 40,alignment: .leading).font(.custom( "Helvetica", size: 16)).bold()//.background(.gray)
                       // wirter
                     Text("By: " + specialistPost.writer)  .frame(width:240,height: 10,alignment: .trailing).font(.custom( "Helvetica", size: 14)).foregroundColor(.gray).offset(x:-5)//.background(.brown)
        
                    }
                }.padding(2)
            
                Text(specialistPost.content).frame(width:310,height: 288,alignment: .topLeading).font(.custom( "Helvetica", size: 16)).foregroundColor(.black)//.background(.purple)
                
                
                    HStack{
                        Text(specialistPost.date, style: .time).offset(x:6)
                        Text("|")
                        Text(specialistPost.date,style: .date).offset(x:-2)
                        Text(String(specialistPost.num_of_comments)).offset(x:76)
                            Image(systemName: "message").offset(x:70)
                        
                       
                    }.frame(width:318,height: 31,alignment:.leading).font(.custom( "Helvetica", size: 14))//.background(.cyan)
                    
                
                
            }.frame(width:318,height: 400)
           
   
        }.frame(width:318,height: 400)
    }
   
}

struct DetailsSPostView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsSPostView(specialistPost: SpecialistPost(title: "Autism spectrum disorder (ASD)", writer: "Sarah Alnasser", describtion: " Autism spectrum disorder (ASD) is a developmental disability", content: "Autism spectrum disorder (ASD) is a developmental disability caused by differences in the brain. People with ASD often have problems with social communication and interaction, and restricted or repetitive behaviors or interests. People with ASD may also have different ways of learning, moving, or paying attention Autism spectrum disorder (ASD) is a developmental disability caused by differences in the brain. People with ASD often have problems with social communication and interaction, and restricted or repetitive behaviors or interests.", num_of_comments: 0))
     
    }
}
