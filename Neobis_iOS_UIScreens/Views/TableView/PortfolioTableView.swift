//
//  PortfolioTableView.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 02/06/2024.
//

import UIKit

class PortfolioTableView: UITableView {
    
    private var data = [CryptoAsset(name: "Bitcoin", image: "BTC.png", background: "#F6543E"),
                        CryptoAsset(name: "Ethereum", image: "ETH.png"),
                        CryptoAsset(name: "Litecoin", image: "Lite.png", background: "#30E0A1"),
                        CryptoAsset(name: "Ripple", image: "Ripple.png"),
                        CryptoAsset(name: "Ripple", image: "Ripple.png"),
                        CryptoAsset(name: "Ripple", image: "Ripple.png")]
    
    init() {
        super.init(frame: .zero, style: .plain)
        
        backgroundColor = .white
        separatorStyle = .singleLine // Add default separator style
        register(PortfolioAssetCell.self, forCellReuseIdentifier: PortfolioAssetCell.reuseIdentifier)
        
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PortfolioTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PortfolioAssetCell.reuseIdentifier,
            for: indexPath
        ) as? PortfolioAssetCell else {
            fatalError("Unable to dequeue PortfolioAssetCell")
        }
        cell.configure(with: data[indexPath.row])
        return cell
    }
}

extension PortfolioTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // Adjust cell height as needed
    }
}
