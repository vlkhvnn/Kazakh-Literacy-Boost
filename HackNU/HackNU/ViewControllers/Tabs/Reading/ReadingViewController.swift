//
//  ReadingViewController.swift
//  HackNU
//
//  Created by Alikhan Tangirbergen on 13.04.2024.
//

import UIKit
import SnapKit


final class ReadingViewController: UIViewController {
    
    private let popularBooks : [Book] = [
        Book(title: "Қотыр торғай", content: "", imageName: "book1"),
        Book(title: "Түлкі мен жолбарыс", content: "", imageName: "book2"),
    ]
    
    private let popularBooksCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let newCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return newCollectionView
    }()
    
    private let categoriesCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let newCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return newCollectionView
    }()
    
    let sectionInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    
    private let categoriesLabel : UILabel = {
        let label = UILabel()
        label.text = "Категории"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let popularBooksLabel : UILabel = {
        let label = UILabel()
        label.text = "Популярные книги"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}

extension ReadingViewController {
    
    private func setupView() {
        view.backgroundColor = .white
        [categoriesLabel, popularBooksCollectionView].forEach {
            view.addSubview($0)
        }
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        popularBooksCollectionView.delegate = self
        popularBooksCollectionView.dataSource = self
        popularBooksCollectionView.register(PopularBooksCollectionViewCell.self, forCellWithReuseIdentifier: PopularBooksCollectionViewCell.identifier)
        
        
    }
    
    private func setupConstraints() {
        
        categoriesLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        popularBooksCollectionView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(categoriesLabel.snp.bottom).offset(16)
        }
    }
}

extension ReadingViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularBooksCollectionViewCell.identifier, for: indexPath) as? PopularBooksCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.book = popularBooks[indexPath.row]
        return cell
    }
}

extension ReadingViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left + sectionInsets.right + 12
        let availableWidth = collectionView.bounds.width - paddingSpace
        let widthPerItem = availableWidth / 2
        return CGSize(width: widthPerItem, height: widthPerItem + 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}
