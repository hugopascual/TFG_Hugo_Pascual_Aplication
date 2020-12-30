//
//  HomeViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//

import Foundation
import UIKit

protocol HomeViewProtocol: BaseViewProtocol {
	func setView(viewModel: HomeViewModel)
}

class HomeViewController: BaseViewController {
	
	var presenter: HomePresenterProtocol? { return super.basePresenter as? HomePresenterProtocol}
		
	@IBOutlet weak var titleLabel: UILabel!
	
	@IBAction func profileNavigationBarButtonPressed(_ sender: Any) {
		presenter?.profileNavigationBarButtonPressed()
	}
	
	@IBAction func providerButtonPressed(_ sender: Any) {
		presenter?.getHome()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.presenter?.getHome()
	}
}

extension HomeViewController: HomeViewProtocol {
	
	func setView(viewModel: HomeViewModel) {
		self.titleLabel.text = viewModel.title
	}
}
