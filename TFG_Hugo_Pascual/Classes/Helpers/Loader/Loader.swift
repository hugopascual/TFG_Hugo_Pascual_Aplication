//
//  Loader.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 21/05/2021.
//

import Foundation
import UIKit

class Loader: UIView {
	
	@IBOutlet weak var loaderParentView: UIView!
	@IBOutlet weak var loaderview: UIView!
	
	// MARK: LIFE CYCLE
	private class func instanceFromNib() -> UIView {
		return (UINib(nibName: "Loader", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? UIView) ?? UIView()
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
	}
	
	// MARK: PUBLIC
	class func showProgressHud(fullScreen: Bool = true) {
		
		DispatchQueue.main.async {
			
			let window = UIApplication.shared.windows[0]
			
			// Si ya existe un loader, no añade ninguno nuevo.
			let checkIfExist = window.viewWithTag(12345)
			
			if checkIfExist as? Loader == nil {
				
				guard let hudView = Loader.instanceFromNib() as? Loader else { return }
				// Bajamos la vista del loader por debajo de la barra de navegación
				hudView.frame = fullScreen ? window.bounds : CGRect(x: 0.0, y: 44 + UIApplication.shared.statusBarFrame.height, width: window.bounds.width, height: window.bounds.height - (44 + UIApplication.shared.statusBarFrame.height))
				
				hudView.tag = 12345
				window.addSubview(hudView)
			}
		}
	}
	
	class func hideProgressHud() {
		DispatchQueue.main.async {
			let window = UIApplication.shared.windows[0]
			for view in window.subviews where view is Loader {
				view.removeFromSuperview()
			}
		}
	}
}
