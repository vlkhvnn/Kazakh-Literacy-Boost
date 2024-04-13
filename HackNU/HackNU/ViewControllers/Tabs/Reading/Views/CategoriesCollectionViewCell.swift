//
//  CategoriesCollectionViewCell.swift
//  HackNU
//
//  Created by Alikhan Tangirbergen on 13.04.2024.
//

import UIKit

final class CategoriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoriesCollectionViewCell"
    
    var category : Category? {
        didSet {
            titleLabel.text = category?.rawValue
            switch category {
            case .skazki:
                numberLabel.text = "97 сказок"
            case .knigi:
                numberLabel.text = "180 книг"
            case .komiksy:
                numberLabel.text = "122 комиксов"
            case nil:
                numberLabel.text = ""
            }
        }
    }
    
    private let circleView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let charLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let numberLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.backgroundColor = .gray
        [circleView, charLabel, titleLabel, numberLabel].forEach {
            self.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        
        circleView.snp.makeConstraints {
            $0.top.left.equalToSuperview().inset(8)
            $0.size.equalTo(12)
        }
        
        charLabel.snp.makeConstraints {
            $0.center.equalTo(circleView)
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-24)
        }
        
        numberLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
