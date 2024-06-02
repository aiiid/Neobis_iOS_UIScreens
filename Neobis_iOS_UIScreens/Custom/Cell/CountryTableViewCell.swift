import UIKit
import SnapKit

class CountryTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CountryTableViewCell"
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private var countryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill // Ensure the image is properly scaled
        imageView.clipsToBounds = true // Ensure the image doesn't overflow the bounds
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private let shadowOverlay: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let redLine: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let gradientLayer = CAGradientLayer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubview(countryImage)
        contentView.addSubview(shadowOverlay)
        contentView.addSubview(countryLabel)
        contentView.addSubview(redLine)
        
        countryImage.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
            make.height.equalTo(250)
        }
        
        shadowOverlay.snp.makeConstraints { make in
            //            make.edges.equalTo(countryImage)
            make.top.equalTo(countryImage.snp.top)
            make.leading.equalTo(countryImage.snp.leading)
            make.trailing.equalTo(countryImage.snp.trailing)
            make.height.equalTo(80)
        }
        
        countryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(35)
        }
        
        redLine.snp.makeConstraints { make in
            make.top.equalTo(countryLabel.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
            make.width.equalTo(countryLabel.snp.width)
            make.height.equalTo(2)        }
        
        // Configure the gradient layer
        gradientLayer.colors = [
            UIColor.black.withAlphaComponent(0.8).cgColor,
            UIColor.clear.cgColor
        ]
        gradientLayer.locations = [0, 1]
        gradientLayer.cornerRadius = 12
        gradientLayer.opacity = 0.9 // Opacity level for the gradient
        shadowOverlay.layer.addSublayer(gradientLayer)
        
        // Set the frame of the gradient layer here
        DispatchQueue.main.async {
            self.gradientLayer.frame = self.shadowOverlay.bounds
        }
    }
    
    func configure(with country: String, image: String) {
        countryLabel.text = country.uppercased()
        countryImage.image = UIImage(named: image)
        
        // Ensure the gradient layer's frame is updated when the cell is configured
        DispatchQueue.main.async {
            self.gradientLayer.frame = self.shadowOverlay.bounds
        }
    }
}
