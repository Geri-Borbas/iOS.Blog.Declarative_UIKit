//
//  DeclarativeViewController.swift
//  Declarative_UIKit
//
//  Created by Geri Borbás on 29/11/2020.
//  http://www.twitter.com/Geri_Borbas
//

import UIKit


class DeclarativeViewController: UIViewController {

	
	// MARK: Views
	
	struct UI {
		static let insets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
		static let spacing = CGFloat(10)
	}
	
	private lazy var stackView = UIStackView().with {
		$0.axis = .vertical
		$0.spacing = UI.spacing
		$0.views(
			UILabel().withTitleStyle.with { $0.text = Data.earth.title }.inspect,
			UILabel().withPropertyStyle.with {
				$0.numberOfLines = 0
				$0.text = """
					size: \(Data.earth.properties.size)
					distance: \(Data.earth.properties.distance)
					mass: \(Data.earth.properties.mass)
					"""
			}.inspect,
			UIImageView().with { $0.image = UIImage(named: Data.earth.imageAssetName) }.inspect,
			UILabel().withParagraphStyle.with { $0.text = Data.earth.paragraphs.first }.inspect,
			UILabel().withParagraphStyle.with { $0.text = Data.earth.paragraphs.last }.inspect,
			UIView.spacer.inspect
		)
	}
	
	
	// MARK: Initialization
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(stackView)
		stackView.pin(to: view.safeAreaLayoutGuide, insets: UI.insets)
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
			$0.textColor = .systemGray
			$0.font = UIFont.preferredFont(forTextStyle: .headline)
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
