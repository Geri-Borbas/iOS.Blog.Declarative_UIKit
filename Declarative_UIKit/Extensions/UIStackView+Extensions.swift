//
//  UIStackView+Extensions.swift
//  Declarative_UIKit
//
//  Created by Geri Borbás on 29/11/2020.
//  http://www.twitter.com/Geri_Borbas
//

import UIKit


extension UIStackView {
	
	func horizontal(spacing: CGFloat = 0) -> UIStackView {
		with {
			$0.axis = .horizontal
			$0.spacing = spacing
		}
	}
	
	func vertical(spacing: CGFloat = 0) -> UIStackView {
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
