//  
//  ProductsListViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation
import UIKit

protocol ProductsListViewControllerProtocol: BaseViewControllerProtocol {
	
}

final class ProductsListViewController: BaseViewController {
	
	// MARK: VIPER Dependencies
	var presenter: ProductsListPresenterProtocol? { return super.basePresenter as? ProductsListPresenterProtocol }
		
	// MARK: IBOutlets declaration of all controls
	@IBOutlet weak var productsListTableView: UITableView!
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.setNavigationBar()
		
		self.productsListTableView.dataSource = self
		self.productsListTableView.delegate = self
		
		self.registerTableViewCells()
	}

	override func initializeUI() {
		
	}
	
	// MARK: IBActions declaration of all the controls
	
	// MARK: Private Functions
	func setNavigationBar() {
		self.navigationBarManager?.configureNavigationBar(model: NavigationBarModel(title: self.title))
	}
	
	private func registerTableViewCells() {
		let textFieldCell = UINib(nibName: NibName.productsListCell.rawValue,
								  bundle: nil)
		self.productsListTableView.register(textFieldCell,
								forCellReuseIdentifier: NibName.productsListCell.rawValue)
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductsListViewController: ProductsListViewControllerProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? ProductsListViewModel else { return }
		self.title = model.screenTitle
	}
}

extension ProductsListViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.presenter?.didRowPressed(index: indexPath.row)
	}
}

extension ProductsListViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.presenter?.getCellsNumber() ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: NibName.productsListCell.rawValue) as? ProductsListCell {
			cell.configureCell(viewModel: self.presenter?.getCellViewModelForIndex(index: indexPath.row) ?? ProductsListCellViewModel())
			return cell
		}
		return UITableViewCell()
	}
}
