//
//  BaseProvider.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//

import UIKit
import Alamofire

enum AcceptResponseType {
	case json
	case xml
}

struct ProviderDTO {
	var params: [String: Any]?
	var arrayParams: [[String: Any]]?
	var method: HTTPMethod
	var urlContext: URLEndpoint.BaseURLContext
	var endpoint: String
	var acceptType = AcceptResponseType.json
	
	init(params: [String: Any]?,
		method: HTTPMethod,
		urlContext: URLEndpoint.BaseURLContext,
		endpoint: String,
		acceptType: AcceptResponseType = .json) {
		
		self.params = params
		self.method = method
		self.urlContext = urlContext
		self.endpoint = endpoint
		self.acceptType = acceptType
	}
	
	init(arrayParams: [[String: Any]]?,
		method: HTTPMethod,
		endpoint: String,
		urlContext: URLEndpoint.BaseURLContext,
		acceptType: AcceptResponseType = .json) {
		
		self.arrayParams = arrayParams
		self.method = method
		self.urlContext = urlContext
		self.endpoint = endpoint
		self.acceptType = acceptType
	}
}
class BaseProvider: NSObject {
	
	var task: URLSessionTask?
	
	weak var delegate: BaseProviderDelegate?

	static func parseToServerModel<Model: BaseServerModel>(parserModel: Model.Type, data: Data?) -> Model? {

		guard let payload = data, let model = try? JSONDecoder().decode(parserModel, from: payload) else {
			return nil
		}
		return model
	}

	static func parseArrayToServerModel<Model: BaseServerModel>(parserModel: [Model].Type, data: Data?) -> [Model]? {

		guard let payload = data, let arrayModels = try? JSONDecoder().decode(parserModel, from: payload) else {
			return nil
		}
		return arrayModels
	}

	private var manager: Alamofire.SessionManager!
	private func createManager(timeout: TimeInterval) -> Alamofire.SessionManager {

		// Creamos el manager personalizado.
		let configuration = URLSessionConfiguration.default
		configuration.timeoutIntervalForRequest = timeout
		configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
		configuration.requestCachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData

		let serverTrustPolicies: [String: ServerTrustPolicy] = [
			"app-pre..": .pinCertificates(
				certificates: ServerTrustPolicy.certificates(),
				validateCertificateChain: true,
				validateHost: true
			),
			"app-pro..": .pinCertificates(
				certificates: ServerTrustPolicy.certificates(),
				validateCertificateChain: true,
				validateHost: true
			)
		]

		let manager = Alamofire.SessionManager(
			configuration: configuration,
			serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
		)

		return manager
	}

	// MARK: INTERNAL
	internal func request(dto: ProviderDTO,
						  timeout: TimeInterval = 60,
						  loader: Bool = true,
						  printLog: Bool = true,
						  encrypted: Bool = false,
						  additionalHeader: [ String: String] = [:],
						  success: @escaping(Data?) -> Void,
						  failure: @escaping(CustomErrorModel) -> Void) -> URLSessionTask? {

		if !NetworkManager.shared.checkNetwork() {
			self.delegate?.networkNotReachable(endpoint: dto.endpoint)
			return nil
		}
		
		let baseURL = URLEndpoint.getBaseUrl(urlContext: dto.urlContext)
		let endpoint = "\(baseURL)/\(dto.endpoint)"

		var headers: [String: String] = [Constants.contentTypeHeader: Constants.jsonMIMEtype]
		
		headers.merge(Utils.getLanguageHeader()) { (_, new) in new}
		
		let parameters: [String: Any]? = dto.params

		//se añaden nuevas cabeceras si el parametro viene lleno
		if !additionalHeader.isEmpty {
			for item in additionalHeader {
				headers[item.key] = item.value
			}
		}

		// Crea el manager, en la primera ejecución del provider, o cuando el timeout se modifica.
		if self.manager == nil ||
			self.manager.session.configuration.timeoutIntervalForRequest != timeout {

			self.manager = self.createManager(timeout: timeout)
		}

		let request = self.manager.request(endpoint,
										   method: dto.method,
										   parameters: parameters,
										   encoding: self.getEncodingType(dto: dto, encrypted: encrypted),
										   headers: headers)
		
		self.printRequest(dto: dto, endpoint: endpoint, headers: headers, printData: printLog)

		self.delegate?.requestDone(endpoint: dto.endpoint)
		
		request.responseJSON { response in

			self.delegate?.responseGet(endpoint: dto.endpoint)
			
			if (200..<300).contains(response.response?.statusCode ?? 0) {

				// Gestión del caso correcto

				// Se obtiene la respuesta.
				guard let data = response.data else {
					// Si la respuesta no tiene datos, se devuelve un error.
					self.apiResponseError(loader: loader,
										  responseData: response.data,
										  responseStatusCode: response.response?.statusCode,
										  failure: failure)
					return
				}

				let decryptedBytes = self.manageResponseData(data: response.data, encrypted: encrypted, printLog: printLog)
				
				self.printSuccessResponse(endpoint: endpoint, data: data, decryptedBytes: decryptedBytes, printData: printLog)

				success(decryptedBytes)

			} else {

				let decryptedBytes = self.manageResponseData(data: response.data, encrypted: encrypted, printLog: printLog)

				self.printFailureResponse(endpoint: endpoint, data: response.data, decryptedBytes: decryptedBytes, printData: printLog)
				
				self.apiResponseError(loader: loader,
									  responseData: decryptedBytes,
									  responseStatusCode: response.response?.statusCode,
									  failure: failure)
				return
			}
		}

		self.task = request.task
		return request.task
	}

