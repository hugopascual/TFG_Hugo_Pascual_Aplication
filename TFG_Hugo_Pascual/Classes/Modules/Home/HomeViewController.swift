//
//  HomeViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//

import Foundation
import UIKit

protocol HomeViewProtocol: BaseViewProtocol {

}

class HomeViewController: BaseViewController {
	
	var presenter: HomePresenterProtocol? { return super.basePresenter as? HomePresenterProtocol}
		
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var goToProfileButton: UIButton!
	@IBOutlet weak var serviceButton: UIButton!
	@IBOutlet weak var mainImageView: UIImageView!
	@IBOutlet weak var serviceTextLabel: UILabel!
	
	override func viewWillAppear(_ animated: Bool) {
		self.navigationController?.setNavigationBarHidden(true, animated: animated)
	}
	
	@IBAction func addProductButtonPressed(_ sender: Any) {
		presenter?.addProductButtonPressed()
	}
	
	@IBAction func serviceButtonPressed(_ sender: Any) {
		presenter?.getHome()
	}
}

extension HomeViewController: HomeViewProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? HomeViewModel else { return }
		self.title = model.title
		
		self.titleLabel.text = self.title
		self.goToProfileButton.setTitle(model.goToProfileButtonTitle, for: .normal)
		self.serviceButton.setTitle(model.serviceButtonTitle, for: .normal)
		self.mainImageView.image = UIImage(named: model.mainImage)
		self.serviceTextLabel.text = model.text
	}
}
