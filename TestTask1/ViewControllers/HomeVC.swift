//
//  HomeVC.swift
//  TestTask1
//
//  Created by Nebo on 30.03.2022.
//
import UIKit

class HomeVC: UIViewController {
    private let homeView = HomeView()
    private let viewModel: HomeVM
    
    init(viewModel: HomeVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        viewModel.getAlcohol { str in
//            print(str)
        }
    }
    
    
    
    override func loadView() {
        self.view = homeView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
