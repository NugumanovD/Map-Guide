//
//  Language.swift
//  MapGuide
//
//  Created by Evgeniy Opryshko on 03/03/2019.
//  Copyright © 2019 Nugumanov Dmitry. All rights reserved.
//

import Foundation

enum Language: String {

	case none = ""
	case ua = "Українськa"
	case en = "English"
	case ru = "Русский"
	
}

extension Locale {
	
	static let prefferedLanguage = Locale.preferredLanguages[0] as String
	static let arr = prefferedLanguage.components(separatedBy: "-")
	static let deviceLanguage = arr.first
	
	
}
