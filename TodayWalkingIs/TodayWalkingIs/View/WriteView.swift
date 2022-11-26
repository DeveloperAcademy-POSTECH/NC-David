//
//  PlaceMemory.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/05/02.
//

import Foundation
import SwiftUI

struct WriteView: View {
    @Environment(\.presentationMode) var presentationMode
    //    @EnvironmentObject var locationData: LocationData
    
    var writeTime:String {
        let nowDate = Date() // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter.string(from: nowDate)
    }
    
    
    @State private var name:String = ""
    @State private var description:String = ""
    @State private var isPresented = false
    @State private var sourceType = UIImagePickerController.SourceType.photoLibrary
    @State private var image:UIImage?
    
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    ZStack {
                        if let image = self.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .edgesIgnoringSafeArea(.leading)
                                .edgesIgnoringSafeArea(.trailing)
                                .edgesIgnoringSafeArea(.bottom)
                        }
                        else {
                            Image(uiImage: UIImage())
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .edgesIgnoringSafeArea(.leading)
                                .edgesIgnoringSafeArea(.trailing)
                                .edgesIgnoringSafeArea(.bottom)
                            VStack {
                                Section {
                                    VStack {
                                        Image(systemName: "photo")
                                            Button {
                                                self.isPresented.toggle()
                                            } label: {
                                                Image(systemName: "plus")
                                            }.sheet(isPresented: $isPresented,onDismiss: {
                                                Text("Hello")
                                            },content: {
                                                ImagePicker(sourceType: self.sourceType, image: $image)
                                            })

                                        Text("사진을 추가해주세요")
                                    }
                                }
                            }
                        }
                    }
                }
                VStack {
                    HStack(spacing:10){
                        Text("제목")
                            .padding()
                        Spacer()
                        TextField(text: $name, prompt: Text("제목을 입력해주세요")){
                        }
                    }
                    Divider()
                ZStack(alignment: .leading) {
                    if description.isEmpty || description == "" {
                        Text("본문을 입력해주세요")
                    }
                    TextEditor(text: $description)
                }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement:.navigationBarLeading){
                    NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true)) {
                        Image(systemName: "list.bullet.clipboard")
                            .resizable()
                            .frame(width:36, height: 36)
                        Spacer()
                    }
                }
                ToolbarItemGroup(placement:.navigationBarTrailing){
                    NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true)) {
                        Image(systemName: "list.bullet.clipboard")
                            .resizable()
                            .frame(width:36, height: 36)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView()
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType = .photoLibrary

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
    
    // MARK: - Using Coordinator to Adopt the UIImagePickerControllerDelegate Protocol
    @Binding var image: UIImage?
    @Environment(\.presentationMode) private var presentationMode

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.image = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
