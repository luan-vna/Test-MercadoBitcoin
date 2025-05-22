import UIKit

class ExchangeDetailView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = Metrics.Spacing.small
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    func set(exchange: Exchange) {
        stackView.removeAllArrangedSubviews()
        let fields: [(title: String, description: String)] = [
            ("ID", exchange.exchangeId),
            ("Trades", String(describing: exchange.dataTradeCount)),
            ("Volume 1 Day USD", exchange.volume1DayUsd.toUSDCurrency()),
            ("Site", exchange.website),
        ]
        for (title, value) in fields {
            let item = ExchangeDetailItemView()
            item.set(title: title, value: value)
            stackView.addArrangedSubviewss(item)
        }
    }
}

extension ExchangeDetailView: ViewConfigurable {
    
    func addViews() {
        addSubviews(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
    }
    
    func addConstraints() {
        [
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ].active()
        [
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ].active()
        [
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                           constant: Metrics.Spacing.normal),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: Metrics.Spacing.normal),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: -Metrics.Spacing.normal),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                              constant: -Metrics.Spacing.normal)
        ].active()
    }
    
    func additionalSetup() {
        backgroundColor = .systemBackground
    }
}
