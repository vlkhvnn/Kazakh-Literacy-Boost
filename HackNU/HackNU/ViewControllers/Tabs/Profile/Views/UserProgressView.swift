//
//  UserProgressView.swift
//  HackNU
//
//  Created by Alikhan Tangirbergen on 13.04.2024.
//

import UIKit

final class UserProgressView: UIView {
    
    private let levelRectangle : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = AppColor.level_rect.uiColor
        return view
    }()
    
    private let levelLabel : UILabel = {
       let label = UILabel()
        label.textColor = AppColor.levelColor.uiColor
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private let nextLevelLabel : UILabel = {
        let label = UILabel()
        label.textColor = AppColor.nextLevelColor.uiColor
        label.font = .systemFont(ofSize: 10, weight: .medium)
        return label
    }()
    
    private let progressView : UIProgressView = {
       let progress = UIProgressView()
        progress.setProgress(0.1, animated: true)
        progress.tintColor = AppColor.flowkitBlue.uiColor
        progress.trackTintColor = AppColor.progress_unfinished_color.uiColor
        return progress
    }()
    
    private let currentXPLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 11, weight: .medium)
        return label
    }()
    
    private let tillNextLevelLabel : UILabel = {
        let label = UILabel()
        label.text = "До следующего уровня"
        label.textColor = AppColor.nextLevelColor.uiColor
        label.font = .systemFont(ofSize: 11, weight: .medium)
        return label
    }()
    
    private let leftXP : UILabel = {
        let label = UILabel()
        label.textColor = AppColor.flowkitBlue.uiColor
        label.font = .systemFont(ofSize: 11, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

//MARK: Methods
extension UserProgressView {
    
    private func setupView() {
        [levelRectangle, levelLabel, progressView, nextLevelLabel, currentXPLabel, leftXP, tillNextLevelLabel].forEach { self.addSubview($0)
        }
        self.backgroundColor = .white
        setupProgressCorners()
    }
    
    private func setupProgressCorners() {
        for view: UIView in self.progressView.subviews {
            if view is UIImageView {
                view.clipsToBounds = true
                view.layer.cornerRadius = 8
            }
        }
    }
    
    func updateLevelStats(
        currentLevel: Int,
        currXP: Int,
        nextLevelleftXP: Int,
        progress: Float
    ) {
        levelLabel.text = "Lvl " + String(currentLevel)
        nextLevelLabel.text = "Lvl " + String(currentLevel + 1)
        currentXPLabel.text = String(currXP) + "/1000 XP"
        progressView.setProgress(progress, animated: true)
        leftXP.text = String(nextLevelleftXP) + " XP"
    }
    
    private func setupConstraints() {
        levelRectangle.snp.makeConstraints {
            $0.top.left.equalToSuperview()
            $0.height.equalTo(16)
            $0.width.equalTo(48)
        }
        
        levelLabel.snp.makeConstraints {
            $0.center.equalTo(levelRectangle.snp.center)
        }
        
        progressView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.height.equalTo(16)
        }
        
        nextLevelLabel.snp.makeConstraints {
            $0.centerY.equalTo(progressView.snp.centerY)
            $0.right.equalToSuperview().offset(-8)
        }
        
        currentXPLabel.snp.makeConstraints {
            $0.bottom.left.equalToSuperview()
        }
        
        leftXP.snp.makeConstraints {
            $0.right.bottom.equalToSuperview()
        }
        
        tillNextLevelLabel.snp.makeConstraints {
            $0.right.equalTo(leftXP.snp.left).offset(-21)
            $0.bottom.equalToSuperview()
        }
    }
}
