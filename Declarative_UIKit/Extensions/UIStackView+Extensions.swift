//
//  UIStackView+Extensions.swift
//  Declarative_UIKit
//
//  Created by Geri Borbás on 29/11/2020.
//  http://www.twitter.com/Geri_Borbas
//

import UIKit


extension UIStackView {
	
	func views(_ views: UIView ...) {
		views.forEach { addArrangedSubview($0) }
	}
	
	var horizontal: UIStackView {
		with {
			$0.axis = .horizontal
		}
	}
	
	func horizontal(spacing: CGFloat) -> UIStackView {
		with {
			$0.axis = .horizontal
			$0.spacing = spacing
		}
	}
	
	var vertical: UIStackView {
		with {
			$0.axis = .vertical
		}
	}
	
	func vertical(spacing: CGFloat) -> UIStackView {
		with {
			$0.axis = .vertical
			$0.spacing = spacing
		}
	}
	
	func withViews(_ views: UIView ...) -> UIStackView {
		views.forEach { self.addArrangedSubview($0) }
		return self
	}
}
