//
//  ImperativeViewController.swift
//  Declarative_UIKit
//
//  Created by Geri Borbás on 29/11/2020.
//  http://www.twitter.com/Geri_Borbas
//

import UIKit


class ImperativeViewController: UIViewController {

	// MARK: Properties
	
	let viewModel = ViewModel()
	
	// MARK: Views
	
	private let titleLabel = UILabel()
	private let propertiesLabel = UILabel()
	private let imageView = UIImageView()
	private let firstParagraphLabel = UILabel()
	private let lastParagraphLabel = UILabel()
	
	
	// MARK: Initialization
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		// Setup.
		titleLabel.text = viewModel.earth.title
		titleLabel.textColor = .label
		titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
		
		propertiesLabel.text = """
			size: \(viewModel.earth.properties.size)
			distance: \(viewModel.earth.properties.distance)
			mass: \(viewModel.earth.properties.mass)
			"""
		propertiesLabel.textColor = .systemGray
		propertiesLabel.numberOfLines = 0
		propertiesLabel.font = UIFont.preferredFont(forTextStyle: .headline)
		
		imageView.image = UIImage(named: viewModel.earth.imageAssetName)
		
		firstParagraphLabel.text = viewModel.earth.paragraphs.first
		firstParagraphLabel.textColor = .label
		firstParagraphLabel.numberOfLines = 0
		firstParagraphLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
		
		lastParagraphLabel.text = viewModel.earth.paragraphs.last
		lastParagraphLabel.textColor = .label
		lastParagraphLabel.numberOfLines = 0
		lastParagraphLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
				
		// Red lines.
		titleLabel.addRedLines()
		propertiesLabel.addRedLines()
		imageView.addRedLines()
		firstParagraphLabel.addRedLines()
		lastParagraphLabel.addRedLines()
		
		// Hierarchy.
		view.addSubview(titleLabel)
		view.addSubview(propertiesLabel)
		view.addSubview(imageView)
		view.addSubview(firstParagraphLabel)
		view.addSubview(lastParagraphLabel)
		
		// Constraints.
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		propertiesLabel.translatesAutoresizingMaskIntoConstraints = false
		imageView.translatesAutoresizingMaskIntoConstraints = false
		firstParagraphLabel.translatesAutoresizingMaskIntoConstraints = false
		lastParagraphLabel.translatesAutoresizingMaskIntoConstraints = false
		
		view.addConstraints([
			
			titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30),
			titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30),
			
			propertiesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
			propertiesLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30),
			propertiesLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30),
			
			imageView.topAnchor.constraint(equalTo: propertiesLabel.bottomAnchor, constant: 10),
			imageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30),
			imageView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30),
			
			firstParagraphLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
			firstParagraphLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30),
			firstParagraphLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30),
			
			lastParagraphLabel.topAnchor.constraint(equalTo: firstParagraphLabel.bottomAnchor, constant: 10),
			lastParagraphLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30),
			lastParagraphLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30)
		])
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


// MARK: - Previews

import SwiftUI

struct ImperativeViewController_Previews: PreviewProvider {
	static var previews: some View {
		PreviewView(for: ImperativeViewController())
			.environment(\.colorScheme, .dark)
			.edgesIgnoringSafeArea(.all)
	}
}
