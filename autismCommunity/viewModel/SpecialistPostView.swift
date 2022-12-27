//
//  SpecialistPostView.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 24/05/1444 AH.
//


import SwiftUI



struct SpecialistPostView: View {
 
    let specialistPost: SpecialistPost
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
              
                Text(specialistPost.date, style: .time).frame(width:300,height: 23, alignment: .bottomTrailing).font(.custom( "Helvetica", size: 14))
              
              
                HStack (spacing: 0){ // pic
                    ZStack{ Image(chooseRandomImage())
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(40)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.green, lineWidth: 2))
                    
                        
                    }.frame(width:78,height: 73)
                    VStack(spacing: 0){
                        Text(specialistPost.title).frame(width:240,height: 17,alignment: .leading).font(.custom( "Helvetica", size: 16)).bold()
                        Text(specialistPost.describtion).frame(width:220,height: 57,alignment: .topLeading).font(.custom( "Helvetica", size: 16)).foregroundColor(.gray)
                       
                        
                    }
                }
                    // wirter
                Text(specialistPost.writer).frame(width:318,height: 17,alignment: .leading).font(.custom( "Helvetica", size: 14)).foregroundColor(.gray).offset(x:8)
                    HStack{
                        Text(specialistPost.date,style: .date).offset(x:10)
                    
        
                        Text(String(specialistPost.num_of_comments)).offset(x:146)
                            Image(systemName: "message").offset(x:140)
                        
                       
                    }.frame(width:318,height: 31,alignment:.leading).font(.custom( "Helvetica", size: 14))
                    
                
                
            }.frame(width:318,height: 144)
           
   
            
        }.frame(width:318,height: 144)
    }
 
}

struct SpecialistPostView_Previews: PreviewProvider {
    static var previews: some View {
  
        SpecialistPostView(specialistPost: SpecialistPost(title: "", writer: "", describtion: "", content: "", num_of_comments: 0))
        
    }
}
