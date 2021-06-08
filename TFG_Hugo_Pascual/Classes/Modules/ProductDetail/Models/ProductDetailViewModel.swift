//  
//  ProductDetailViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

final class ProductDetailViewModel: BaseViewModel {

	var screenTitle: String = LocalizedKeys.ProductDetail.product_detail
	
	var productModel: String?
	var productImageEncoded: String?
	var productPrice: String?
	var productDescription: String?
	
	var ownerContactTitle: String = LocalizedKeys.ProductDetail.seller_contact
	var ownerContactEmail: String?
	
	var deleteButtonTitle: String = LocalizedKeys.Common.delete
	
	var deleteProductSucess: String = LocalizedKeys.ProductDetail.delete_sucess
	var deleteProductError: String = LocalizedKeys.Common.error_message
}
