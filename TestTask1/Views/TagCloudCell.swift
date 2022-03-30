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
    
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.frame = self.bounds
        layer.cornerRadius = self.layer.cornerRadius
        
        layer.colors = [UIColor(displayP3Red: 254/255, green: 83/255, blue: 99/255, alpha: 1).cgColor,
                        UIColor(displayP3Red: 251/255, green: 86/255, blue: 255/255, alpha: 1).cgColor]
        return layer
    }()
    
    var isActive = false {
        willSet {
            if newValue {
                layer.addSublayer(gradientLayer)
            } else {
                gradientLayer.removeFromSuperlayer()
            }
            addSubview(label)
        }
    }
    
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
