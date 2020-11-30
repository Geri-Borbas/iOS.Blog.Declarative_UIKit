//
//  NSObject+Withable.swift
//  Declarative_UIKit
//
//  Created by Geri Borbás on 28/11/2020.
//  http://www.twitter.com/Geri_Borbas
//

import Foundation


protocol Withable {
	
	associatedtype T
	
	/// Provides a closure to configure instances inline.
	/// - Parameter closure: A closure `self` as the argument.
	/// - Returns: Simply returns the instance after called the `closure`.
	@discardableResult func with(_ closure: (_ instance: T) -> Void) -> T
}


extension Withable {
	
	@discardableResult func with(_ closure: (_ instance: Self) -> Void) -> Self {
		closure(self)
		return self
	}
}


extension NSObject: Withable { }
