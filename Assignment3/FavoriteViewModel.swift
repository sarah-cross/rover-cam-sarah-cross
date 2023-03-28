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
        //var ref: DocumentReference? = nil
        db.collection("favorites").document(favorite.id!).setData([
            "img_src": favorite.img_src
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func removeData(favorite: FavoriteModel) {
        db.collection("favorites").document(favorite.id!).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
        }
        
        
    }
    
}

class FavoriteSettings: ObservableObject {
    @Published var isFavorited = false
}
