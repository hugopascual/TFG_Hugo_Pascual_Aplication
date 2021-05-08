//  
//  ProductsListViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

final class ProductsListViewModel: BaseViewModel {

	//TODO añadir localización
	var screenTitle: String = "çProductsList"
	
	var productCells: [ProductsListCellViewModel] = []
	
	override init() { super.init() }
	
	required init(businessModel: BaseBusinessModel?) {
		super.init(businessModel: businessModel)
		
		guard let model = businessModel as? ProductBusinessModel else { return }
		self.productCells.append(ProductsListCellViewModel(id: model.id,
														   image: model.base64Image,
														   title: model.model,
														   price: model.price))
	}
}
