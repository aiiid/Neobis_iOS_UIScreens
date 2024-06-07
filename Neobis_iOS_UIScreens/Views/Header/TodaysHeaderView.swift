//
//  TodaysHeaderView.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 07/06/2024.
//

import UIKit

class TodaysHeaderView: UICollectionReusableView {
    static let headerIdentifier = "TodaysHeaderView"
    
    private var todayLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.text = "Today"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private var dateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.text = "Apr, 26"
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        [todayLabel, dateLabel].forEach{addSubview($0)}
        
        todayLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
        }
    }
    
}
