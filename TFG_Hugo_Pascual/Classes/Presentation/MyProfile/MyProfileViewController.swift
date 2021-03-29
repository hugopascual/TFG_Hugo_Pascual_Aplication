//
//  MyProfileViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation
import UIKit

protocol MyProfileViewProtocol: BaseViewControllerProtocol {

}

class MyProfileViewController: BaseViewController {
	
	// MARK: VIPER Dependencies
	var presenter: MyProfilePresenterProtocol? { return super.basePresenter as? MyProfilePresenterProtocol}
	
	// MARK: IBOutlets declaration of all controls
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var mainImageView: UIImageView!
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: animated)
	}
	
	// MARK: IBActions declaration of all the controls
	
	@IBAction func logoutButtonPressed(_ sender: Any) {
		self.presenter?.logoutButtonPressed()
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension MyProfileViewController: MyProfileViewProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? MyProfileViewModel else { return }
		self.title = model.screenTitle
		
		self.titleLabel.text = self.title
		self.mainImageView.image = UIImage(named: model.mainImage)
	}
}
