//
//  PopularBooksCollectionViewCell.swift
//  HackNU
//
//  Created by Alikhan Tangirbergen on 13.04.2024.
//

import UIKit

final class PopularBooksCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PopularBooksCollectionViewCell"
    
    var book : Book? {
        didSet {
            imageView.image = UIImage(named: book!.imageName)
            titleLabel.text = book?.title
        }
    }
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .semibold)
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
        self.backgroundColor = .white
        [imageView, titleLabel].forEach {
            self.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(4)
            $0.bottom.equalToSuperview().offset(-16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
