//  
//  ProductDetailViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

final class ProductDetailViewModel: BaseViewModel {

	var screenTitle: String = LocalizedKeys.ProductDetail.product_detail
	
	var buyButtonTitle: String = LocalizedKeys.Common.buy
	var deleteButtonTitle: String = LocalizedKeys.Common.delete
	
	var deleteProductSucess: String = LocalizedKeys.ProductDetail.delete_sucess
	var deleteProductError: String = LocalizedKeys.Common.error_message
		
	var productModel: String?
	var productImageEncoded: String?
	var productPrice: String?
	var productDescription: String?
}
