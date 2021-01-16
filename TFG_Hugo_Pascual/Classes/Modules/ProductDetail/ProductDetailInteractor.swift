//
//  ProductDetailInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 16/01/2021.
//

import Foundation

protocol ProductDetailInteractorInputProtocol: BaseInteractorInputProtocol {

}

class ProductDetailInteractor: BaseInteractor {
	
	weak var presenter: ProductDetailInteractorOutputProtocol? { return super.basePresenter as? ProductDetailInteractorOutputProtocol }
}

extension ProductDetailInteractor: ProductDetailInteractorInputProtocol {
	
}
