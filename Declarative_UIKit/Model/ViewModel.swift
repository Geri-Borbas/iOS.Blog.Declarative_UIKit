//
//  Data.swift
//  Declarative_UIKit
//
//  Created by Geri Borbás on 29/11/2020.
//  http://www.twitter.com/Geri_Borbas
//

import Foundation


struct ViewModel {
	
	let earth = (
		title: "Earth",
		properties: (
			size: "6,378 km",
			distance: "1.0 AU",
			mass: "5.972 × 10²⁴ kg"
		),
		imageAssetName: "Earth",
		paragraphs: [
			"Earth is the third planet from the Sun and the only astronomical object known to harbor life. About 29% of Earth's surface is land consisting of continents and islands. The remaining 71% is covered with water, mostly by oceans but also lakes, rivers and other fresh water, which together constitute the hydrosphere.",
			"Much of Earth's polar regions are covered in ice. Earth's outer layer is divided into several rigid tectonic plates that migrate across the surface over many millions of years."
		]
	)
}
