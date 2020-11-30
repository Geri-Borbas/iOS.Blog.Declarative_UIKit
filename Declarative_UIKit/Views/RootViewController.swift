//
//  RootViewController.swift
//  Declarative_UIKit
//
//  Created by Geri Borbás on 28/11/2020.
//  http://www.twitter.com/Geri_Borbas
//

import UIKit


class RootViewController: UIViewController {

	
	// MARK: Views
	
	struct UI {
		static let insets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
		static let spacing = CGFloat(10)
	}
	
	private lazy var titleLabel = UILabel().with {
		$0.text = Data.earth.title
		$0.textColor = .label
		$0.font = UIFont.preferredFont(forTextStyle: .largeTitle)
	}
	
	private lazy var propertiesLabel = UILabel().with {
		$0.text = """
			size: \(Data.earth.properties.size)
			distance: \(Data.earth.properties.distance)
			mass: \(Data.earth.properties.mass)
			"""
		$0.textColor = .systemGray
		$0.numberOfLines = 0
		$0.font = UIFont.preferredFont(forTextStyle: .headline)
	}
	
	private lazy var firstParagraphLabel = UILabel().with {
		$0.text = Data.earth.paragraphs.first
		$0.textColor = .label
		$0.numberOfLines = 0
		$0.font = UIFont.preferredFont(forTextStyle: .footnote)
	}
	
	private lazy var lastParagraphLabel = UILabel().with {
		$0.text = Data.earth.paragraphs.last
		$0.textColor = .label
		$0.numberOfLines = 0
		$0.font = UIFont.preferredFont(forTextStyle: .footnote)
	}
	
	private lazy var stackView = UIStackView().with {
		$0.axis = .vertical
		$0.spacing = UI.spacing
		$0.views(
			titleLabel.withRedLines,
			propertiesLabel.withRedLines,
			UIImageView().with {
				$0.image = UIImage(named: Data.earth.imageAssetName)
			}.withRedLines,
			firstParagraphLabel.withRedLines,
			lastParagraphLabel.withRedLines,
			UIView.spacer.withRedLines
		)
	}
	
	
	// MARK: Initialization
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// Hierarchy.
		view.addSubview(stackView)
		
		// Constraints.
		stackView.with {
			$0.translatesAutoresizingMaskIntoConstraints = false
			view.addConstraints([
				$0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UI.insets.top),
				$0.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -UI.insets.bottom),
				$0.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: UI.insets.left),
				$0.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -UI.insets.right),
			])
		}
    }
}
