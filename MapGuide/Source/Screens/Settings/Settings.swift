//
//  Settings.swift
//  MapGuide
//
//  Created by Evgeniy Opryshko on 03/03/2019.
//  Copyright © 2019 Nugumanov Dmitry. All rights reserved.
//

import UIKit

class Settings: UITableViewController {
	
	
	//MARK: UIViewController lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		Decorator.decorate(self)
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		
	}
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		
		switch (indexPath.section, indexPath.row) {
		case (0,0):
			cell.textLabel?.text = "Язык"
			cell.detailTextLabel?.textColor = .gray
			
			switch Locale.deviceLanguage {
			case "uk":
				cell.detailTextLabel?.text = "Українськa"
			case "en":
				cell.detailTextLabel?.text = "English"
			case "ru":
				cell.detailTextLabel?.text = "Русский"
				
			default:
				cell.detailTextLabel?.text = ""
			}
			
			
		case (1,0):
			cell.textLabel?.text = "О программе"
		default:
			print("Default")
		}
		
	}
	
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(indexPath)
		
//		switch (indexPath.section, indexPath.row) {
//		case (1,0):
//			print("1")
//
//
//		default:
//			print("Default")
//		}
		
		tableView.deselectRow(at: indexPath, animated: true)
		
	}
	
}

extension Settings {
	fileprivate class Decorator {
		private init () {}
		
		static func decorate(_ vc: Settings) {
			vc.tableView.backgroundColor = #colorLiteral(red: 0.9371530414, green: 0.9373135567, blue: 0.9371429086, alpha: 1)
			vc.tableView.tableFooterView = UIView(frame: .zero)
			
//            vc.title = "Настройки"
		
			let backItem = UIBarButtonItem()
			backItem.title = " "
			vc.navigationItem.backBarButtonItem = backItem
		}
	}
}
