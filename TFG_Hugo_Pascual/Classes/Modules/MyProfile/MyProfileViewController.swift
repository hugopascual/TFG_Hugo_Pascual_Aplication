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
	@IBOutlet weak var welcomeLabel: UILabel!
	@IBOutlet weak var mainImageView: UIImageView!
	@IBOutlet weak var logoutButton: UIButton!
	@IBOutlet weak var myProductsButton: UIButton!
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: animated)
	}
	
	override func initializeUI() {
		super.initializeUI()
		
		self.myProductsButton.roundedByDefault()
		self.myProductsButton.setTitleColor(CustomColor.textNormal.uiColor, for: .normal)
		self.logoutButton.setTitleColor(CustomColor.textHighlighted.uiColor, for: .normal)
	}
	
	// MARK: IBActions declaration of all the controls
	@IBAction func myProductsButtonPressed(_ sender: Any) {
		self.presenter?.myProductsButtonPressed()
	}
	
	@IBAction func logoutButtonPressed(_ sender: Any) {
		self.presenter?.logoutButtonPressed()
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension MyProfileViewController: MyProfileViewProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? MyProfileViewModel else { return }
		self.title = model.screenTitle
		
		self.welcomeLabel.text = self.title
		self.mainImageView.image = UIImage(named: model.mainImage)
		self.logoutButton.setTitle(model.logoutButtonTitle, for: .normal)
		self.myProductsButton.setTitle(model.myProductsButtonTitle, for: .normal)
	}
}
