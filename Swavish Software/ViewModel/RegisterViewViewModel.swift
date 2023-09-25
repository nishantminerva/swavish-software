//
//  RegisterViewViewModel.swift
//  Swavish Software
//
//  Created by Nishant Minerva on 24/09/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
//    let storage = Storage.storage()

    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
//        creating the user
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
//        Inserting to database
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all field"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
    
//    func upload(image: UIImage) {
//        // Create a storage reference
//        let storageRef = storage.reference().child("images/image.jpg")
//
//        // Resize the image to 200px with a custom extension
//        let resizedImage = image
//
//        // Convert the image into JPEG and compress the quality to reduce its size
//        let data = resizedImage.jpegData(compressionQuality: 0.2)
//
//        // Change the content type to jpg. If you don't, it'll be saved as application/octet-stream type
//        let metadata = StorageMetadata()
//        metadata.contentType = "image/jpg"
//
//        // Upload the image
//        if let data = data {
//            storageRef.putData(data, metadata: metadata) { (metadata, error) in
//                if let error = error {
//                    print("Error while uploading file: ", error)
//                }
//
//                if let metadata = metadata {
//                    print("Metadata: ", metadata)
//                }
//            }
//        }
//    }
//
//    func deleteItem(item: StorageReference) {
//        item.delete { error in
//            if let error = error {
//                print("Error deleting item", error)
//            }
//        }
//    }
    
    
}
