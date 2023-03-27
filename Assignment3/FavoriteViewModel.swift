//
//  FavoriteViewModel.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/27/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore


class FavoriteViewModel : ObservableObject {
    
    @Published private(set) var favoriteData = [FavoriteModel]()
    let db = Firestore.firestore()
    
    func fetchData() {
        self.favoriteData.removeAll()
        db.collection("favorites")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.favoriteData.append(try document.data(as: FavoriteModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }
        }
        
    }
    
    func saveData(favorite: FavoriteModel) {
        var ref: DocumentReference? = nil
        ref = db.collection("favorites").addDocument(data: [
            "url": favorite.url
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func removeData(favorite: FavoriteModel) {
        if let id = favorite.id {
           let docRef = db.collection("favorites").document(id)
            docRef.delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
            }
        }
        
    }
    
}
