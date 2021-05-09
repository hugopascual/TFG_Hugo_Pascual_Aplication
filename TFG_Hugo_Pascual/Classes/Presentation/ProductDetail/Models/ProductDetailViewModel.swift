//  
//  ProductDetailViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

final class ProductDetailViewModel: BaseViewModel {

	//TODO añadir localización
	var screenTitle: String = "çProductDetail"
	
	var buyButtonTitle: String = "çComprar"
	
	var productModel: String?
	var productImageEncoded: String?
	var productPrice: String?
	var productDescription: String?
}
