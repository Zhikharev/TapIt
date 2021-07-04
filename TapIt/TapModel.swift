//
//  TapModel.swift
//  TapIt
//
//  Created by Grigory Zhikharev on 04/07/2021.
//

import Foundation

struct TapModel: Identifiable, Codable {
    let id: String
    let name: String
    let value: Int
    
    init(id: String = UUID().uuidString, name: String, value: Int) {
        self.id = id
        self.name = name
        self.value = value
    }
    
}
