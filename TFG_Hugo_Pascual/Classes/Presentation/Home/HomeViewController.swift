//
//  HomeViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//

import Foundation
import UIKit

protocol HomeViewProtocol: BaseViewControllerProtocol {
	
}

class HomeViewController: BaseViewController {
	
	// MARK: VIPER Dependencies
	var presenter: HomePresenterProtocol? { return super.basePresenter as? HomePresenterProtocol}
		
	// MARK: IBOutlets declaration of all controls
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var goToProductDetailButton: UIButton!
	@IBOutlet weak var mainImageView: UIImageView!
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: animated)
	}
	
	// MARK: IBActions declaration of all the controls
	@IBAction func productDetailButtonPressed(_ sender: Any) {
		presenter?.productDetailButtonPressed()
	}
	
	// MARK: Private Functions
	
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension HomeViewController: HomeViewProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? HomeViewModel else { return }
		self.title = model.screenTitle
		
		self.titleLabel.text = self.title
		self.goToProductDetailButton.setTitle(model.goToProfileButtonTitle, for: .normal)
		self.mainImageView.image = UIImage(named: model.mainImage)
	}
}
