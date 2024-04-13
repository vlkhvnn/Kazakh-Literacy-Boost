//
//  StatsTypeView.swift
//  HackNU
//
//  Created by Alikhan Tangirbergen on 13.04.2024.
//

import UIKit
import SnapKit

final class StatsTypeView: UIView {
    
    private let imageView : UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleToFill
        return imageview
    }()
    
    private let numberLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = AppColor.darktext.uiColor
        return label
    }()
    
    private let typeLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = AppColor.graytext.uiColor
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let horizontalStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        return stack
    }()
    
    private let verticalStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.alignment = .center
        return stack
    }()
    
    private let imageBackground : UIView = {
       let view = UIView()
        view.backgroundColor = AppColor.statBackground.uiColor
        view.layer.cornerRadius = 14
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 8
        self.layer.borderColor = AppColor.statsBorder.cgColor
        [imageBackground, imageView, horizontalStackView].forEach { self.addSubview($0) }
        verticalStackView.addArrangedSubview(typeLabel)
        verticalStackView.addArrangedSubview(numberLabel)
        horizontalStackView.addArrangedSubview(verticalStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(image: UIImage, number: String, type: String) {
        imageView.image = image
        numberLabel.text = number
        typeLabel.text = type
    }
    
    public func updateStats(stat: String) {
        numberLabel.text = stat
    }
    
    private func setupConstraints() {
        
        imageBackground.snp.makeConstraints {
            $0.top.left.equalToSuperview().inset(8)
            $0.size.equalTo(40)
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalTo(imageBackground).inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        }
        
        horizontalStackView.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-16)
            $0.bottom.top.equalToSuperview()
            $0.left.equalTo(imageBackground.snp.right).offset(8)
        }
        
        verticalStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
        
        typeLabel.snp.makeConstraints {
            $0.centerX.equalTo(verticalStackView)
        }
        
        numberLabel.snp.makeConstraints {
            $0.centerX.equalTo(verticalStackView)
        }
    }
}

