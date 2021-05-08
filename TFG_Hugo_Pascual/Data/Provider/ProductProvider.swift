//  
//  ProductProvider.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 29/04/2021.
//

import Foundation

// MARK: - Protocols
protocol ProductProviderProtocol: BaseProviderProtocol {
	func addProduct(dto: AddProductParamsDTO, success: @escaping () -> Void, failure: @escaping (CustomErrorModel) -> Void)
	func getProductList(dto: GetProductListParamsDTO, success: @escaping ([ProductsListServerModel]?) -> Void, failure: @escaping (CustomErrorModel) -> Void)
	func getProductDetail(dto: GetProductDetailParamsDTO, success: @escaping (ProductDetailServerModel?) -> Void, failure: @escaping (CustomErrorModel) -> Void)
}

// MARK: - Class
class ProductProvider: BaseProvider, ProductProviderProtocol {
	
	// MARK: Functions
	func addProduct(dto: AddProductParamsDTO, success: @escaping () -> Void, failure: @escaping (CustomErrorModel) -> Void) {
		let providerDTO = AddProductProviderRequest.getProduct(params: dto)
		
		self.genericRequest(dto: providerDTO,
							success: { _ in
								success()
							}, failure: { (error) in
								failure(error)
		})
	}
	
	func getProductList(dto: GetProductListParamsDTO, success: @escaping ([ProductsListServerModel]?) -> Void, failure: @escaping (CustomErrorModel) -> Void) {
		let providerDTO = GetProductListProviderRequest.getProduct(params: dto)
		
		self.genericRequest(dto: providerDTO,
						 success: { (data) in
								let serverModel = BaseProvider.parseArrayToServerModel(parserModel: [ProductsListServerModel].self, data: data as? Data)
								success(serverModel)
						 }, failure: { (error) in
								failure(error)
		})
	}
	
	func getProductDetail(dto: GetProductDetailParamsDTO, success: @escaping (ProductDetailServerModel?) -> Void, failure: @escaping (CustomErrorModel) -> Void) {
		let providerDTO = GetProductDetailProviderRequest.getProduct(params: dto)
		
		self.genericRequest(dto: providerDTO,
						 success: { (data) in
								let serverModel = BaseProvider.parseToServerModel(parserModel: ProductDetailServerModel.self, data: data as? Data)
								success(serverModel)
						 }, failure: { (error) in
								failure(error)
		})
	}
}

// MARK: - Structs
struct AddProductParamsDTO: BaseProviderParamsDTO {
	var category: String?
	var model: String?
	var price: String?
	var description: String?
	var image: String?
	var owner: String?
}

struct AddProductProviderRequest {
	
	static func getProduct(params: BaseProviderParamsDTO?) -> ProviderDTO {
		return ProviderDTO(params: params?.encode(),
						   method: .post,
						   urlContext: .backend,
						   endpoint: URLEndpoint.addProduct)
	}
}

struct GetProductListParamsDTO: BaseProviderParamsDTO {
	var category: String
}

struct GetProductListProviderRequest {
	
	static func getProduct(params: GetProductListParamsDTO?) -> ProviderDTO {
		return ProviderDTO(params: params?.encode(),
						   method: .get,
						   urlContext: .local,
						   endpoint: URLEndpoint.getProductList)
	}
}

struct GetProductDetailParamsDTO: BaseProviderParamsDTO {
	var id: Int
}

struct GetProductDetailProviderRequest {

	static func getProduct(params: BaseProviderParamsDTO?) -> ProviderDTO {
		return ProviderDTO(params: params?.encode(),
						   method: .get,
						   urlContext: .backend,
						   endpoint: URLEndpoint.getProductDetail)
	}
}
