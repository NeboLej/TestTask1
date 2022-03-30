//
//  TagCloudCell.swift
//  TestTask1
//
//  Created by Nebo on 30.03.2022.
//

import UIKit
class TagCloudCell: UICollectionViewCell {
    static let cellId = "TagCloudCellId"
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addSubview(label)
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .lightGray    
        layer.cornerRadius = 10
    }
    
    private func initConstraints() {
        label.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.top.bottom.equalToSuperview().inset(2)
        }
    }
}
