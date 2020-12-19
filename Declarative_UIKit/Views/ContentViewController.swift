//
//  ContentViewController.swift
//  Declarative_UIKit
//
//  Created by Geri Borbás on 28/11/2020.
//  http://www.twitter.com/Geri_Borbas
//

import UIKit


class ContentViewController: UIViewController {

	let viewModel = ViewModel()
	
	private lazy var stackView = UIStackView().with {
		$0.axis = .vertical
		$0.spacing = 10
		[
			UILabel().with {
				$0.text = viewModel.earth.title
				$0.textColor = .label
				$0.font = UIFont.preferredFont(forTextStyle: .largeTitle)
			},
			UIImageView().with {
				$0.image = UIImage(named: viewModel.earth.imageAssetName)
			},
			UILabel().with {
				$0.text = """
					size: \(viewModel.earth.properties.size)
					distance: \(viewModel.earth.properties.distance)
					mass: \(viewModel.earth.properties.mass)
					"""
				$0.textColor = .systemGray
				$0.numberOfLines = 0
				$0.font = UIFont.preferredFont(forTextStyle: .headline)
			},
			UILabel().with {
				$0.text = viewModel.earth.paragraphs.first
				$0.textColor = .label
				$0.numberOfLines = 0
				$0.font = UIFont.preferredFont(forTextStyle: .footnote)
			},
			UILabel().with {
				$0.text = viewModel.earth.paragraphs.last
				$0.textColor = .label
				$0.numberOfLines = 0
				$0.font = UIFont.preferredFont(forTextStyle: .footnote)
			},
			UIView()
		].add(to: $0)
	}
	
	// MARK: Initialization
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .systemBackground
		view.addSubview(stackView)
		stackView.with {
			$0.translatesAutoresizingMaskIntoConstraints = false
			$0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
			$0.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
			$0.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
			$0.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30).isActive = true
		}
    }
}


fileprivate extension UIView {
	
	func addRedLines() {
		layer.borderWidth = 1
		layer.cornerRadius = 2
		layer.borderColor = UIColor.red.withAlphaComponent(0.3).cgColor
		backgroundColor = UIColor.red.withAlphaComponent(0.1)
	}
}



fileprivate extension Array where Element: UIView {
	
	func add(to stackView: UIStackView) {
		forEach { stackView.addArrangedSubview($0) }
	}
}


// MARK: - Previews

import SwiftUI

struct WithableViewController_Previews: PreviewProvider {
	static var previews: some View {
		PreviewView(for: ContentViewController())
			.environment(\.colorScheme, .dark)
			.edgesIgnoringSafeArea(.all)
	}
}
