//
//  Watch.swift
//  WatchTracker
//
//  Created by Luke Faupel on 6/28/19.
//  Copyright © 2019 Luke Faupel. All rights reserved.
//

import SwiftUI

struct Watch : Identifiable {
    var id = UUID()
    var name: String
    var movement: String
    // var reference: String
    // var dataPoints: [Int]
    var accuracy: Int
    
    var imageName: String { return name }
    var thumbnailName: String { return name + "Thumb" }
}

#if DEBUG
let testData = [
    Watch(name: "Seiko SKX009", movement: "7S26", accuracy: -15),
    Watch(name: "Seiko SRPB41", movement: "4R35", accuracy: 10),
    Watch(name: "Casio G-Shock DW5600", movement: "Quartz", accuracy: 0),
    Watch(name: "Tissot PRC200", movement: "ETA 2136", accuracy: 20)
]
#endif
