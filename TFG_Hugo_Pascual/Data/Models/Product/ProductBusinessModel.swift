//  
//  ProductBusinessModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 29/04/2021.
//

import Foundation

class ProductBusinessModel: BaseBusinessModel {
	
	var id: Int?
	var category: ProductCategory?
	var model: String?
	var price: String?
	var description: String?
	var base64Image: String?
	var owner: UserBusinessModel?
	var status: ProductStatus?
	
	required init(serverModel: BaseServerModel?) {
		super.init(serverModel: serverModel)
		
		switch serverModel {
		case let model as ProductDetailServerModel:
			self.initWithProductDetailServerModel(serverModel: model)
		case let model as ProductsListServerModel:
			self.initWithProductsListServerModel(serverModel: model)
		default:
			return
		}
	}
	
	override init() { super.init() }
	
	func initWithProductDetailServerModel(serverModel: ProductDetailServerModel) {
		self.id = serverModel.id
		self.category = serverModel.category.map { ProductCategory(rawValue: $0) } as? ProductCategory
		self.model = serverModel.model
		self.price = serverModel.price
		self.description = serverModel.description
		self.base64Image = serverModel.image
		self.owner?.username = serverModel.owner
		self.status = serverModel.status.map { ProductStatus(rawValue: $0) } as? ProductStatus
	}
	
	func initWithProductsListServerModel(serverModel: ProductsListServerModel) {
		self.id = serverModel.id
		self.model = serverModel.model
		self.price = serverModel.price
		self.base64Image = serverModel.image
		
	}
}
