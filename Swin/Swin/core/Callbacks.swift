//
//  Callbacks.swift
//  Swin
//
//  Created by Robert Ogiba on 23/01/2022.
//

import Foundation

typealias OnCloseCallback<T> = (T?) -> ()

struct Callbacks<T> {
    let onClose: OnCloseCallback<T>?
}
