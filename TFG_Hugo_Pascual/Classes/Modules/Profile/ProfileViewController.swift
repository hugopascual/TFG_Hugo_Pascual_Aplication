//
//  ProfileViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation
import UIKit

protocol ProfileViewProtocol: BaseViewProtocol {
	func setNavigationBar(title: String)
}

class ProfileViewController: BaseViewController {
	
	var presenter: ProfilePresenterProtocol? { return super.basePresenter as? ProfilePresenterProtocol}
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var serviceButton: UIButton!
	@IBOutlet weak var mainImageView: UIImageView!
	@IBOutlet weak var serviceTextLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func serviceButtonPressed(_ sender: Any) {
		self.presenter?.getProfile()
	}
	
}

extension ProfileViewController: ProfileViewProtocol {
	
	func setNavigationBar(title: String) {
		self.navigationBarManager?.configureNavigationBar(model: NavigationBarModel(title: title, backButton: .backArrow /*arrayLeftButtons: [.backArrow]*/, backGroundColor: CustomColor.viewHighlight.uiColor))
	}
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? ProfileViewModel else { return }
		self.titleLabel.text = model.title
		self.serviceButton.setTitle(model.serviceButtonTitle, for: .normal)
		self.mainImageView.image = UIImage(named: model.mainImage)
		self.serviceTextLabel.text = model.text
	}
}
