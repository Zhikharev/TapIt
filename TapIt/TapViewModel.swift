//
//  TapViewModel.swift
//  TapIt
//
//  Created by Grigory Zhikharev on 04/07/2021.
//

import Foundation

class TapViewModel: Identifiable, ObservableObject {
    
    let id: String
    
    @Published var item: TapModel
    
    init(item: TapModel) {
        self.id = item.id
        self.item = item
    }
 
    func tap() {
        let new = TapModel(id: item.id, name: item.name, value: item.value + 1)
        //self.item = new
        print("set new value old=\(self.item.value)")
        DataService.shared.update(item: new)
    }
    
}
