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
	@IBOutlet weak var mainImageView: UIImageView!
	@IBOutlet weak var tfgNameLabel: UILabel!
	@IBOutlet weak var authorNameLabel: UILabel!
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: animated)
	}
	
	// MARK: IBActions declaration of all the controls
	@IBAction func auxButtonPressed(_ sender: Any) {
		presenter?.auxButtonPressed()
	}
	
	// MARK: Private Functions
	
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension HomeViewController: HomeViewProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? HomeViewModel else { return }

		self.mainImageView.image = UIImage(named: model.mainImage)
		self.tfgNameLabel.text = model.tfgTitle
		self.authorNameLabel.text = model.authorName
	}
}
