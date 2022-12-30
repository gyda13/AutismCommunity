//
//  TabBar.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 22/05/1444 AH.
//

import SwiftUI
import CloudKit
import Combine

struct TabBar: View {
    
    let container = CKContainer(identifier: "iCloud.demo.autismCommunity.community")
    

    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
          
            Community(vm: ListView(container: container))
                .tabItem {
                                if selection == 0 {
                                    Image("IconLogo")
                                } else {
                                    Image("NonActiveLogo")
                                }
                                Text("Community")
                            }.tag(0)
                
//                .tabItem {
//                 Label("Community", image:"IconLogo")
//
//                }
                
            SetPost(vm: ListView(container: container)) .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
                .tabItem {
                    Label("Post", systemImage: "plus.app")
                      
                }.tag(1)
            
            SignUp()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }.tag(2)
            
        }
       .onAppear() {
            UITabBar.appearance().backgroundColor = .white
          
        }
    }
}

extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

struct TapBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
       
    }
}
