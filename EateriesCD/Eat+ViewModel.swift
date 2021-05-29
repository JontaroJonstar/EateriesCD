//
//  Eat+ViewModel.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 13/5/21.
//

import Foundation


extension Eat {
    var entryArray: [Entry] {
        get { entries?.array as? [Entry] ?? [] }
        set { entries = NSOrderedSet(array: newValue)}
    }
}
