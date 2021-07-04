//
//  TapListViewModel.swift
//  TapIt
//
//  Created by Grigory Zhikharev on 04/07/2021.
//

import Foundation
import Combine

class TapListViewModel: ObservableObject {
    
    @Published var items: [TapModel] = []
   
    private var dataService = DataService.shared
    private var cancellabels = Set<AnyCancellable>()
    
    init() {
        dataService.observe()
            .sink { [weak self] items in
                self?.items = items
                print("observed items:\n\(items)")
            }
            .store(in: &cancellabels)
    }
 
    func addNew() {
        let new = TapModel(name: "TapNew", value: 0)
        dataService.update(item: new)
    }
    
}
