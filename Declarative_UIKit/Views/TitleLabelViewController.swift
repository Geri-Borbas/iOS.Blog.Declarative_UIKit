//
//  TitleLabelViewController.swift
//  Declarative_UIKit
//
//  Created by Geri Borbás on 29/11/2020.
//  http://www.twitter.com/Geri_Borbas
//

import UIKit


class TitleLabelViewController: UIViewController {
	
	// MARK: Properties
	
	let viewModel = Planets()
	
	// MARK: Initialization and Views
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let titleLabel = UILabel()
		titleLabel.text = viewModel.earth.title
		titleLabel.textColor = .label
		titleLabel.font = .preferredFont(forTextStyle: .largeTitle)
		
		view.addSubview(titleLabel)
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
		titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
		titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
	}
}


class TitleLabelViewController_2: UIViewController {
	
	// MARK: Properties
	
	let viewModel = Planets()
	
	// MARK: Views
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.text = viewModel.earth.title
		label.textColor = .label
		label.font = .preferredFont(forTextStyle: .largeTitle)
		return label
	}()
	
	// MARK: Initialization
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(titleLabel)
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
		titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
		titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
	}
}


class TitleLabelViewController_3: UIViewController {
	
	let viewModel = Planets().earth
	
	lazy var titleLabel = UILabel().with {
		$0.text = viewModel.title
		$0.textColor = .label
		$0.font = .preferredFont(forTextStyle: .largeTitle)
	}
	
	// MARK: Initialization
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Hierarchy.
		view.addSubview(titleLabel)
		
		// Constraints.
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
		titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
		titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
	}
}


fileprivate extension UILabel {
	
	func with(_ closure: (UILabel) -> Void) -> UILabel {
		closure(self)
		return self
	}
}
