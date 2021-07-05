//
//  ListView.swift
//  TapIt
//
//  Created by Grigory Zhikharev on 04/07/2021.
//

import SwiftUI

// 1
//struct ListView: View {
//
//    @StateObject private var viewModel = TapListViewModel()
//
//    var body: some View {
//        VStack(spacing: 20) {
//            ForEach(viewModel.items) { item in
//                NavigationLink(
//                    destination: DetailedView(item: item),
//                    label: {
//                        Text(item.name)
//                            .padding()
//                            .background (
//                                RoundedRectangle(cornerRadius: 20)
//                                    .fill(Color.gray.opacity(0.4))
//                            )
//                    })
//            }
//        }
//        .toolbar(content: {
//            Button(action: {
//                viewModel.addNew()
//            }, label: {
//                Image(systemName: "plus")
//            })
//        })
//    }
//
//}

// 2
struct ListView: View {

    @StateObject private var viewModel = TapListViewModel()

    @State private var idx = 0
    @State private var showDetail = false
    @State private var selectedTap: TapModel? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            //ForEach(viewModel.items.indices, id: \.self) { idx in
            //ForEach(viewModel.items, id: \.self.id) { item in
            ForEach(Array(viewModel.items.enumerated()), id: \.self.offset) { (idx, item) in
                HStack {
                    Text(item.name)
                    Button(action: {
                        let old = item
                        let new = TapModel(id: old.id, name: old.name, value: old.value + 1)
                        viewModel.tap(new: new)
                    }, label: {
                        Text("+1")
                    })
                }
                .padding()
                .background (
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.4))
                )
                .onTapGesture {
                    self.selectedTap = item
                    self.idx = idx
                    self.showDetail.toggle()
                }

                
            }
        }
        .background(
            NavigationLink(
                destination: DetailedView(item: viewModel.items[idx]),
                isActive: $showDetail,
                label: { EmptyView()})
        )
        .toolbar(content: {
            Button(action: {
                viewModel.addNew()
            }, label: {
                Image(systemName: "plus")
            })
        })
    }

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