	fileprivate func convertToDictionary(text: String) -> [String: Any]? {
		if let data = text.data(using: .utf8) {
			do {
				return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
			} catch {
				print(error.localizedDescription)
			}
		}
		return nil
	}

	fileprivate func apiResponseError(loader: Bool = true,
									  responseData: Data?,
									  responseStatusCode: Int?,
									  failure: @escaping (CustomErrorModel) -> Void) {

		let errorModel = CustomErrorModel(data: responseData, httpCode: responseStatusCode)

		Utils.print(errorModel)
		Utils.print("*************************** END ***************************")

		failure(errorModel)
	}

	fileprivate func manageResponseData(data: Data?, encrypted: Bool, printLog: Bool) -> Data? {

		guard let data = data else { return nil }

		var decryptedBytes: Data?

		if encrypted {
			// Desencriptar

		} else {
			decryptedBytes = data
		}

		return decryptedBytes
	}

	func getEncodingType(dto: ProviderDTO, encrypted: Bool) -> ParameterEncoding {

		switch dto.method {
		case .get, .delete:

			return CustomGetEncoding(encrypted: encrypted)

		case .post, .put, .patch:

			if encrypted && dto.params != nil {

				return CustomGetEncoding(params: dto.params, encrypted: encrypted)
			}

			if !encrypted && dto.params != nil {

				return JSONEncoding.default
			}

			if dto.arrayParams != nil {
				return CustomGetEncoding(arrayParams: dto.arrayParams, encrypted: encrypted)
			}

		default:
			return JSONEncoding.default
		}

		return JSONEncoding.default
	}

	struct CustomGetEncoding: ParameterEncoding {

		var params: [String: Any]?
		var arrayParams: [[String: Any]]?
		var encrypted: Bool

		init(encrypted: Bool) {
			self.encrypted = encrypted
		}

		init(params: [String: Any]?,
			 encrypted: Bool) {

			self.params = params
			self.encrypted = encrypted
		}

		init(arrayParams: [[String: Any]]?,
			 encrypted: Bool) {

			self.arrayParams = arrayParams
			self.encrypted = encrypted
		}

		func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {

			var request = try URLEncoding().encode(urlRequest, with: parameters)

			if let params = self.params, let httpBody = try? JSONSerialization.data(withJSONObject: params) {

				request.httpBody = self.getHTTPBody(data: httpBody, encrypted: encrypted)
			}

			if let arrayParams = self.arrayParams, let httpBody = try? JSONSerialization.data(withJSONObject: arrayParams) {

				request.httpBody = self.getHTTPBody(data: httpBody, encrypted: encrypted)
			}

			request.url = URL(string: request.url!.absoluteString.replacingOccurrences(of: "%5B%5D=", with: "="))
			return request
		}

		func getHTTPBody(data: Data, encrypted: Bool) -> Data? {

			if encrypted {
				// Encriptar
				Utils.print("PARAMETERS ENCRYPTED: ")
				Utils.print(String(data: Data(), encoding: .utf8) ?? "")
				return Data()
			} else {
				return data
			}
		}
	}
	
	func printRequest(dto: ProviderDTO, endpoint: String, headers: [String: Any], printData: Bool) {
		
		let data = dto.arrayParams != nil
			? try? JSONSerialization.data(withJSONObject: (dto.arrayParams ?? [:]), options: .prettyPrinted)
			: try? JSONSerialization.data(withJSONObject: (dto.params ?? []), options: .prettyPrinted)

		Utils.print("************* REQUEST ALAMOFIRE **************")
		Utils.print("Request Date: \(Date().format(format: "dd/MM/yyyy-HH:mm:ss"))")
		Utils.print("URL: \(endpoint)")
		if printData {
			Utils.print("PARAMETERS: ")
			Utils.print(String(data: data ?? Data(), encoding: .utf8) ?? "")
			Utils.print("HEADERS: \(headers)")
		}
		Utils.print("************* END *************")
	}
	
	func printSuccessResponse(endpoint: String, data: Data, decryptedBytes: Data?, printData: Bool) {
		Utils.print("*************************** ALAMOFIRE RESPONSE ***************************")
		Utils.print("Response Date: \(Date().format(format: "dd/MM/yyyy-HH:mm:ss"))")
		Utils.print("URL: \(endpoint)")
		if printData {
			Utils.print(String(data: data, encoding: .utf8) ?? "")
			if decryptedBytes != data {
				Utils.print(String(data: decryptedBytes ?? Data(), encoding: .utf8) ?? "")
			}
		}

		Utils.print("********* END ***********")
	}
	
	func printFailureResponse(endpoint: String, data: Data?, decryptedBytes: Data?, printData: Bool) {

		Utils.print("*************************** ALAMOFIRE RESPONSE ***************************")
		Utils.print("Response Date: \(Date().format(format: "dd/MM/yyyy-HH:mm:ss"))")
		Utils.print("URL: \(endpoint)")

		if printData {
			Utils.print(String(data: data ?? Data(), encoding: .utf8) ?? "")
			Utils.print(String(data: decryptedBytes ?? Data(), encoding: .utf8) ?? "")
		}
	 }
	
	func genericRequest(dto: ProviderDTO, success: @escaping (Any?) -> Void, failure: @escaping (CustomErrorModel) -> Void) {
		
		_ = self.request(dto: dto, success: success, failure: failure)
	}
	
}
