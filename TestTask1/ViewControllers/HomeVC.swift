//
//  HomeVC.swift
//  TestTask1
//
//  Created by Nebo on 30.03.2022.
//
import UIKit

class HomeVC: UIViewController {
    private let homeView = HomeView()
    
    init() {
        super.init(nibName: nil, bundle: nil)  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
