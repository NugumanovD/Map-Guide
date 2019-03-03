//
//  SettingsLanguage.swift
//  MapGuide
//
//  Created by Evgeniy Opryshko on 03/03/2019.
//  Copyright © 2019 Nugumanov Dmitry. All rights reserved.
//

import UIKit

class SettingsLanguage: UITableViewController {

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		Decorator.decorate(self)
		
	}
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		
		switch (indexPath.section, indexPath.row) {
		case (0,0):
			cell.textLabel?.text = Language.ua.rawValue
		case (0,1):
			cell.textLabel?.text = Language.en.rawValue
		case (0,2):
			cell.textLabel?.text = Language.ru.rawValue
			cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
		default:
			print("Default")
		}
		
	}
	
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
//		let cell = self.tableView.cellForRow(at: indexPath)
//		guard let tit = cell?.textLabel?.text else {
//			return
//		}
//		checkCurrentLanguege(titel: tit)
		
		switch (indexPath.section, indexPath.row) {
		case (0,0):
			checkCurrentLanguege(titel: "uk")
		case (0,1):
			checkCurrentLanguege(titel: "en")
		case (0,2):
			checkCurrentLanguege(titel: "ru")
		default:
			print("Default")
		}
		
		
		
		tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
		
		
		tableView.deselectRow(at: indexPath, animated: true)
		
	}
	
	override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
		//tableView.cellForRow(at: indexPath)?.accessoryType = .none
	}
	
	
	func alert() {
	
		switch Locale.deviceLanguage {
		case "ua":
			alert(message: "Будь ласка, перезапустіть пристрій, щоб нові налаштування вступили в силу.")
		case "en":
			alert(message: "Please restart the application for the new settings to take effect.")
		case "ru":
			alert(message: "Пожалуйста, перезапустите приложение, чтобы новые настройки вступили в силу.")
			
		default:
			alert(message: "Please restart the application for the new settings to take effect.")
		}
	
	}

	func checkCurrentLanguege(titel: String) {
		if Locale.deviceLanguage == titel {
				return
			}
		alert()
	}
	
}


extension SettingsLanguage {
	fileprivate class Decorator {
		private init () {}
		
		static func decorate(_ vc: SettingsLanguage) {
			vc.tableView.backgroundColor = #colorLiteral(red: 0.9371530414, green: 0.9373135567, blue: 0.9371429086, alpha: 1)
			vc.tableView.tableFooterView = UIView(frame: .zero)
			
			vc.title = "Язык"
			
		}
	}
}
