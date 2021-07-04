//
//  DataService.swift
//  TapIt
//
//  Created by Grigory Zhikharev on 04/07/2021.
//

import Foundation
import Combine

class DataService {
    
    static let shared = DataService()
    
    @Published var items: [TapModel] = []
    
    func observe() -> AnyPublisher<[TapModel], Never> {
        return $items.eraseToAnyPublisher()
    }
    
    func update(item: TapModel) {
        if let idx = items.firstIndex(where: {$0.id == item.id}) {
            self.items[idx] = item
        } else {
            items.append(item)
        }
    }
    
    private init() {
        self.items = [
            TapModel(name: "TapA", value: 0),
            TapModel(name: "TapB", value: 1)
        ]
    }
    
}
