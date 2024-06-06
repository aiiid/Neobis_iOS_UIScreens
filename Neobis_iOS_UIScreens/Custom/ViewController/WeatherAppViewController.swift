import UIKit
import SnapKit

class WeatherAppViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        configureNavigationBar()
    }

    private func configureNavigationBar() {
        // Left icon
        let leftIcon = UIButton(type: .system)
        leftIcon.setImage(UIImage(systemName: "star"), for: .normal)
        leftIcon.tintColor = .black
        leftIcon.addTarget(self, action: #selector(leftIconTapped), for: .touchUpInside)
        
        // Title button
        let titleButton = UIButton(type: .system)
        titleButton.setTitle("Title", for: .normal)
        titleButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        titleButton.tintColor = .black
        titleButton.addTarget(self, action: #selector(titleTapped), for: .touchUpInside)
        titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        titleButton.semanticContentAttribute = .forceRightToLeft
//        titleButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -8)

        // Stack view to hold the left icon and title button
        let stackView = UIStackView(arrangedSubviews: [leftIcon, titleButton])
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        // Container view for the stack view
        let containerView = UIView()
        containerView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let leftBarButtonItem = UIBarButtonItem(customView: containerView)
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        // Right icon
        let rightIcon = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(rightIconTapped))
        navigationItem.rightBarButtonItem = rightIcon
    }

    @objc private func leftIconTapped() {
        print("Left icon tapped")
    }

    @objc private func rightIconTapped() {
        print("Right icon tapped")
    }

    @objc private func titleTapped() {
        print("Title tapped")
    }
}
