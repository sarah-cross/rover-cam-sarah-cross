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
        db.collection("favorites").document(favorite.id!).setData([
            "img_src": favorite.img_src,
            "isFavorited": true
            
        ]){ err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func contains(favorite: FavoriteModel) -> Bool {
        var result = false
        let docRef = db.collection("favorites").document(favorite.id!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                result = true
            } else {
                print("Document does not exist")
                result = false
            }
        }
        return result
        
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


