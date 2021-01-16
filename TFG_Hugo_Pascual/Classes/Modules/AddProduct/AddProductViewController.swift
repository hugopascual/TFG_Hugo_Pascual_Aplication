//
//  AddProductViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 14/01/2021.
//

import Foundation
import UIKit

protocol AddProductViewProtocol: BaseViewProtocol {
	func setViewModel(_ viewModel: Any)
}

class AddProductViewController: BaseViewController {
	
	var presenter: AddProductPresenterProtocol? { return super.basePresenter as? AddProductPresenterProtocol}
	
	@IBOutlet weak var titleLabel: UILabel!
}

extension AddProductViewController: AddProductViewProtocol {

	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? AddProductViewModel else { return }
		self.title = model.title
		
		self.titleLabel.text = self.title
	}
}
