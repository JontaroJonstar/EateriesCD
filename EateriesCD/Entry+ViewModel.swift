//
//  Entry+ViewModel.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 14/5/21.
//

import Foundation

extension Entry {
    var reviewArray: [Review] {
        get { reviews?.array as? [Review] ?? [] }
        set { reviews = NSOrderedSet(array: newValue)}
    }
}

