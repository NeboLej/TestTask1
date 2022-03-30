//
//  HomeVC.swift
//  TestTask1
//
//  Created by Nebo on 30.03.2022.
//
import UIKit

enum KeyboardState {
    case show
    case hide
}

class HomeVC: UIViewController {
    private let homeView = HomeView()
    private let viewModel: HomeVM
    private(set) var arrayAlcohols: [AlcoholModel] = [] {
        didSet {
            //            print(arrayAlcohols.count)
            homeView.tagCloudCollectionView.reloadData()
        }
    }
    private var keyboardHeight: Int  = 0 {
        didSet {
            if oldValue > keyboardHeight {
                keyboardHeight = oldValue
            }
        }
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDelegate()
        loadData()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    init(viewModel: HomeVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dismissKeyboard() {
        homeView.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardHeight = Int(keyboardSize.height)
            animateTextField(state: .show)
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        animateTextField(state: .hide)
    }
    
    private func animateTextField(state: KeyboardState) {
        switch state {
        case .show:
            UIView.animate(withDuration: 0.1) {
                self.homeView.textField.layer.cornerRadius = 0
                self.homeView.textField.snp.remakeConstraints { make in
                    make.left.right.equalToSuperview().inset(0)
                    make.height.equalTo(30)
                    make.bottom.equalToSuperview().inset(self.keyboardHeight)
                }
            }
        case .hide:
            UIView.animate(withDuration: 0.1) {
                self.homeView.textField.layer.cornerRadius = 10
                self.homeView.textField.snp.remakeConstraints { make in
                    make.left.right.equalToSuperview().inset(40)
                    make.height.equalTo(30)
                    make.bottom.equalToSuperview().inset(200)
                }
            }
        }
        self.view.layoutIfNeeded()
    }
    
    private func loadData() {
        viewModel.getAlcohol { alcohols in
            self.arrayAlcohols = alcohols
        }
    }
    
    private func addDelegate() {
        homeView.tagCloudCollectionView.dataSource = self
        homeView.tagCloudCollectionView.delegate = self
        homeView.textField.delegate = self
    }
}
