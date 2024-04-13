//
//  ReadingViewController.swift
//  HackNU
//
//  Created by Alikhan Tangirbergen on 13.04.2024.
//

import UIKit
import SnapKit

final class ReadingViewController: UIViewController {
    
    private var popularBooks : [Book] = [
        Book(title: "Қотыр торғай", content: "", imageName: "book1"),
        Book(title: "Түлкі мен жолбарыс", content: "", imageName: "book2"),
        Book(title: "Кім күшті?", content: "", imageName: "book3"),
        Book(title: "Арыстан мен түлкі", content: "", imageName: "book4"),
        Book(title: "Жыл басына таласқан хайуандар", content: "", imageName: "book5"),
        Book(title: "Түлкі мен қырғауыл", content: "", imageName: "book6"),
        Book(title: "Қасқыр мен қозы", content: "", imageName: "book7"),
        Book(title: "Түлкі мен тырна", content: "", imageName: "book8"),
        Book(title: "Қоянның зары", content: "", imageName: "book9"),
        Book(title: "Қасқыр мен кісі", content: "", imageName: "book10"),
    ]
    
    private let categories : [Category] = [.knigi, .skazki, .komiksy]
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let popularBooksCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let newCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return newCollectionView
    }()
    
    private let skazkiView = CategoryView()
    private let knigiView = CategoryView()
    private let komiksyView = CategoryView()
    
    let sectionInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    
    private let categoriesLabel : UILabel = {
        let label = UILabel()
        label.text = "Категории"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let popularBooksLabel : UILabel = {
        let label = UILabel()
        label.text = "Популярные книги"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
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
        view.addSubview(scrollView)
        [categoriesLabel,skazkiView, knigiView, komiksyView, popularBooksLabel, popularBooksCollectionView].forEach {
            contentView.addSubview($0)
        }
        scrollView.addSubview(contentView)
        configureCollectionView()
        setupCategories()
        setDescriptions()
        navigationItem.backButtonTitle = ""
    }
    
    private func configureCollectionView() {
        popularBooksCollectionView.delegate = self
        popularBooksCollectionView.dataSource = self
        popularBooksCollectionView.register(PopularBooksCollectionViewCell.self, forCellWithReuseIdentifier: PopularBooksCollectionViewCell.identifier)
        popularBooksCollectionView.isScrollEnabled = false
    }
    
    private func setDescriptions() {
        for i in 0..<popularBooks.count {
            popularBooks[i].content = booksDescription[i]
        }
    }
    
    private func setupCategories() {
        skazkiView.category = .skazki
        knigiView.category = .knigi
        komiksyView.category = .komiksy
    }
    
    private func setupConstraints() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
            $0.height.equalTo(1450)
        }
        
        categoriesLabel.snp.makeConstraints {
            $0.left.equalTo(view).offset(16)
            $0.top.equalTo(contentView.safeAreaLayoutGuide.snp.top)
        }
        
        knigiView.snp.makeConstraints {
            $0.left.equalTo(view).offset(16)
            $0.top.equalTo(categoriesLabel.snp.bottom).offset(16)
            $0.height.equalTo(140)
            $0.width.equalTo(108.5)
        }
        
        skazkiView.snp.makeConstraints {
            $0.left.equalTo(knigiView.snp.right).offset(16)
            $0.top.equalTo(categoriesLabel.snp.bottom).offset(16)
            $0.height.equalTo(140)
            $0.width.equalTo(108.5)
        }
        
        komiksyView.snp.makeConstraints {
            $0.left.equalTo(skazkiView.snp.right).offset(16)
            $0.top.equalTo(categoriesLabel.snp.bottom).offset(16)
            $0.height.equalTo(140)
            $0.width.equalTo(108.5)
        }
        
        popularBooksLabel.snp.makeConstraints {
            $0.left.equalTo(view).offset(16)
            $0.top.equalTo(komiksyView.snp.bottom).offset(32)
        }
        
        popularBooksCollectionView.snp.makeConstraints {
            $0.left.right.bottom.equalTo(view)
            $0.top.equalTo(popularBooksLabel.snp.bottom).offset(16)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let book = popularBooks[indexPath.row]
        let detailVC = TextAndTestView()
        detailVC.book = book
        navigationController?.pushViewController(detailVC, animated: true)
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

