//
//  TapListViewModel.swift
//  TapIt
//
//  Created by Grigory Zhikharev on 04/07/2021.
//

import Foundation
import Combine

class TapListViewModel: ObservableObject {
    
    // 1
    //@Published var items: [TapModel] = []
    
    // 2
    @Published var items: [TapViewModel] = []
   
    private var dataService = DataService.shared
    private var cancellabels = Set<AnyCancellable>()
    
    init() {
        
        // 1
        //dataService.observe()
        //    .sink { [weak self] items in
        //        self?.items = items
        //        print("observed items:\n\(items)")
        //    }
        //    .store(in: &cancellabels)
        
        // 2
        dataService.observe()
            .sink { [weak self] items in
                self?.items = items.map({ item in
                    TapViewModel(item: item)
                })
                print("observed items:\n\(items)")
            }
            .store(in: &cancellabels)
    }
 
    func addNew() {
        let new = TapModel(name: "TapNew", value: 0)
        dataService.update(item: new)
    }
    
    func tap(new: TapModel) {
        DataService.shared.update(item: new)
    }
    
}
