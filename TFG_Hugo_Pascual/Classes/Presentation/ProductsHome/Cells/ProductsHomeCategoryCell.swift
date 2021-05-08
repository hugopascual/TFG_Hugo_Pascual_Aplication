//
//  ProductsHomeCategoryCell.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/04/2021.
//

import UIKit

class ProductsHomeCategoryCell: UITableViewCell {

	@IBOutlet weak var cellView: UIView!
	@IBOutlet weak var iconImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func configureCell(model: ProductsHomeCategoryCellViewModel) {
		self.setUpCellView()
		self.setUpCellViewModel(model: model)
	}
	
	func setUpCellViewModel(model: ProductsHomeCategoryCellViewModel) {
		self.iconImageView.image = UIImage(named: model.image ?? "")
		self.titleLabel.text = model.title
		self.descriptionLabel.text = model.description
	}
	
	func setUpCellView() {
		self.cellView.roundedByDefault(radious: 16)
	}
}
