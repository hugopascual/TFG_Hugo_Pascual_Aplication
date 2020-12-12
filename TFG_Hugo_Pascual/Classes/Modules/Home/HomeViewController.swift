//
//  HomeViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//

import Foundation

protocol HomeViewProtocol: BaseViewProtocol {
	
}

class HomeViewController: BaseViewController {
	
	var presenter: HomePresenterProtocol? { return super.basePresenter as? HomePresenterProtocol}
		
	@IBAction func profileNavigationBarButtonPressed(_ sender: Any) {
		presenter?.profileNavigationBarButtonPressed()
	}
	
}

extension HomeViewController: HomeViewProtocol {
	
}
