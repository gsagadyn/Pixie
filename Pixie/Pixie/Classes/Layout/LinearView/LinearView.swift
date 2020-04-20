//
//  LinearView.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 19/04/2020.
//

import UIKit

open class LinearView: UIView {
    // MARK: - Open Properties

    open var arrangedSubviews: [UIView] {
        stackView.arrangedSubviews
    }
    open var axis: NSLayoutConstraint.Axis = .vertical {
        didSet { updateContentView() }
    }
    open var contentInset: UIEdgeInsets = .zero {
        didSet { updateContentView() }
    }
    open var spacing: CGFloat {
        get { stackView.spacing }
        set { stackView.spacing = newValue }
    }
    open var isBaselineRelativeArrangement: Bool {
        get { stackView.isBaselineRelativeArrangement }
        set { stackView.isBaselineRelativeArrangement = newValue }
    }
    open var isLayoutMarginsRelativeArrangement: Bool {
        get { stackView.isLayoutMarginsRelativeArrangement }
        set { stackView.isLayoutMarginsRelativeArrangement = newValue }
    }
    open override var intrinsicContentSize: CGSize {
        contentView.frame.size
    }

    // MARK: - Public Properties

    public let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .clear
        view.clipsToBounds = false
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Private Properties

    private var horizontalAxisConstraint: NSLayoutConstraint?
    private var verticalAxisConstraint: NSLayoutConstraint?
    private var topConstraint: NSLayoutConstraint?
    private var rightConstraint: NSLayoutConstraint?
    private var bottomConstraint: NSLayoutConstraint?
    private var leftConstraint: NSLayoutConstraint?
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 0.0
        view.backgroundColor = .clear
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Initialization

    public convenience init() {
        self.init(frame: .zero)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        initialization()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialization()
    }
    
    // MARK: - Intrinsic Content Size
    
    open override func invalidateIntrinsicContentSize() {
        contentView.layoutIfNeeded()
        super.invalidateIntrinsicContentSize()
    }
}

// -----------------------------------------------------------------------------
// MARK: - Private Extension
// -----------------------------------------------------------------------------

extension LinearView {
    private func initialization() {
        backgroundColor = .clear
        clipsToBounds = true

        addSubview(scrollView)
        NSLayoutConstraint.activate(scrollView.edgeAnchors(to: self))
        
        scrollView.addSubview(contentView)
        horizontalAxisConstraint = contentView.heightAnchor.constraint(equalTo: heightAnchor)
        verticalAxisConstraint = contentView.widthAnchor.constraint(equalTo: widthAnchor)
        NSLayoutConstraint.activate(contentView.edgeAnchors(to: scrollView))

        contentView.addSubview(stackView)
        topConstraint = stackView.topAnchor.constraint(equalTo: contentView.topAnchor)
        leftConstraint = stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor)
        bottomConstraint = stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, priority: .imperative)
        rightConstraint = stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, priority: .imperative)
        NSLayoutConstraint.activate(topConstraint, rightConstraint, bottomConstraint, leftConstraint)

        updateContentView()
    }

    private func updateContentView() {
        stackView.axis = axis

        horizontalAxisConstraint?.isActive = stackView.axis == .horizontal
        verticalAxisConstraint?.isActive = stackView.axis == .vertical

        topConstraint?.constant = contentInset.top
        leftConstraint?.constant = contentInset.left
        bottomConstraint?.constant = -contentInset.bottom
        rightConstraint?.constant = -contentInset.right

        invalidateIntrinsicContentSize()
    }
}

// -----------------------------------------------------------------------------
// MARK: - Stack View Proxy
// -----------------------------------------------------------------------------

extension LinearView {
    public func addArrangedSubview(_ view: UIView) {
        defer { invalidateIntrinsicContentSize() }
        stackView.addArrangedSubview(view)
    }

    public func addArrangedSubviews(_ subviews: UIView...) {
        defer { invalidateIntrinsicContentSize() }
        stackView.addArrangedSubviews(subviews)
    }

    public func addArrangedSubviews(_ subviews: [UIView]) {
        defer { invalidateIntrinsicContentSize() }
        stackView.addArrangedSubviews(subviews)
    }

    public func removeArrangedSubview(_ view: UIView) {
        defer { invalidateIntrinsicContentSize() }
        stackView.removeArrangedSubview(view)
    }

    public func reloadArrangedSubviews(_ subviews: UIView...) {
        defer { invalidateIntrinsicContentSize() }
        stackView.reloadArrangedSubviews(subviews)
    }

    public func reloadArrangedSubviews(_ subviews: [UIView]) {
        defer { invalidateIntrinsicContentSize() }
        stackView.reloadArrangedSubviews(subviews)
    }

    public func insertArrangedSubview(_ view: UIView, at stackIndex: Int) {
        defer { invalidateIntrinsicContentSize() }
        stackView.insertArrangedSubview(view, at: stackIndex)
    }

    public func setCustomSpacing(_ spacing: CGFloat, after arrangedSubview: UIView) {
        defer { invalidateIntrinsicContentSize() }
        stackView.setCustomSpacing(spacing, after: arrangedSubview)
    }

    public func customSpacing(after arrangedSubview: UIView) -> CGFloat {
        defer { invalidateIntrinsicContentSize() }
        return stackView.customSpacing(after: arrangedSubview)
    }
}
