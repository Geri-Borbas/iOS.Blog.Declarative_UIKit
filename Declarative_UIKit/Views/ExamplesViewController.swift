//
//  ExamplesViewController.swift
//  Declarative_UIKit
//
//  Created by Geri Borbás on 30/11/2020.
//

import UIKit


class ExamplesViewController: UIViewController {
	
	private let label = UILabel().with {
		$0.text = "Hello World!"
		$0.textColor = .label
		$0.font = .preferredFont(forTextStyle: .largeTitle)
	}
	
	private lazy var submitButton = UIButton().with {
		$0.setTitle("Submit", for: .normal)
		$0.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
	}
	
	private lazy var displayLink = CADisplayLink(
		target: self,
		selector: #selector(update)
	).with {
		$0.isPaused = true
		$0.preferredFramesPerSecond = 120
		$0.add(to: RunLoop.main, forMode: .common)
	}
	
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
	
	@objc func didTapSubmitButton() {
		present(TitleLabelViewController().with {
			$0.modalTransitionStyle = .crossDissolve
			$0.modalPresentationStyle = .overCurrentContext
		}, animated: true)
	}
	
	@objc func update() { }
	
	func alert() {
		
		let title = ""
		let message = ""
		
		present(UIAlertController(
			title: title,
			message: message,
			preferredStyle: .alert
		).with {
			$0.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
		}, animated: true)
	}
	
	func date() {
		let _ = DateFormatter().with {
			$0.dateStyle = .medium
			$0.locale = Locale(identifier: "en_US")
		}.string(from: Date())
	}
	
	func compound() {
		present(UIAlertController(title: "Select file", message: nil, preferredStyle: .actionSheet).with {
			if UIImagePickerController.isSourceTypeAvailable(.camera) {
				$0.addAction(UIAlertAction(title: "From camera", style: .default) { _ in
					self.present(UIImagePickerController().with {
						$0.delegate = self
						$0.sourceType = .camera
						$0.cameraCaptureMode = .photo
					}, animated: true)
				})
			}
			if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
				$0.addAction(UIAlertAction(title: "From library", style: .default) { _ in
					self.present(UIImagePickerController().with {
						$0.delegate = self
						$0.sourceType = .photoLibrary
					}, animated: true)
				})
			}
			$0.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
		}, animated: true)
	}
}


extension ExamplesViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) { }
}
