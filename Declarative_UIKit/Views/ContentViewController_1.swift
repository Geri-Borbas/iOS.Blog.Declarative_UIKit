//
//  ContentViewController_1.swift
//  Declarative_UIKit
//
//  Created by Geri Borbás on 28/11/2020.
//  http://www.twitter.com/Geri_Borbas
//

import UIKit


class ContentViewController_1: UIViewController {

	let viewModel = Planets().earth
	
	lazy var stackView = UIStackView().with {
		$0.axis = .vertical
		$0.spacing = 10
		[
			UILabel().with {
				$0.text = viewModel.title
				$0.textColor = .label
				$0.font = .preferredFont(forTextStyle: .largeTitle)
			},
			UILabel().with {
				$0.text = """
					size: \(viewModel.properties.size)
					distance: \(viewModel.properties.distance)
					mass: \(viewModel.properties.mass)
					"""
				$0.textColor = .systemGray
				$0.numberOfLines = 0
				$0.font = .preferredFont(forTextStyle: .headline)
			},
			UIImageView().with {
				$0.image = UIImage(named: viewModel.imageAssetName)
			},
			UILabel().with {
				$0.text = viewModel.paragraphs.first
				$0.textColor = .label
				$0.numberOfLines = 0
				$0.font = .preferredFont(forTextStyle: .footnote)
			},
			UILabel().with {
				$0.text = viewModel.paragraphs.last
				$0.textColor = .label
				$0.numberOfLines = 0
				$0.font = .preferredFont(forTextStyle: .footnote)
			},
			UIView()
		].add(to: $0)
	}
	
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
