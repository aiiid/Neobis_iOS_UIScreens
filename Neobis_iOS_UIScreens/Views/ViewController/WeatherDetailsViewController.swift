//
//  WeatherDetailsViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 07/06/2024.
//

import UIKit
import SnapKit

class WeatherDetailsViewController: UIViewController {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        
        collectionView.register(
            WeatherCardCollectionViewCell.self,
            forCellWithReuseIdentifier: WeatherCardCollectionViewCell.cellIdentifier
        )
        collectionView.register(
            WeatherWeekCollectionViewCell.self,
            forCellWithReuseIdentifier: WeatherWeekCollectionViewCell.cellIdentifier
        )
        collectionView.register(
            TodaysHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: TodaysHeaderView.headerIdentifier
        )
        collectionView.register(
            WeekHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: WeekHeaderView.headerIdentifier
        )
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigationBar()
    }
    
    private func configureUI() {
        setupBackground()
        view.addSubview(scrollView)
        scrollView.addSubview(collectionView)
        
        configureCompositionalLayout()
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    private func configureNavigationBar() {
        let rightIcon = UIBarButtonItem(
            image: UIImage(systemName: "gearshape"),
            style: .plain,
            target: self,
            action: nil
        )
        rightIcon.tintColor = .white
        navigationItem.rightBarButtonItem = rightIcon
    }
    
    private func setupBackground() {
        // Setup gradient background
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(hex: "#47BFDF").cgColor, UIColor(hex: "#4A91FF").cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        // Setup background lines
        let line1 = UIImageView(image: UIImage(named: "line1.png"))
        let line2 = UIImageView(image: UIImage(named: "line2.png"))
        
        view.addSubview(line1)
        view.addSubview(line2)
        
        line1.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(30)
        }
        
        line2.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(110)
        }
        
    }
    func configureCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout {sectionIndex, enviroment in
            switch sectionIndex {
            case 0:
                return AppLayouts.shared.weatherCardsSection()
            case 1:
                return AppLayouts.shared.weatherTableSection()
            default:
                return AppLayouts.shared.weatherCardsSection()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}

extension WeatherDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return weatherDayMockData.count
        case 1:
            return weatherDayMockData.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: WeatherCardCollectionViewCell.cellIdentifier,
                for: indexPath
            ) as? WeatherCardCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.cellData = weatherDayMockData[indexPath.row]
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: WeatherWeekCollectionViewCell.cellIdentifier,
                for: indexPath
            ) as? WeatherWeekCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.cellData = weatherWeekMockData[indexPath.row]
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    // Header view
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            switch indexPath.section {
            case 0:
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: TodaysHeaderView.headerIdentifier,
                    for: indexPath
                ) as? TodaysHeaderView else {
                    return UICollectionReusableView()
                }
                return header
            case 1:
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: WeekHeaderView.headerIdentifier,
                    for: indexPath
                ) as? WeekHeaderView else {
                    return UICollectionReusableView()
                }
                return header
            default:
                return UICollectionReusableView()
            }
        }
        return UICollectionReusableView()
    }
}
