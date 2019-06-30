//
//  WatchDetail.swift
//  WatchTracker
//
//  Created by Luke Faupel on 6/28/19.
//  Copyright © 2019 Luke Faupel. All rights reserved.
//

import SwiftUI

struct WatchDetail : View {
    let watch: Watch
    @State private var zoomed = false
    
    var body: some View {
        VStack {
            Text("Movement: \(watch.movement)")
                .font(.title)
                .padding(.top)
            Text("Accuracy: \(watch.accuracy)")
                .font(.title)
            Image(watch.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(Text(watch.name), displayMode: .inline)
                .tapAction {
                    withAnimation { self.zoomed.toggle() }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
}

#if DEBUG
struct WatchDetail_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView { WatchDetail(watch: testData[0]) }
    }
}
#endif
