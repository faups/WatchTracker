//
//  AddWatch.swift
//  WatchTracker
//
//  Created by Luke Faupel on 6/29/19.
//  Copyright © 2019 Luke Faupel. All rights reserved.
//

import SwiftUI

struct AddWatch : View {
    @ObjectBinding var store = WatchStore()
    
    var body: some View {
            Form {
                Section {
                    Text("Name")
                    Text("Movement")
                    Text("Reference")
                }
                
                Section {
                    Button(action: addWatch) {
                        Text("Add Watch")
                    }
                }
            }
            .navigationBarTitle(Text("Add a Watch"), displayMode: .inline)
    }
    
    func addWatch() {
        store.watches.append(Watch(name: "Seiko SNK809", movement: "7S26", accuracy: 7))
    }
}

#if DEBUG
struct AddWatch_Previews : PreviewProvider {
    static var previews: some View {
        AddWatch()
    }
}
#endif
