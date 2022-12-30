//
//  Welcome.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 22/05/1444 AH.
//

import SwiftUI

struct Welcome: View {
    @State private var isActive = false
    
    
    @StateObject private var vm = PushNotification()
    
    var body: some View {
        
        VStack{
            if isActive {
                TabBar()
                
            }else{
                Logoanimation()
                
            }
        }.onAppear(){
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0){
                self.isActive = true
                
                vm.requestNotificationPermissions()
            }
        }
    }
    
    
    struct Welcome_Previews: PreviewProvider {
        static var previews: some View {
            Welcome()
        }
    }
    
    
    struct Logoanimation: View {
        
        @State private var whiteball = false
        @State private var blueball = false
        
        
        @State private var size = 0.8
        @State private var opacity = 0.5
        
        
        var body: some View {
            
            
            ZStack{
                Color.accentColor.edgesIgnoringSafeArea(.all).opacity(0.8)
                ZStack{
                    
                    
                    Circle()
                        .frame(width: 380, height: 380, alignment: .center)
                        .foregroundColor(.white)
                        .opacity(0.2)
                        .blur(radius: 2)
                        .offset(x: blueball ? -8 : -150, y: blueball ? -10 : -280)
                        .animation(Animation.easeIn(duration: 1).delay(1).repeatCount(1), value: UUID())
                        .onAppear(){
                            self.blueball.toggle()
                        }
                    
                    
                    
                    Circle()
                        .frame(width: 300, height: 300, alignment: .center)
                        .foregroundColor(.white)
                        .blur(radius: 0.3)
                        .offset(x: whiteball ? -10 : 150, y: whiteball ? -5 : 100)
                        .animation(Animation.easeIn(duration: 1).delay(1).repeatCount(1), value: UUID())
                        .onAppear(){
                            self.whiteball.toggle()
                        }
                    
                    
                }
                
                ZStack{
                    
                    VStack{
                        Image("Logo")
                            .resizable()
                            .frame(width: 300, height: 200)
                        Text("Blue Ribbon")
                            .font(.custom( "Helvetica", size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(Color.accentColor)
                            .multilineTextAlignment(.center)
                        
                        
                        
                    }.scaleEffect(size)
                        .opacity(opacity)
                        .onAppear{
                            withAnimation(.easeIn(duration: 1.2)){
                                self.size = 0.9
                                self.opacity = 1.0
                            }
                        }
                    
                }
                
            }
        }
        
    }
}
