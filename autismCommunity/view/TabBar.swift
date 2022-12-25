//
//  TabBar.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 22/05/1444 AH.
//

import SwiftUI
import CloudKit

struct TabBar: View {
    
    let container = CKContainer(identifier: "iCloud.demo.autismCommunity.community")
    
    var body: some View {
        TabView {
            Community()
                .tabItem {
                    Label("Community", image: "IconLogo")
                }
            
            SetPost(vm: ListView(container: container)) .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
                .tabItem {
                    Label("Post", systemImage: "plus.app")
                    
                }
            
            SignUp()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }
            
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
        return true // set to `false` if you don't want to detect tap during other gestures
    }
}

struct TapBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
       
    }
}
