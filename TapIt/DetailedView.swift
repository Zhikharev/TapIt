//
//  DetailedView.swift
//  TapIt
//
//  Created by Grigory Zhikharev on 04/07/2021.
//

import SwiftUI

// 1
//struct DetailedView: View {
//
//    let item: TapModel
//
//    let dataService = DataService.shared
//
//
//    var body: some View {
//        VStack {
//            HStack {
//                Text(item.name)
//                Text("Count=\(item.value)")
//            }
//            Button(action: {
//                let new = TapModel(id: item.id, name: item.name, value: item.value + 1)
//                dataService.update(item: new)
//            }, label: {
//                Text("TAP")
//            })
//        }
//    }
//}

//struct DetailedView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailedView(item: TapModel(name: "PREVIEW", value: 0))
//    }
//}

// 2
struct DetailedView: View {

    //@ObservedObject var item: TapViewModel
    @Binding var item: TapViewModel
    
    let dataService = DataService.shared

    init(item: Binding<TapViewModel>) {
        self._item = item
        print("init with \(item.wrappedValue.item.name)")
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(item.item.name)
                Text("Count=\(item.item.value)")
            }
            Button(action: {
                //let new = TapModel(id: item.id, name: item.name, value: item.value + 1)
                //dataService.update(item: new)
                self.item.tap()
            }, label: {
                Text("TAP")
            })
        }
    }
}
