//
//  MusicKeysDatasource.swift
//  ASMusicKeyboard
//
//  Created by Miguel Santiago Rodríguez on 3/12/17.
//  Copyright © 2017 Miguel Santiago Rodríguez. All rights reserved.
//

import Foundation

struct MusicKeysDatasource {
    private let firstLine = ["C", "D", "E", "G", "A", "B"]
    private let secondLine = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    let lines: [[String]]
    
    init() {
        self.lines = [firstLine, secondLine]
    }
}

