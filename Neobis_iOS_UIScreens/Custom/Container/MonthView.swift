//
//  monthView.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 05/06/2024.
//
import UIKit

class MonthView: UIView {
    
    private let leftArrowButton: UIButton = {
        let button = UIButton()
        button.setTitle("←", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        return button
    }()
    
    private let rightArrowButton: UIButton = {
        let button = UIButton()
        button.setTitle("→", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        return button
    }()
    
    private let monthLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = "June" // Default month, you can set it dynamically
        return label
    }()
    
    var currentMonth: Int = 6 // Assuming June as default
    var currentYear: Int = 2024 // Assuming current year
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(leftArrowButton)
        addSubview(rightArrowButton)
        addSubview(monthLabel)
        
        leftArrowButton.addTarget(self, action: #selector(didTapLeftArrow), for: .touchUpInside)
        rightArrowButton.addTarget(self, action: #selector(didTapRightArrow), for: .touchUpInside)
        
        leftArrowButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        rightArrowButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        }
        
        monthLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    @objc private func didTapLeftArrow() {
        print("left")
        changeMonth(by: -1)
    }
    
    @objc private func didTapRightArrow() {
        print("right")
        changeMonth(by: 1)
    }
    
    private func changeMonth(by value: Int) {
        var newMonth = currentMonth + value
        var newYear = currentYear
        
        if newMonth < 1 {
            newMonth = 12
            newYear -= 1
        } else if newMonth > 12 {
            newMonth = 1
            newYear += 1
        }
        
        currentMonth = newMonth
        currentYear = newYear
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        let dateComponents = DateComponents(year: currentYear, month: currentMonth)
        if let date = Calendar.current.date(from: dateComponents) {
            monthLabel.text = dateFormatter.string(from: date)
        }
    }
}
