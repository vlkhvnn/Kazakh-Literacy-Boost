//
//  CategoryView.swift
//  HackNU
//
//  Created by Alikhan Tangirbergen on 13.04.2024.
//

import UIKit

final class CategoryView: UIView {
    
    var category : Category? {
        didSet {
            titleLabel.text = category?.rawValue
            switch category {
            case .skazki:
                numberLabel.text = "97 сказок"
                charLabel.text = "С"
            case .knigi:
                numberLabel.text = "180 книг"
                charLabel.text = "К"
            case .komiksy:
                numberLabel.text = "122 комиксов"
                charLabel.text = "К"
            case nil:
                numberLabel.text = ""
            }
        }
    }
    
    private let circleView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let charLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let numberLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .light)
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
        self.backgroundColor = AppColor.categoryColor.uiColor
        [circleView, charLabel, titleLabel, numberLabel].forEach {
            self.addSubview($0)
        }
        self.layer.cornerRadius = 16
    }
    
    private func setupConstraints() {
        
        circleView.snp.makeConstraints {
            $0.top.left.equalToSuperview().inset(12)
            $0.size.equalTo(32)
        }
        
        charLabel.snp.makeConstraints {
            $0.edges.equalTo(circleView)
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
