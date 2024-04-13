//
//  UserStatisticsView.swift
//  HackNU
//
//  Created by Alikhan Tangirbergen on 13.04.2024.
//

import UIKit
import SnapKit

final class UserStatisticsView: UIView {
    
    private let statsLabel : UILabel = {
       let label = UILabel()
        label.text = "Статистика"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private let rankView = StatsTypeView()
    private let wordCountView = StatsTypeView()
    private let bestDaysView = StatsTypeView()
    private let pointView = StatsTypeView()
    
    private let upperStackView : UIStackView = {
       let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.spacing = 16
        stackview.alignment = .center
        return stackview
    }()
    
    private let lowerStackView : UIStackView = {
       let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.spacing = 16
        stackview.alignment = .center
        return stackview
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
extension UserStatisticsView {
    
    func updateStats(rank: String, learntWords: String, streak: String, expPoints: String) {
        rankView.updateStats(stat: rank)
        wordCountView.updateStats(stat: learntWords)
        bestDaysView.updateStats(stat: streak)
        pointView.updateStats(stat: expPoints)
    }
    
    private func setupView() {
        [statsLabel, upperStackView, lowerStackView].forEach { self.addSubview($0) }
        upperStackView.addArrangedSubview(rankView)
        upperStackView.addArrangedSubview(wordCountView)
        lowerStackView.addArrangedSubview(bestDaysView)
        lowerStackView.addArrangedSubview(pointView)
        setupStats()
        setupConstraints()
    }
    
    private func setupStats() {
        rankView.configure(image: AppImage.flag.uiImage!,
                           number: "-",
                           type: "Ранк"
        )
        wordCountView.configure(image: AppImage.book.uiImage!,
                                number: "0",
                                type: "Выучено слов"
        )
        bestDaysView.configure(image: AppImage.sandtimer.uiImage!,
                               number: "0",
                               type: "Ударные дни"
        )
        pointView.configure(image: AppImage.ecology_clean_battery.uiImage!,
                            number: "0",
                            type: "Очки опыта"
        )
    }
    
    private func setupConstraints() {
        statsLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
        }
        
        [wordCountView, rankView, pointView, bestDaysView].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(56)
                $0.width.equalTo(148)
            }
        }
        
        upperStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(statsLabel.snp.bottom).offset(16)
        }
        
        lowerStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(upperStackView.snp.bottom).offset(8)
        }
    }
}
