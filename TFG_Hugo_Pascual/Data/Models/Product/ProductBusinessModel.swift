//  
//  ProductBusinessModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 29/04/2021.
//

import Foundation

class ProductBusinessModel: BaseBusinessModel {
	
	var id: String?
	var category: ProductCategory?
	var model: String?
	var price: String?
	var description: String?
	var base64Image: String?
	var owner: UserBusinessModel?
	var status: ProductStatus?
	
	required init(serverModel: BaseServerModel?) {
		super.init(serverModel: serverModel)
		
		guard let serverModel = serverModel as? ProductDetailServerModel else { return }
		
		self.id = serverModel.id
		self.category = serverModel.category.map { ProductCategory(rawValue: $0) } as? ProductCategory
		self.model = serverModel.model
		self.price = serverModel.price
		self.description = serverModel.description
		self.base64Image = serverModel.image
		self.owner?.username = serverModel.owner
		self.status = serverModel.status.map { ProductStatus(rawValue: $0) } as? ProductStatus
	}
	
	override init() { super.init() }
}
