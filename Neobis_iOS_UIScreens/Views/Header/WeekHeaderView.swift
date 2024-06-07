//
//  WeekHeaderView.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 07/06/2024.
//

import UIKit

class WeekHeaderView: UICollectionReusableView {
    static let headerIdentifier = "TodaysHeaderView"
    
    private var todayLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.text = "This week"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private var iconImage = UIImageView(image: UIImage(named: "calendar.png"))

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        [todayLabel, iconImage].forEach{addSubview($0)}
        
        todayLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
        
        iconImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.width.height.equalTo(32)
        }
    }
}
