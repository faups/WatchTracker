//
//  WatchStore.swift
//  WatchTracker
//
//  Created by Luke Faupel on 6/28/19.
//  Copyright © 2019 Luke Faupel. All rights reserved.
//

import SwiftUI
import Combine

class WatchStore : BindableObject {
    var watches: [Watch] {
        didSet { didChange.send() }
    }
    
    init(watches: [Watch] = []) {
        self.watches = watches
    }
    
    var didChange = PassthroughSubject<Void, Never>()
}
