//
//  ExchangeDetailItemView.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

import UIKit

class ExchangeDetailItemView: UIView {
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Metrics.Font.normal,
                                 weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Metrics.Font.big,
                                 weight: .medium)
        label.textColor = .label
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    func set(title: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
    }
}

extension ExchangeDetailItemView: ViewConfigurable {
    func addViews() {
        addSubviews(stackView)
        stackView.addArrangedSubviewss(titleLabel, valueLabel)
    }
    
    func addConstraints() {
        [
            heightAnchor.constraint(greaterThanOrEqualToConstant: 30)
        ].active()
        [
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ].active()
    }
}
