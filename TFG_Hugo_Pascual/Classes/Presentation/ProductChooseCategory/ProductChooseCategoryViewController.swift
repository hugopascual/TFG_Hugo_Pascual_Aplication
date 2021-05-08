//  
//  ProductChooseCategoryViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 27/04/2021.
//

import Foundation
import UIKit

protocol ProductChooseCategoryViewControllerProtocol: BaseViewControllerProtocol {
	
}

final class ProductChooseCategoryViewController: BaseViewController {
	
	// MARK: VIPER Dependencies
	var presenter: ProductChooseCategoryPresenterProtocol? { return super.basePresenter as? ProductChooseCategoryPresenterProtocol }
		
	// MARK: IBOutlets declaration of all controls
	@IBOutlet weak var categoryTableView: UITableView!
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.categoryTableView.dataSource = self
		self.categoryTableView.delegate = self
		
		self.registerTableViewCells()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.setNavigationBar()
	}
	
	override func initializeUI() {
		
	}
	
	// MARK: IBActions declaration of all the controls
	
	// MARK: Private Functions
	private func registerTableViewCells() {
		let textFieldCell = UINib(nibName: NibName.productsHomeCategoryCell.rawValue,
								  bundle: nil)
		self.categoryTableView.register(textFieldCell,
								forCellReuseIdentifier: NibName.productsHomeCategoryCell.rawValue)
	}
	
	func setNavigationBar() {
		self.navigationBarManager?.configureNavigationBar(model: NavigationBarModel(title: self.title))
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductChooseCategoryViewController: ProductChooseCategoryViewControllerProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? ProductChooseCategoryViewModel else { return }
		self.title = model.screenTitle
	}
}

extension ProductChooseCategoryViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.presenter?.didRowPressed(index: indexPath.row)
	}
}

extension ProductChooseCategoryViewController: UITableViewDataSource {
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
