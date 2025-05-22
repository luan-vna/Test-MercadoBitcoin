//
//  ExchangesTableViewCell.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

import UIKit

class ExchangesTableViewCell: UITableViewCell, ViewIdentifier {
    
    private var exchange: Exchange?

    private lazy var labelsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        return view
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Metrics.Font.small)
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Metrics.Font.big,
                                 weight: .bold)
        return label
    }()
    
    private lazy var volumeUSDLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Metrics.Font.normal,
                                 weight: .semibold)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        nil
    }

    func set(exchange: Exchange) {
        nameLabel.text = exchange.name
        idLabel.text = exchange.exchangeId
        volumeUSDLabel.text = "Volume: \(exchange.volume1DayUsd.toUSDCurrency())"
    }
}

extension ExchangesTableViewCell: ViewConfigurable {
    
    func addViews() {
        addSubviews(labelsStackView)
        labelsStackView.addArrangedSubviewss(idLabel,
                                             nameLabel,
                                             volumeUSDLabel)
    }
    
    func addConstraints() {
        [
            labelsStackView.topAnchor.constraint(equalTo: topAnchor,
                                                 constant: Metrics.Spacing.small),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                    constant: -Metrics.Spacing.small),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                     constant: Metrics.Spacing.normal),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                      constant: -Metrics.Spacing.normal)
        ].active()
    }
    
    func additionalSetup() {
        accessoryType = .disclosureIndicator
    }
}
