//
//  KnownErrors.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/12/2020.
//

import Foundation

enum ViewError {
	case home
	case productList
	case chatHasNotOwnConversations
	case chatHasNotInterestedConversations
	case chatCanNotRemoved
	case isEmpty
	case userHasNotReportedUsers
	case userHasNotReportedProducts
	case donationsFieldsError
	case unblockedUserError
	
	case unspecified
}

public struct HTTPClientError: Error {
	
	var type: ErrorType = .unknownError
	
	enum ErrorType: Int {
		case internalServerError = 500
		case badGateway = 502
		case unauthorized = 401
		case forbidden = 403
		case notFound = 404
		case preConditionFailed = 412
		case requestError = 400
		case networkError = 0
		case unknownError = -1
	}
	
	init(code: Int) {
		self.type = ErrorType(rawValue: code) ?? .unknownError
	}
}

public struct BackendError: Error {
	
	var type: ErrorType = .unknownError
	var code: String = ""
	var serverMessage = ""
	
	enum ErrorType: String {
		case invalidToken = "AUTH"
		case loginNeedsNicknameAndTerms = "LOGIN-001"
		case loginNeedsTermsAndConditions = "LOGIN-002"
		case loginLegalPerson = "LOGIN-003"
		case loginNeedsPhoneAndNicknameAndTerms = "LOGIN-004"
		case loginUserLacksOrNotVerifiedEmail = "LOGIN-005"
		case registrationSuccessWithoutNameAndSurname = "REG-001"
		case isbnNotVerified = "AUTH0008"
		case chatHasNotOwnConversations = "CHAT-001"
		case chatHasNotInterestedConversations = "CHAT-002"
		case chatHasNotMessages = "CHAT-003"
		case chatNotReachable = "CHAT-004"
		case chatHasNotUserId = "CHAT-005"
		case chatCanNotDeleted = "CHAT-006"
		case noResults = "NORESULTS"
		case phoneAlreadyRegistred = "PHONE-001"
		case emailAlreadyRegistred = "Validation-002"
		case nicknameAlreadyRegistred = "Validation-003"
		case otpNotSend = "OTP-001"
		case otpInvalid = "OTP-002"
		case productsNotFound = "PRODUCTS-001"
		case homeFailure = "HOME-001"
		case userHasNotLocation = "LOCATION-001"
		case userHasNotProducts = "USER-001"
		case userHasNotDonations = "USER-002"
		case userHasNotSoldProducts = "USER-003"
		case userHasNotPurchasedProducts = "USER-004"
		case soldProductError = "SOLD-001"
		case discountCodeWrong = "CODE-001"
		case discountCodeExpired = "CODE-002"
		case discountCodeInUse = "CODE-003"
		case nicknameAlreadyInUse = "PROF-001"
		case userHasNotReportedUsers = "REP-001"
		case userHasNotReportedProducts = "REP-002"
		case userHasNotBlockedUsers = "BLOCK-001"
		case unblockUserFail = "UNBLOCK-001"
		case emailNotVerified = "EMAIL-001"
		case donationFieldsError = "DONA-001"
		case unknownError = ""
		case userHasNotPatmentMethod = "NO_PAYMENT_METHOD"
		case deletedPaymentMethodError = "PAYMENT_DELETED_ERROR"
		case addPaymentMethodError = "ADD_PAYMENT_METHOD_ERROR"
		case modifiedPaymentMethodError = "MODIFIED_PAYMENT_METHOD_ERROR"
	}
	
	init(code: String, serverMessage: String) {
		
		self.type = ErrorType(rawValue: code) ?? .unknownError
		self.serverMessage = serverMessage
	}
}
