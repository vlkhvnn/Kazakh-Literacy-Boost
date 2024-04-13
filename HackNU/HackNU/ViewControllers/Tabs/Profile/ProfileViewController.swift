//
//  ProfileViewController.swift
//  HackNU
//
//  Created by Alikhan Tangirbergen on 13.04.2024.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {

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
    
    private let lineUnderNav = UIView()

    private let kiizImageView : UIImageView = {
        let imgview = UIImageView()
        imgview.image = AppImage.kiizui.uiImage
        imgview.contentMode = .scaleAspectFill
        imgview.translatesAutoresizingMaskIntoConstraints = false
        return imgview
    }()

    private let ornamentImageView: UIImageView = .init(image: AppImage.orna.uiImage)

    private let salemLabel : UILabel = {
        let label = UILabel()
        label.text = "Сәлем 👋"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let stackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.spacing = 4
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()

    private let whiteBackground : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let progressView = UserProgressView()

    private let divider : UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.grayDivider.uiColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let statisticsView = UserStatisticsView()

    private let achievementsLabel : UILabel = {
        let label = UILabel()
        label.text = "Мои достижения"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let allAchievesmentsLabel : UILabel = {
        let label = UILabel()
        label.text = "Все"
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = AppColor.allAchievements.uiColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }()

    private let dashedRectangle : UIImageView = {
        let imgview = UIImageView()
        imgview.image = AppImage.dashedRectangle.uiImage
        imgview.contentMode = .scaleAspectFill
        imgview.translatesAutoresizingMaskIntoConstraints = false
        return imgview
    }()

    private let leavesImageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = AppImage.leaves.uiImage
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let emptyLabel : UILabel = {
        let label = UILabel()
        label.text = "Кажется, здесь пока пусто..."
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = AppColor.emptyAchievements.uiColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let achievementStackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.spacing = 16
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.alignment = .center
        return stackview
    }()
    
    private let otherAchievementsView : UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 8
        view.layer.borderColor = AppColor.grayDash.cgColor
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let otherAchivementsLabel : UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = AppColor.grayDash.uiColor
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        progressView.updateLevelStats(currentLevel: 1, currXP: 0, nextLevelleftXP: 1000, progress: 0)
    }
}

//MARK: Private Methods
extension ProfileViewController {
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        setupNavigationView()
        view.addSubview(scrollView)
        view.isUserInteractionEnabled = true
        lineUnderNav.backgroundColor = AppColor.lineUnderNav.uiColor
        [lineUnderNav, kiizImageView, whiteBackground, ornamentImageView, stackView, progressView, divider, statisticsView, achievementsLabel, allAchievesmentsLabel, dashedRectangle, leavesImageView, emptyLabel, achievementStackView].forEach { contentView.addSubview($0)
        }
        otherAchievementsView.addSubview(otherAchivementsLabel)
        scrollView.addSubview(contentView)
        stackView.addArrangedSubview(salemLabel)
        stackView.addArrangedSubview(nameLabel)
    }
    
    private func setupNavigationView() {
        navigationItem.title = "Профиль"
        navigationItem.backButtonTitle = ""
    }

    private func setupConstraints() {

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
            $0.height.equalTo(660)
        }
        
        lineUnderNav.snp.makeConstraints {
            $0.top.equalTo(contentView.safeAreaLayoutGuide.snp.top)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(2)
        }

        kiizImageView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(lineUnderNav.snp.bottom)
        }

        whiteBackground.snp.makeConstraints {
            $0.left.right.equalTo(view)
            $0.top.equalTo(kiizImageView.snp.top).offset(115)
            $0.height.equalTo(140)
        }

        ornamentImageView.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.size.equalTo(80)
            $0.top.equalTo(kiizImageView.snp.top).offset(67)
        }

        stackView.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(ornamentImageView.snp.bottom).offset(8)
        }

        progressView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom)
            $0.left.right.equalTo(view).inset(16)
            $0.height.equalTo(64)
        }

        divider.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.bottom).offset(24)
            $0.left.right.equalTo(view)
            $0.height.equalTo(2)
        }

        statisticsView.snp.makeConstraints {
            $0.left.right.equalTo(view).inset(16)
            $0.top.equalTo(divider.snp.bottom).offset(16)
            $0.height.equalTo(166)
        }

        achievementsLabel.snp.makeConstraints {
            $0.top.equalTo(statisticsView.snp.bottom).offset(32)
            $0.left.equalTo(view.snp.left).offset(16)
        }

        allAchievesmentsLabel.snp.makeConstraints {
            $0.right.equalTo(view.snp.right).offset(-28)
            $0.top.equalTo(statisticsView.snp.bottom).offset(32)
        }

        dashedRectangle.snp.makeConstraints {
            $0.left.right.equalTo(view).inset(16)
            $0.top.equalTo(achievementsLabel.snp.bottom).offset(22)
            $0.height.equalTo(104)
            $0.bottom.lessThanOrEqualTo(scrollView.contentLayoutGuide.snp.bottom).offset(-16)
        }

        leavesImageView.snp.makeConstraints {
            $0.centerX.equalTo(scrollView)
            $0.top.equalTo(dashedRectangle.snp.top).offset(28)
        }

        emptyLabel.snp.makeConstraints {
            $0.top.equalTo(leavesImageView.snp.bottom).offset(8)
            $0.centerX.equalTo(scrollView)
        }
        achievementStackView.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(achievementsLabel.snp.bottom).offset(22)
        }
        otherAchievementsView.snp.makeConstraints {
            $0.size.equalTo(72)
        }
        
        otherAchivementsLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}


//MARK: Protocol Methods
extension ProfileViewController {
    func showAchievemets() {
        dashedRectangle.isHidden = true
        leavesImageView.isHidden = true
        emptyLabel.isHidden = true
        achievementStackView.isHidden = false
    }
    
    func hideAchievements() {
        dashedRectangle.isHidden = false
        leavesImageView.isHidden = false
        emptyLabel.isHidden = false
        achievementStackView.isHidden = true
    }
    
    func updateAchievements(achievements: [Achievement]) {
        if !achievementStackView.arrangedSubviews.isEmpty {
            clearAchievementStackView()
        }
        for achievement in achievements {
            let image = UIImageView(image: UIImage(named: achievement.imageName))
            image.contentMode = .scaleToFill
            image.snp.makeConstraints {
                $0.size.equalTo(72)
            }
            achievementStackView.addArrangedSubview(image)
        }
        otherAchivementsLabel.text = "+\(5 - achievements.count)"
        achievementStackView.addArrangedSubview(otherAchievementsView)
    }
    
    func clearAchievementStackView() {
        for arrangedSubview in achievementStackView.arrangedSubviews {
            achievementStackView.removeArrangedSubview(arrangedSubview)
            arrangedSubview.removeFromSuperview()
        }
        achievementStackView.removeArrangedSubview(otherAchievementsView)
        otherAchievementsView.removeFromSuperview()
    }
    
    func updateUserStats(rank: String, learntWords: String, streak: String, expPoints: String) {
        statisticsView.updateStats(rank: rank,
                                   learntWords: learntWords,
                                   streak: streak,
                                   expPoints: expPoints
        )
    }

    func updateProgressStats(name: String, currentLevel: Int, nextLevel: Int, fractionText: Int, nextLvlWords: Int, progress: Float) {
        nameLabel.text = name
        progressView.updateLevelStats(currentLevel: 1, currXP: 0, nextLevelleftXP: 1000, progress: 0)
    }
}
