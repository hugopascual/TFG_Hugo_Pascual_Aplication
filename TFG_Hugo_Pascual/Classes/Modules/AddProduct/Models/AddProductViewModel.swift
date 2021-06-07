//  
//  AddProductViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

final class AddProductViewModel: BaseViewModel {

	var screenTitle: String = LocalizedKeys.AddProduct.add_product
	
	var categoryTitle: String = LocalizedKeys.AddProduct.category_section_title
	var categoryDescription: String = LocalizedKeys.AddProduct.no_category_choosen
	var categoryImage: String = ImagesNamesConstants.no_category_icon
	var categoryButtonTitle: String = LocalizedKeys.AddProduct.choose_category
	var modelTitle: String = LocalizedKeys.AddProduct.model_section_title
	var priceTitle: String = LocalizedKeys.AddProduct.price_section_title
	var descriptionTitle: String = LocalizedKeys.AddProduct.description_section_title
	var attachImageButtonTitle: String = LocalizedKeys.AddProduct.attach_image_button_title
	var nonAttachedImage: String = LocalizedKeys.AddProduct.no_attached_image
	var attachedImage: String = LocalizedKeys.AddProduct.attached_image
	var addProductButtonTitle: String = LocalizedKeys.AddProduct.add_product
	var addProductSucess: String = LocalizedKeys.AddProduct.sucess
}
