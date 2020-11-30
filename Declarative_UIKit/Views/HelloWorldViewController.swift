//
//  HelloWorldViewController.swift
//  Declarative_UIKit
//
//  Created by Geri Borbás on 29/11/2020.
//  http://www.twitter.com/Geri_Borbas
//

import UIKit


class HelloWorldViewController: UIViewController {
		
	var onFinish: () -> Void = {}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Views.
		let label = UILabel()
		label.text = "Hello World!"
		label.textColor = .label
		label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
		
		// Hierarchy.
		view.addSubview(label)
		
		// Constraints.
		label.translatesAutoresizingMaskIntoConstraints = false
		label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
		label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
		label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
	}
}


class HelloWorldViewController_2: UIViewController {
		
	// MARK: Views
	
	let label: UILabel = {
		let label = UILabel()
		label.text = "Hello World!"
		label.textColor = .label
		label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
		return label
	}()
	
	// MARK: Initialization
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Hierarchy.
		view.addSubview(label)
		
		// Constraints.
		label.translatesAutoresizingMaskIntoConstraints = false
		label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
		label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
		label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
	}
}


class HelloWorldViewController_3: UIViewController {
		
	// MARK: Views
	
	let label = UILabel().with {
		$0.text = "Hello World!"
		$0.textColor = .label
		$0.font = UIFont.preferredFont(forTextStyle: .largeTitle)
	}
	
	// MARK: Initialization
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Hierarchy.
		view.addSubview(label)
		
		// Constraints.
		label.translatesAutoresizingMaskIntoConstraints = false
		label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
		label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
		label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
	}
}


fileprivate extension UILabel {
	
	func with(_ closure: (UILabel) -> Void) -> UILabel {
		closure(self)
		return self
	}
}
