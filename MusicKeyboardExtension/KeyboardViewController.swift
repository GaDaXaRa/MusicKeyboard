//
//  KeyboardViewController.swift
//  MusicKeyboardExtension
//
//  Created by Miguel Santiago Rodríguez on 3/12/17.
//  Copyright © 2017 Miguel Santiago Rodríguez. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet weak var keyboardCollection: UICollectionView!
    
    let keyboardDatasource = MusicKeysDatasource()
    
    var keyboardView: UIView!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
//        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}

extension KeyboardViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return keyboardDatasource.lines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keyboardDatasource.lines[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicKeyCollectionViewCell", for: indexPath) as! MusicKeyCollectionViewCell
        cell.configure(with: keyboardDatasource.lines[indexPath.section][indexPath.row])
        return cell
    }
}

extension KeyboardViewController: UICollectionViewDelegate {
    
}

extension KeyboardViewController {
    fileprivate func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        setUp()
    }
    
    fileprivate func setUp() {
        keyboardCollection.register(UINib.init(nibName: "MusicKeyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MusicKeyCollectionViewCell")
        keyboardCollection.dataSource = self
        keyboardCollection.delegate = self
        keyboardCollection.reloadData()
    }
}
