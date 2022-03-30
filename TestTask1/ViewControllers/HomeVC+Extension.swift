//
//  HomeVC+Extension.swift
//  TestTask1
//
//  Created by Nebo on 30.03.2022.
//

import Foundation
import UIKit

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayAlcohols.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCloudCell.cellId, for: indexPath) as! TagCloudCell
        cell.label.text = arrayAlcohols[indexPath.item].strDrink
        if activeIndex.contains(indexPath.item) {
            cell.isActive = true
        } else {
            cell.isActive = false
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TagCloudCell
        cell.isActive.toggle()
    }
    
}

extension HomeVC: UITextFieldDelegate {

    func textFieldDidChangeSelection(_ textField: UITextField) {
        serchTags(sting: textField.text ?? "")
    }
}
