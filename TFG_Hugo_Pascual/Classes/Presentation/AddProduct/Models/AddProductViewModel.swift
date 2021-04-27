//  
//  AddProductViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

final class AddProductViewModel: BaseViewModel {

	//TODO añadir localización
	var screenTitle: String = "çAddProduct"
	
	var categoryTitle: String = "çCategoría"
	var categoryDescription: String = "çSin categoría"
	var categoryImage: String = ImagesNamesConstants.no_category_icon
	var categoryButtonTitle: String = "çEditar"
	var modelTitle: String = "çModelo"
	var priceTitle: String = "çPrecio"
	var descriptionTitle: String = "çDescripción (max 500 caracteres)"
	var attachImageButtonTitle: String = "çAdjuntar imagen"
	var addProductButtonTitle: String = "çAñadir productoß"
}
