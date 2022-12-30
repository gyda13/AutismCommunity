//
//  SetPost.swift
//  autismCommunity
//
//  Created by gyda almohaimeed on 22/05/1444 AH.
//

import SwiftUI
import PhotosUI
import CloudKit

struct SetPost: View {
    
   
    
    @StateObject private var vm: ListView
    @State private var title: String = ""
    @State private var content: String = ""
    
    
    @State private var photosPickerPresented = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
  
    @State var selection: String = "Individual"
    
    init(vm: ListView){
        _vm = StateObject(wrappedValue: vm)
    }
    
    private enum Field: Int, CaseIterable {
           case title, content
       }
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        NavigationView {
            VStack {
                    Spacer()
                    VStack {
                        TextField("Write your title", text: $title, axis: .vertical )
                            .lineLimit(2, reservesSpace: true)
                        
                    }
                    .padding()
                    .frame(width: 320 ,height:73)
                    .background(.clear)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, lineWidth: 1)
                            .frame(width: 320 ,height:73)
                            
                    )
                 
                    
                    VStack {
                        TextField("Add your comment", text: $content, axis: .vertical)
                            .lineLimit(6, reservesSpace: true)
                            .padding(.bottom, 100)
                        
                    }
                    .padding()
                    .frame(width: 320 ,height:265)
                    .background(.clear)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, lineWidth: 1)
                            .frame(width: 320 ,height:265)
                          
                    )
                
             
                VStack {
                   
                    Button {
                               // Present photo Picker
                               photosPickerPresented.toggle()
                           } label: {
                               VStack{
                                   Image(systemName: "square.and.arrow.up.on.square").font(.system(size:25, weight: .bold)).foregroundColor(.black).padding()
                                   Text("Select Image").padding(-10)
                               }
                               
                           }
                           .photosPicker(isPresented: $photosPickerPresented, selection: $selectedItem)// changed
                    
                           .onChange(of: selectedItem) { newItem in
                               Task {
                                   if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                       selectedImageData = data
                                   }
                               }
                           }
                    if let selectedImageData,
                       let uiImage = UIImage(data: selectedImageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                          .frame(width: 200, height: 100)
                        
                        
                    }
                    
                  
                }
                .frame(width: 320 ,height:117,alignment: .top)
                .background(.clear)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.gray, lineWidth: 1)
                        .frame(width: 320 ,height:117))
             
            
                HStack{
                    Picker("" , selection: $selection){
                        Text("Individual").tag("Individual")
                        Text("Specialist").tag("Specialist")
                    }.pickerStyle(.segmented).frame(width: 320, height: 50)
                }
                
                Button("Submit"){
                    
                    if selection == "Individual" {
                        
                        vm.savePost(title: title, writer: chooseRandomName(), describtion: content, content: content, num_of_comments: 0)

                        self.title = ""
                        self.content = ""
                        self.selectedItem = nil
                        self.selectedImageData = nil
                    }
                    
                    if selection == "Specialisit" {
                        
                        vm.saveSpecialistPost(title: title, writer: chooseRandomName2(), describtion: content, content: content, num_of_comments: 0)

                        self.title = ""
                        self.content = ""
                        self.selectedItem = nil
                        self.selectedImageData = nil
                        
                    }
                    
                    
                    }
                .frame(width: 320, height: 50)
                .background(
                RoundedRectangle(cornerRadius: 15,style: .continuous)
                 .foregroundColor(Color.accentColor))
                .foregroundColor(.white)
             
                
                Spacer()
               
                
            
            }.navigationBarTitle("Post", displayMode: .large)
               
        }
    }
   
}



var names = ["Ahmed", "Sara Ali", "Mona", "Aziz", "Osama"]

func chooseRandomName() -> String {
    let array = names

    let result = array.randomElement()!

    return result
}

var names2 = ["Dr. Lida Rees", "Dr. Richard Cohen", "Dr. Nora Sacks", "Dr. Ahmed"]

func chooseRandomName2() -> String {
    let array = names2

    let result = array.randomElement()!

    return result
}

struct SetPost_Previews: PreviewProvider {
    static var previews: some View {
        SetPost(vm: ListView(container: CKContainer.default()))
    }
}
