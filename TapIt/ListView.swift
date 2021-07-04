//
//  ListView.swift
//  TapIt
//
//  Created by Grigory Zhikharev on 04/07/2021.
//

import SwiftUI

struct ListView: View {
    
    @StateObject private var viewModel = TapListViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(viewModel.items) { item in
                NavigationLink(
                    destination: DetailedView(item: item),
                    label: {
                        Text(item.name)
                            .padding()
                            .background (
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.gray.opacity(0.4))
                            )
                    })
            }
        }
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
