//
//  AddProductInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 14/01/2021.
//

import Foundation

protocol AddProductInteractorInputProtocol: BaseInteractorInputProtocol {

}

class AddProductInteractor: BaseInteractor {
	
	weak var presenter: AddProductInteractorOutputProtocol? { return super.basePresenter as? AddProductInteractorOutputProtocol }
}

extension AddProductInteractor: AddProductInteractorInputProtocol {
	
}
