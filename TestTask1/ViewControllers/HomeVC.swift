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
    private(set) var arrayAlcohols: [AlcoholModel] = [] {
        didSet {
//            print(arrayAlcohols.count)
            homeView.tagCloudCollectionView.reloadData()
        }
    }
 
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDelegate()
        loadData()
    }

    init(viewModel: HomeVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadData() {
        viewModel.getAlcohol { alcohols in
            self.arrayAlcohols = alcohols
        }
    }
    
    private func addDelegate() {
        
        homeView.tagCloudCollectionView.dataSource = self
        homeView.tagCloudCollectionView.delegate = self
    }   
}
