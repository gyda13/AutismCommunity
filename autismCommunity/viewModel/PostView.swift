//
//  PostView.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 22/05/1444 AH.
//


import SwiftUI
import CloudKit
//struct CurvedSideRectangle:Shape{
//
//    func path(in rect: CGRect) -> Path {
//        Path { path in
//
//          path.move(to:CGPoint(x: rect.midX, y:rect.minY))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        }
//
//    }
//
//
//}

/*
extension VerticalAlignment{
    // or struct
    enum CustomAlignment: AlignmentID{
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    static let customAlignment = VerticalAlignment(CustomAlignment.self)
}*/

struct PostView: View {
    let post: PostTable
  
    var body: some View {
        ZStack //(alignment: .customAlignment)
        {
        //(alignment: .centerLastTextBaseline)
        
            RoundedRectangle(cornerRadius: 20).fill(Color.white)
                .frame(width:318,height: 144)//.alignmentGuide(.customAlignment){ d in d [VerticalAlignment.center]}
            .overlay( RoundedRectangle(cornerRadius: 16).stroke( Color.gray,lineWidth:1)//.alignmentGuide(.customAlignment){ d in d [VerticalAlignment.center]}
            )
            
            //Rectangle().foregroundColor(.red)
            //CurvedSideRectangle().frame(width:318,height: 144).foregroundColor(.red)
      
                //.frame(width:318,height: 144).clipShape(Circle())
           // Text(post.describtion)
          //  Text(post.content)
            VStack (spacing: 0) //(alignment:.centerLastTextBaseline)
            {
                
               //font name
                
                
                
                //time
              
                Text(post.date, style: .time).frame(width:300,height: 23, alignment: .bottomTrailing).font(.custom( "Helvetica", size: 14))
                //.topTrailing)//14.alignmentGuide(.customAlignment){ d in d [VerticalAlignment.center]//.CustomAlignment)
                  //  .background(.blue)
              
             
                    //.frame(width:318,height: 144).padding([.bottom])//,.trailing])
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
                        Text(post.title).frame(width:240,height: 17,alignment: .leading).font(.custom( "Helvetica", size: 16)).bold()//.background(.gray)
                        Text(post.describtion).frame(width:220,height: 57,alignment: .topLeading).font(.custom( "Helvetica", size: 16)).foregroundColor(.gray)//.background(.purple)
                       
                        
                    }
                }
                    // wirter
                Text(post.writer).frame(width:318,height: 17,alignment: .leading).font(.custom( "Helvetica", size: 14)).foregroundColor(.gray).offset(x:8)//.background(.brown)
                    HStack{ // date and number of comments
//                        let x : Int = post.num_of_comments
//                    let xNSNumber = x as NSNumber
//                        let xString : String = xNSNumber.string
                        Text(post.date,style: .date).offset(x:10)
                    
                        
//                        let Snum_of_comments = String(post.num_of_comments)
//                        Text(Snum_of_comments)
                        Text(String(post.num_of_comments)).offset(x:146)
                            Image(systemName: "message").offset(x:140)
                        
                       
                    }.frame(width:318,height: 31,alignment:.leading).font(.custom( "Helvetica", size: 14))//.background(.cyan)
                    
                
                
            }.frame(width:318,height: 144)
           
   
         //  RoundedRectangle(cornerRadius: 20).fill(Color.white) .frame(width:318,height: 144)
            
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
      //  PostView(post: Post.postExample)
        // مافهمت هنا المتغيرات
        PostView(post: PostTable(title: "", writer: "", describtion: "", content: "", num_of_comments: 0))
        
       // CurvedSideRectangle()

    }
}
