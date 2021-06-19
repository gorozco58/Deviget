//
//  Extensions.swift
//  Deviget
//
//  Created by Giovanny Orozco Loaiza on 19/06/21.
//  Copyright © 2021 Giovanny Orozco Loaiza. All rights reserved.
//

import Foundation

public extension URL {
    
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
