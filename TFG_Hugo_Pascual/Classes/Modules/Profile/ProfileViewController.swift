//
//  ProfileViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation
import UIKit

protocol ProfileViewProtocol: BaseViewProtocol {

}

class ProfileViewController: BaseViewController {
	
	var presenter: ProfilePresenterProtocol? { return super.basePresenter as? ProfilePresenterProtocol}
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var serviceButton: UIButton!
	@IBOutlet weak var mainImageView: UIImageView!
	@IBOutlet weak var serviceTextLabel: UILabel!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: animated)
	}
	
	@IBAction func serviceButtonPressed(_ sender: Any) {
		self.presenter?.getProfile()
	}
}

extension ProfileViewController: ProfileViewProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? ProfileViewModel else { return }
		self.title = model.title
		
		self.titleLabel.text = self.title
		self.serviceButton.setTitle(model.serviceButtonTitle, for: .normal)
		self.mainImageView.image = UIImage(named: model.mainImage)
		self.serviceTextLabel.text = model.text
	}
}
