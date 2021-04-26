//  
//  ProductsHomeViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/04/2021.
//

import Foundation
import UIKit

protocol ProductsHomeViewControllerProtocol: BaseViewControllerProtocol {
	
}

final class ProductsHomeViewController: BaseViewController {
	
	// MARK: VIPER Dependencies
	var presenter: ProductsHomePresenterProtocol? { return super.basePresenter as? ProductsHomePresenterProtocol }
		
	// MARK: IBOutlets declaration of all controls
	@IBOutlet weak var addProductButton: UIButton!
	
	@IBOutlet weak var productCategoriesTableView: UITableView!
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func viewWillAppear(_ animated: Bool) {
		self.navigationController?.setToolbarHidden(true, animated: animated)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.productCategoriesTableView.dataSource = self
		self.productCategoriesTableView.delegate = self
		
		self.registerTableViewCells()
		
		self.initializeUI()
	}
	
	override func initializeUI() {
		self.addProductButton.roundedByDefault()
	}
	
	// MARK: IBActions declaration of all the controls
	@IBAction func addProductButtonPressed(_ sender: Any) {
		self.presenter?.addProductButtonPressed()
	}
	
	// MARK: Private Functions
	private func registerTableViewCells() {
		let textFieldCell = UINib(nibName: NibName.productsHomeCategoryCell.rawValue,
								  bundle: nil)
		self.productCategoriesTableView.register(textFieldCell,
								forCellReuseIdentifier: NibName.productsHomeCategoryCell.rawValue)
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductsHomeViewController: ProductsHomeViewControllerProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? ProductsHomeViewModel else { return }
		self.title = model.screenTitle
		
		self.addProductButton.setTitle(model.addProductButtonTitle, for: .normal)
	}
}

extension ProductsHomeViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.presenter?.didRowPressed(index: indexPath.row)
	}
}

extension ProductsHomeViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.presenter?.getCellsNumber() ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: NibName.productsHomeCategoryCell.rawValue) as? ProductsHomeCategoryCell {
			cell.setUpCellViewModel(model: self.presenter?.getCellViewModelForIndex(index: indexPath.row) ?? ProductsHomeCategoryCellViewModel())
			return cell
		}
		return UITableViewCell()
	}
}
