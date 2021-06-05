//
//  ToastView.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/06/2021.
//

import Foundation

class ToastView: BaseComponent<ToastViewModel> {
	
	// MARK: IBOutlets
	
	
	
	
//	override func configure(viewModel: ToastViewModel) {
//		super.configure(viewModel: viewModel)
//		
//		self.labelInfo.text = self.viewModel?.title
//		
//		guard let type = self.viewModel?.type else { return }
//		switch type {
//		case .info:
//			self.viewContainer.backgroundColor = CustomColor.viewSecondary.uiColor
//			self.imageViewIcon.image = #imageLiteral(resourceName: "ico_info")
//			self.buttonClose.isHidden = true
//			self.manageConstraints(closeShowed: false)
//		case .success:
//			self.viewContainer.backgroundColor = CustomColor.viewSuccess.uiColor
//			self.imageViewIcon.image = #imageLiteral(resourceName: "ico_success")
//			self.buttonClose.isHidden = true
//			self.manageConstraints(closeShowed: false)
//		case .error:
//			self.viewContainer.backgroundColor = CustomColor.viewError.uiColor
//			self.imageViewIcon.image = #imageLiteral(resourceName: "ico_error")
//			self.buttonClose.isHidden = true
//			self.manageConstraints(closeShowed: false)
//		case .infoClose:
//			self.viewContainer.backgroundColor = CustomColor.viewSecondary.uiColor
//			self.imageViewIcon.image = #imageLiteral(resourceName: "ico_info")
//			self.buttonClose.isHidden = false
//			self.manageConstraints(closeShowed: true)
//		}
//		
//		self.viewContainer.layer.cornerRadius = 8
//	}
//	
//	private func manageConstraints(closeShowed: Bool) {
//		if closeShowed == true {
//			self.labelTrailingContainerConstraint.isActive = false
//			self.imageCenterToView.isActive = false
//			self.imageTopToLabelConstraint.isActive = true
//			self.labelSpaceToCloseConstraint.isActive = true
//			
//		} else {
//			self.labelSpaceToCloseConstraint.isActive = false
//			self.imageTopToLabelConstraint.isActive = false
//			self.imageCenterToView.isActive = true
//			self.labelTrailingContainerConstraint.isActive = true
//			
//		}
//	}
}
