//
//  ToastView.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 07/06/2021.
//

import Foundation
import UIKit

class ToastView: BaseComponent<ToastViewModel> {
	
	// MARK: IBOutlets
	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var iconImageVIew: UIImageView!
	@IBOutlet weak var infoLabel: UILabel!
	@IBOutlet weak var closeButton: UIButton!
	
	@IBOutlet weak var containerViewTrailingToInfoLabelTrailing: NSLayoutConstraint!
	@IBOutlet weak var closeButtonLeadingToInfoLabelTrailing: NSLayoutConstraint!
	
	@IBOutlet weak var iconImageViewCenterToContainerView: NSLayoutConstraint!
	@IBOutlet weak var iconImageViewTopToInfoLabel: NSLayoutConstraint!
	
	// MARK: IBActions
	@IBAction func closeButtonPressed(_ sender: Any) {
		self.removeFromSuperview()
	}
	
	// MARK: Functions
	override func configure(viewModel: ToastViewModel) {
		super.configure(viewModel: viewModel)
		
		self.infoLabel.text = self.viewModel?.title
		
		guard let type = self.viewModel?.type else { return }
		switch type {
		case .info:
			self.containerView.backgroundColor = CustomColor.viewSecondary.uiColor
			self.iconImageVIew.image = UIImage(named: ImagesNamesConstants.info_icon)
			self.closeButton.isHidden = true
			self.manageConstraints(closeShowed: false)
		case .success:
			self.containerView.backgroundColor = CustomColor.viewSucess.uiColor
			self.iconImageVIew.image = UIImage(named: ImagesNamesConstants.success_icon)
			self.closeButton.isHidden = true
			self.manageConstraints(closeShowed: false)
		case .error:
			self.containerView.backgroundColor = CustomColor.viewError.uiColor
			self.iconImageVIew.image = UIImage(named: ImagesNamesConstants.error_icon)
			self.closeButton.isHidden = true
			self.manageConstraints(closeShowed: false)
		case .infoClose:
			self.containerView.backgroundColor = CustomColor.viewSecondary.uiColor
			self.iconImageVIew.image = UIImage(named: ImagesNamesConstants.info_icon)
			self.closeButton.isHidden = false
			self.manageConstraints(closeShowed: true)
		}
		self.containerView.layer.cornerRadius = 8
	}
	
	private func manageConstraints(closeShowed: Bool) {
		if closeShowed == true {
			self.containerViewTrailingToInfoLabelTrailing.isActive = false
			self.iconImageViewCenterToContainerView.isActive = false
			self.iconImageViewTopToInfoLabel.isActive = true
			self.closeButtonLeadingToInfoLabelTrailing.isActive = true
		} else {
			self.closeButtonLeadingToInfoLabelTrailing.isActive = false
			self.iconImageViewTopToInfoLabel.isActive = false
			self.iconImageViewCenterToContainerView.isActive = true
			self.containerViewTrailingToInfoLabelTrailing.isActive = true
			
		}
	}
}
