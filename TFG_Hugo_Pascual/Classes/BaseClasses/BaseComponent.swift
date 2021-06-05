//
//  BaseComponent.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/06/2021.
//

import Foundation
import UIKit

class BaseComponent<ViewModel: BaseViewModel>: UIView, NibInstantiate {
	
	var viewModel: ViewModel?
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		self.setup()
	}
	
	func setup() {}
	
	func configure(viewModel: ViewModel) {
		self.viewModel = viewModel
	}
}

public protocol NibInstantiate {
	static var nibName: String { get }
}

extension NibInstantiate {

	public static var nibName: String {
		return String(describing: self)
	}
}

public extension NibInstantiate where Self: UIViewController {
	static func initFromNib() -> Self? {
		return Self(nibName: nibName, bundle: Bundle(for: self))
	}
}

public extension NibInstantiate where Self: UIView {
	static func initFromNib(inView: UIView? = nil) -> Self? {
		let view = UINib(nibName: nibName, bundle: Bundle(for: self)).instantiate(withOwner: self, options: nil).first as? Self
		if let view = view {
			inView?.addSubviewWithConstraints(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), subView: view)
		}
		return view
	}
}
