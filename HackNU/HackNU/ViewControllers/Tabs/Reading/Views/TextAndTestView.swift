//
//  TextAndTestView.swift
//  HackNU
//
//  Created by Alikhan Tangirbergen on 14.04.2024.
//

import UIKit
import SnapKit

final class TextAndTestView: UIViewController, UITextViewDelegate {
    
    var book: Book? {
        didSet {
            titleLabel.text = book?.title
            descriptionTextView.text = book?.content
            imageName.image = UIImage(named: book?.imageName ?? "")
        }
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private let imageName: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15, weight: .medium)
        textView.textColor = .black
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.dataDetectorTypes = []
        textView.backgroundColor = .clear
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [titleLabel, imageName, descriptionTextView].forEach {
            contentView.addArrangedSubview($0)
        }
        descriptionTextView.delegate = self
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
        }
        
        imageName.snp.makeConstraints {
            $0.height.equalTo(180)
        }
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if let selectedRange = textView.selectedTextRange,
           let selectedText = textView.text(in: selectedRange),
           !selectedText.isEmpty {
            sendSelectedTextToBackend(text: selectedText)
        }
    }
    
    private func sendSelectedTextToBackend(text: String) {
        print("Selected Text: \(text)")
        DispatchQueue.main.async {
            APICaller.shared.sendTextToBackend(text: text) { result in
                switch result {
                case .success():
                    print("The text is successfully sent to the backend")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
    }
}

