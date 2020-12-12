//
//  ProfileViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation

protocol ProfileViewProtocol: BaseViewProtocol {
	
}

class ProfileViewController: BaseViewController {
	
	var presenter: ProfilePresenterProtocol? { return super.basePresenter as? ProfilePresenterProtocol}
	
	@IBAction func homeNavigationBarButtonPressed(_ sender: Any) {
		presenter?.homeNavigationBarButtonPressed()
	}
}

extension ProfileViewController: ProfileViewProtocol {
	
}
