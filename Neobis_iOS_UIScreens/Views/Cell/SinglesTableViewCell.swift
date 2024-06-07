import UIKit
import SnapKit

class SinglesTableViewCell: UITableViewCell {
    static let reuseIdentifier = "SinglesTableViewCell"
    
    let titleLabel: UILabel
    let descriptionLabel: UILabel
    var cellImageView: UIImageView
    
    let textContainerView: UIView
    let imageContainerView: UIView
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center // Align items center vertically
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        titleLabel = UILabel()
        descriptionLabel = UILabel()
        cellImageView = UIImageView()
        textContainerView = UIView()
        imageContainerView = UIView()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        textContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 16)
        
        // Add subviews
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.spacing = 1
        
        textContainerView.addSubview(verticalStackView)
        imageContainerView.addSubview(cellImageView)
        
        horizontalStackView.addArrangedSubview(textContainerView)
        horizontalStackView.addArrangedSubview(imageContainerView)
        
        contentView.addSubview(horizontalStackView)
        
        // Set fixed width and height for the image view
        cellImageView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        // Set constraints
        horizontalStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        textContainerView.snp.makeConstraints { make in
            make.height.equalTo(horizontalStackView.snp.height)
            make.width.equalTo(horizontalStackView.snp.width).multipliedBy(0.55)
        }
        
        imageContainerView.snp.makeConstraints { make in
            make.height.equalTo(horizontalStackView.snp.height)
            make.width.equalTo(horizontalStackView.snp.width).multipliedBy(0.4)
        }
    }
    
    func configureCell(title: String, description: String, imageName: String, index: Int) {
        titleLabel.text = title
        descriptionLabel.text = description
        cellImageView.image = UIImage(named: imageName)
        
        switch index % 2 {
        case 0:
            // Even index: image on the right, text on the left
            horizontalStackView.removeArrangedSubview(imageContainerView)
            horizontalStackView.addArrangedSubview(imageContainerView)
            
        case 1:
            // Odd index: image on the left, text on the right
            horizontalStackView.removeArrangedSubview(imageContainerView)
            horizontalStackView.insertArrangedSubview(imageContainerView, at: 0)
            
        default:
            return
        }
    }
}
