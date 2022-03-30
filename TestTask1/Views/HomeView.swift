//
//  HomeView.swift
//  TestTask1
//
//  Created by Nebo on 30.03.2022.
//
import UIKit
import SnapKit

class HomeView: UIView {
    
    lazy var tagCloudCollectionView: UICollectionView = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(TagCloudCell.self, forCellWithReuseIdentifier: TagCloudCell.cellId)
        cv.backgroundColor = .clear
        return cv
    }()
    
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
        backgroundColor = .white
    }
    
    private func addSubviews() {
        addSubview(tagCloudCollectionView)
    }
    
    private func initConstraints() {        
        tagCloudCollectionView.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(100)
            make.height.equalTo(300)
        }
        
    }
}
