//
//  EmbeddedStackViewsViewController.swift
//  Declerative_UIKit
//
//  Created by Geri Borbás on 29/11/2020.
//

import UIKit


class EmbeddedStackViewsViewController: UIViewController {

	
	// MARK: Views
	
	struct UI {
		static let insets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
		static let spacing = CGFloat(10)
	}
	
	private lazy var stackView = UIStackView().vertical(spacing: UI.spacing).withViews(
		UILabel().withTitleStyle.with { $0.text = Data.earth.title }.inspect,
		UIStackView().vertical(spacing: 5).withViews(
			UIStackView().horizontal(spacing: 5).withViews(
				UILabel().with { $0.text = "size" }.inspect,
				UILabel().with { $0.text = Data.earth.properties.size }.inspect
			),
			UIStackView().horizontal(spacing: 5).withViews(
				UILabel().with { $0.text = "distance" }.inspect,
				UILabel().with { $0.text = Data.earth.properties.distance }.inspect
			),
			UIStackView().horizontal(spacing: 5).withViews(
				UILabel().with { $0.text = "mass" }.inspect,
				UILabel().with { $0.text = Data.earth.properties.mass }.inspect
			)
		),
		UIImageView().with { $0.image = UIImage(named: Data.earth.imageAssetName) }.inspect,
		UILabel().withParagraphStyle.with { $0.text = Data.earth.paragraphs.first }.inspect,
		UILabel().withParagraphStyle.with { $0.text = Data.earth.paragraphs.last }.inspect,
		UIView.spacer.inspect
	)
	
	
	// MARK: Initialization
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(stackView)
		stackView.add(insets: UI.insets, to: view.safeAreaLayoutGuide)
	}
}
