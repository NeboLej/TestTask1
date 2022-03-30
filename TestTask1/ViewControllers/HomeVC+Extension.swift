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
        print(arrayAlcohols.count)
        return arrayAlcohols.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCloudCell.cellId, for: indexPath) as! TagCloudCell
        cell.label.text = arrayAlcohols[indexPath.item].strDrink
        return cell
    }
    
}

extension HomeVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        animateTextField()
    }
}
