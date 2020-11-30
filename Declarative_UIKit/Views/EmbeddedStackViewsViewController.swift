//
//  EmbeddedStackViewsViewController.swift
//  Declarative_UIKit
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
		UILabel()
			.withTitleStyle
			.with { $0.text = Data.earth.title }
			.inspect,
		UIStackView().vertical(spacing: 5).withViews(
			UIStackView().horizontal(spacing: 5).withViews(
				UILabel()
					.with { $0.text = "size" }
					.withPropertyStyle
					.boxed,
				UILabel()
					.with { $0.text = Data.earth.properties.size }
					.withPropertyValueStyle
					.inspect,
				UIView.spacer.inspect
			),
			UIStackView().horizontal(spacing: 5).withViews(
				UILabel()
					.with { $0.text = "distance" }
					.withPropertyStyle
					.boxed,
				UILabel()
					.with { $0.text = Data.earth.properties.distance }
					.withPropertyValueStyle
					.inspect,
				UIView.spacer.inspect
			),
			UIStackView().horizontal(spacing: 5).withViews(
				UILabel()
					.with { $0.text = "mass" }
					.withPropertyStyle
					.boxed,
				UILabel()
					.with { $0.text = Data.earth.properties.mass }
					.withPropertyValueStyle
					.inspect,
				UIView.spacer.inspect
			)
		),
		UIImageView()
			.with { $0.image = UIImage(named: Data.earth.imageAssetName) }
			.inspect,
		UILabel()
			.withParagraphStyle
			.with { $0.text = Data.earth.paragraphs.first }
			.inspect,
		UILabel()
			.withParagraphStyle
			.with { $0.text = Data.earth.paragraphs.last }
			.inspect,
		UIView.spacer.inspect
	)
	
	
	// MARK: Initialization
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(stackView)
		stackView.add(insets: UI.insets, to: view.safeAreaLayoutGuide)
	}
}



fileprivate extension UILabel {
	
	var withTitleStyle: UILabel {
		with {
			$0.textColor = .label
			$0.font = UIFont.preferredFont(forTextStyle: .largeTitle)
		}
	}
	
	var withPropertyStyle: UILabel {
		with {
			$0.textColor = .systemBackground
			$0.font = UIFont.preferredFont(forTextStyle: .headline)
			$0.setContentCompressionResistancePriority(.required, for: .vertical)
		}
	}
	
	var withPropertyValueStyle: UILabel {
		with {
			$0.textColor = .systemGray
			$0.font = UIFont.preferredFont(forTextStyle: .body)
		}
	}
	
	var withParagraphStyle: UILabel {
		with {
			$0.textColor = .label
			$0.numberOfLines = 0
			$0.font = UIFont.preferredFont(forTextStyle: .footnote)
		}
	}
}


extension UIView {
	
	var boxed: UIView {
		UIView().with {
			$0.backgroundColor = .systemGray
			$0.layer.cornerRadius = 5
			$0.addSubview(self)
			self.translatesAutoresizingMaskIntoConstraints = false
			$0.addConstraints([
				self.topAnchor.constraint(equalTo: $0.topAnchor, constant: 2),
				self.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: -2),
				self.leftAnchor.constraint(equalTo: $0.leftAnchor, constant: 5),
				self.rightAnchor.constraint(equalTo: $0.rightAnchor, constant: -5),
			])
		}
	}
}
