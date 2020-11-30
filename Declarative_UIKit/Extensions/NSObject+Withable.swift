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
	
	/// Provides a closure with the instance called immediately, then returns the instance.
	/// - Parameter closure: The closure with the instance.
	@discardableResult func with(_ closure: (_ instance: T) -> Void) -> T
}


extension Withable {
	
	@discardableResult func with(_ closure: (_ instance: Self) -> Void) -> Self {
		closure(self)
		return self
	}
}


extension NSObject: Withable { }
