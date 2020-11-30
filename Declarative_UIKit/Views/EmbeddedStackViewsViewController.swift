//
//  EmbeddedStackViewsViewController.swift
//  Declarative_UIKit
//
//  Created by Geri Borbás on 30/11/2020.
//  http://www.twitter.com/Geri_Borbas
//

import UIKit

class EmbeddedStackViewsViewController: UIViewController {
	
	private lazy var body = UIStackView().vertical(spacing: 10).withViews(
		UILabel()
			.withTitleStyle
			.with { $0.text = Data.earth.title },
		UIStackView().vertical(spacing: 5).withViews(
			UIStackView().horizontal(spacing: 5).withViews(
				UILabel()
					.with { $0.text = "size" }
					.withPropertyStyle
					.withBox,
				UILabel()
					.with { $0.text = Data.earth.properties.size }
					.withPropertyValueStyle,
				UIView.spacer
			),
			UIStackView().horizontal(spacing: 5).withViews(
				UILabel()
					.with { $0.text = "distance" }
					.withPropertyStyle
					.withBox,
				UILabel()
					.with { $0.text = Data.earth.properties.distance }
					.withPropertyValueStyle,
				UIView.spacer
			),
			UIStackView().horizontal(spacing: 5).withViews(
				UILabel()
					.with { $0.text = "mass" }
					.withPropertyStyle
					.withBox,
				UILabel()
					.with { $0.text = Data.earth.properties.mass }
					.withPropertyValueStyle,
				UIView.spacer
			)
		),
		UIImageView()
			.with { $0.image = UIImage(named: Data.earth.imageAssetName) },
		UILabel()
			.withParagraphStyle
			.with { $0.text = Data.earth.paragraphs.first },
		UILabel()
			.withParagraphStyle
			.with { $0.text = Data.earth.paragraphs.last },
		UIView.spacer
	)
	
	
	// MARK: Initialization
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(body)
		view.backgroundColor = .systemBackground
		body.pin(
			to: view.safeAreaLayoutGuide,
			insets: UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
		)
	}
}


// MARK: - Styles

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
	
	var withBoxStyle: UIView {
		with {
			$0.backgroundColor = .systemGray
			$0.layer.cornerRadius = 5
		}
	}
	
	var withBox: UIView {
		UIView().withBoxStyle.with {
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


// MARK: - Previews

import SwiftUI

struct EmbeddedStackViewsViewController_Previews: PreviewProvider {
    static var previews: some View {
		PreviewView(for: EmbeddedStackViewsViewController())
			.environment(\.colorScheme, .dark)
			.edgesIgnoringSafeArea(.all)
    }
}
