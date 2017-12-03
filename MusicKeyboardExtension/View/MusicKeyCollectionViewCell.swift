//
//  MusicKeyCollectionViewCell.swift
//  ASMusicKeyboard
//
//  Created by Miguel Santiago Rodríguez on 3/12/17.
//  Copyright © 2017 Miguel Santiago Rodríguez. All rights reserved.
//

import UIKit

class MusicKeyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var keyLabel: UILabel!
    
    
    func configure(with key: String) {
        keyLabel.text = key
    }
    
}

