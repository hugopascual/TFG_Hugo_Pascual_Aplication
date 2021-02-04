//
//  ProductDetailViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 16/01/2021.
//

import Foundation
import UIKit

protocol ProductDetailViewProtocol: BaseViewControllerProtocol {
	func setViewModel(_ viewModel: Any)
}

class ProductDetailViewController: BaseViewController {
	
	var presenter: ProductDetailPresenterProtocol? { return super.basePresenter as? ProductDetailPresenterProtocol}
	
	@IBOutlet weak var titleLabel: UILabel!
}

extension ProductDetailViewController: ProductDetailViewProtocol {

	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? ProductDetailViewModel else { return }
		self.title = model.title
		
		self.titleLabel.text = self.title
	}
}
