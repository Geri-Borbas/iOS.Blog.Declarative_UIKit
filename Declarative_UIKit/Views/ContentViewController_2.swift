//
//  ContentViewController_2.swift
//  Declarative_UIKit
//
//  Created by Geri Borbás on 30/11/2020.
//  http://www.twitter.com/Geri_Borbas
//

import UIKit

class ContentViewController_2: UIViewController {
	
	let viewModel = Planets().earth
	
	private lazy var body = UIStackView().vertical(spacing: 10).withViews(
		UILabel()
			.with(text: viewModel.title)
			.withTitleStyle,
		UIStackView().vertical(spacing: 5).withViews(
			UIStackView().horizontal(spacing: 5).withViews(
				UILabel()
					.with(text: "size")
					.withPropertyStyle  
					.withBox,
				UILabel()
					.with(text: viewModel.properties.size)
					.withPropertyValueStyle,
				UIView.spacer
			),
			UIStackView().horizontal(spacing: 5).withViews(
				UILabel()
					.with(text: "distance")
					.withPropertyStyle
					.withBox,
				UILabel()
					.with(text: viewModel.properties.distance)
					.withPropertyValueStyle,
				UIView.spacer
			),
			UIStackView().horizontal(spacing: 5).withViews(
				UILabel()
					.with(text: "mass")
					.withPropertyStyle
					.withBox,
				UILabel()
					.with(text: viewModel.properties.mass)
					.withPropertyValueStyle,
				UIView.spacer
			)
		),
		UIImageView()
			.with { $0.image = UIImage(named: viewModel.imageAssetName) },
		UILabel()
			.with(text: viewModel.paragraphs.first)
			.withParagraphStyle,
		UILabel()
			.with(text: viewModel.paragraphs.last)
			.withParagraphStyle,
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
			$0.font = .preferredFont(forTextStyle: .largeTitle)
		}
	}
	
	var withPropertyStyle: UILabel {
		with {
			$0.textColor = .systemBackground
			$0.font = .preferredFont(forTextStyle: .headline)
			$0.setContentCompressionResistancePriority(.required, for: .vertical)
		}
	}
	
	var withPropertyValueStyle: UILabel {
		with {
			$0.textColor = .systemGray
			$0.font = .preferredFont(forTextStyle: .body)
		}
	}
	
	var withParagraphStyle: UILabel {
		with {
			$0.textColor = .label
			$0.numberOfLines = 0
			$0.font = .preferredFont(forTextStyle: .footnote)
		}
	}
}

extension UILabel {
	
	func with(text: String?) -> UILabel {
		with {
			$0.text = text
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
	
	func pin(to: UILayoutGuide, insets: UIEdgeInsets)  {
		guard let superview = superview else {
			return
		}
		
		with {
			$0.translatesAutoresizingMaskIntoConstraints = false
			superview.addConstraints([
				$0.topAnchor.constraint(equalTo: to.topAnchor, constant: insets.top),
				$0.bottomAnchor.constraint(equalTo: to.bottomAnchor, constant: -insets.bottom),
				$0.leftAnchor.constraint(equalTo: to.leftAnchor, constant: insets.left),
				$0.rightAnchor.constraint(equalTo: to.rightAnchor, constant: -insets.right),
			])
		}
	}
}


// MARK: - Previews

import SwiftUI

struct DetailViewController_Previews: PreviewProvider {
    static var previews: some View {
		PreviewView(for: ContentViewController_2())
			.environment(\.colorScheme, .dark)
			.edgesIgnoringSafeArea(.all)
    }
}
