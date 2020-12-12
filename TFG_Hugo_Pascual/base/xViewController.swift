//
//  ViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//
//swiftlint:disable type_name

import Foundation

protocol xViewProtocol: BaseViewProtocol {
	
}

class xViewController: BaseViewController {
	
	var presenter: xPresenterProtocol? { return super.basePresenter as? xPresenterProtocol}
	
}

extension xViewController: xViewProtocol {
	
}
