import UIKit
import SnapKit

class WeatherAppViewController: UIViewController {
    private let weatherForecastButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        configureNavigationBar()
        configureUI()
    }
    
    private func configureUI() {
        setupBackground()
        let weatherCardView = WeatherCardView()
        let weatherImage = UIImageView(image: UIImage(named: "sun.png"))
        
        weatherForecastButton.setTitle("Прогноз на неделю", for: .normal)
        weatherForecastButton.setTitleColor(UIColor(hex: "444E72"), for: .normal)
        // Set the button's image
        weatherForecastButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        weatherForecastButton.tintColor = UIColor(hex: "#444E72")
        
        // Adjust the spacing between the title and the image
        weatherForecastButton.semanticContentAttribute = .forceRightToLeft
        weatherForecastButton.configuration?.imagePadding = 10
        weatherForecastButton.addTarget(self, action: #selector(weatherForecastPressed), for: .touchUpInside)
        
        weatherForecastButton.backgroundColor = .white
        weatherForecastButton.layer.cornerRadius = 20
        
        view.addSubview(weatherImage)
        view.addSubview(weatherCardView)
        view.addSubview(weatherForecastButton)
        
        weatherImage.snp.makeConstraints { make in
            make.height.width.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        weatherCardView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(weatherImage.snp.bottom).offset(15)
            make.width.equalTo(353)
            make.height.equalTo(335)
        }
        
        weatherForecastButton.snp.makeConstraints { make in
            make.top.equalTo(weatherCardView.snp.bottom).offset(25)
            make.leading.equalTo(weatherCardView.snp.leading).offset(52)
            make.trailing.equalTo(weatherCardView.snp.trailing).offset(-52)
            make.height.equalTo(64)
        }
    }
    
    private func configureNavigationBar() {
        // Left icon
        let leftIcon = UIButton(type: .system)
        leftIcon.setImage(UIImage(named: "mapPin.png"), for: .normal)
        leftIcon.tintColor = .white
        
        // Title button
        let titleButton = UIButton(type: .system)
        titleButton.setTitle("Astana", for: .normal)
        
        // Smaller chevron down icon
        let chevronIcon = UIImageView()
        chevronIcon.image = UIImage(systemName: "chevron.down")
        chevronIcon.tintColor = .white
        chevronIcon.contentMode = .scaleAspectFit
        
        titleButton.tintColor = .white
        titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        // Stack view to hold the left icon and title button
        let stackView = UIStackView(arrangedSubviews: [leftIcon, titleButton, chevronIcon])
        stackView.axis = .horizontal
        stackView.spacing = 16
        
        // Container view for the stack view
        let containerView = UIView()
        containerView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let leftBarButtonItem = UIBarButtonItem(customView: containerView)
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        // Right icon
        let rightIcon = UIBarButtonItem(
            image: UIImage(named: "notification.png"),
            style: .plain,
            target: self,
            action: nil
        )
        rightIcon.tintColor = .white
        navigationItem.rightBarButtonItem = rightIcon
        
        // Back button settings
        navigationItem.backButtonTitle = "Назад"
        
        // Change the navigation bar's tint color to white
        navigationController?.navigationBar.tintColor = .white
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
    
    @objc private func weatherForecastPressed() {
        print("open vc")
        navigationController?.pushViewController(WeatherDetailsViewController(), animated: true)
    }
}
