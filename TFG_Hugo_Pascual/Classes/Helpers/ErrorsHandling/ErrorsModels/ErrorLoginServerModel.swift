//
//  ErrorLoginServerModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/12/2020.
//

import Foundation

struct ErrorLoginServerModel: BaseServerModel {
	
	var code: String?
	var description: String?
	var userToken: String?
	var email: String?
}
