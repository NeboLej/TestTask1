//
//  HomeView.swift
//  TestTask1
//
//  Created by Nebo on 30.03.2022.
//
import UIKit

class HomeView: UIView {
    
    
    init() {
        super.init(frame: .zero)
        setupView()
        addSubviews()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .blue
    }
    
    private func addSubviews() {
        
    }
    
    private func initConstraints() {
        
    }
}
