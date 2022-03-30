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
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.placeholder = "Coctail name"
        textField.textAlignment = .center
        textField.layer.shadowOpacity = 0.4
        textField.tintColor = .black
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        return textField
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
    
    private func setupView() {
        backgroundColor = .white
    }
    
    private func addSubviews() {
        addSubview(tagCloudCollectionView)
        addSubview(textField)
    }
    
    private func initConstraints() {        
        tagCloudCollectionView.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(100)
            make.height.equalTo(300)
        }
        
        textField.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().inset(200)
            make.height.equalTo(30)
        }
    }
}
