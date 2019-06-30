//
//  ContentView.swift
//  WatchTracker
//
//  Created by Luke Faupel on 6/28/19.
//  Copyright © 2019 Luke Faupel. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @ObjectBinding var store = WatchStore()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationButton(destination: AddWatch(store: store)) {
                        Text("Add a Watch")
                        .foregroundColor(.blue)
                    }
                    
                }
                Section {
                    ForEach(store.watches) { watch in
                        WatchCell(watch: watch)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .navigationBarTitle(Text("Watches"))
            .navigationBarItems(trailing: EditButton())
            .listStyle(.grouped)
        }
    }
    
    func delete(at offsets: IndexSet) {
        guard let index = Array(offsets).first else { return }
        store.watches.remove(at: index)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        guard let sourceIndex = Array(source).first else { return }
        store.watches.insert(store.watches.remove(at: sourceIndex), at: destination)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(store: WatchStore(watches: testData))
            .environment(\.colorScheme, .light)
    }
}
#endif

struct WatchCell : View {
    let watch: Watch
    
    var body: some View {
        return NavigationButton(destination: WatchDetail(watch: watch)) {
            Image(watch.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(watch.name)
                Text("Average \((watch.accuracy >= 0 ? "+" + String(watch.accuracy) : String(watch.accuracy))) sec/day")
                    .font(.subheadline)
                    .color(.gray)
            }
        }
    }
}
