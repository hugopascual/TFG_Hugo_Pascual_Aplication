//  
//  ProductDetailServerModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 29/04/2021.
//

import Foundation

struct ProductDetailServerModel: BaseServerModel {
	
	var id: Int?
	var category: String?
	var model: String?
	var price: String?
	var description: String?
	var image: String?
	var owner: String?
	var status: String?
}
