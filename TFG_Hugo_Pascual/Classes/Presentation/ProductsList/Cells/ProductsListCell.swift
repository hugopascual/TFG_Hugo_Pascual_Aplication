//
//  ProductsListCell.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 08/05/2021.
//

import UIKit

class ProductsListCell: UITableViewCell {

	@IBOutlet weak var cellView: UIView!
	@IBOutlet weak var iconImageView: UIImageView!
	@IBOutlet weak var modelLabel: UILabel!
	@IBOutlet weak var priceLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
	func configureCell(viewModel: ProductsListCellViewModel) {
		self.setUpCellView()
		self.setUpCellViewModel(viewModel: viewModel)
	}
	
	func setUpCellView() {
		self.cellView.roundedByDefault(radious: 8)
	}
	
	func setUpCellViewModel(viewModel: ProductsListCellViewModel) {
		self.iconImageView.image = Utils.imgBase64Decode(viewModel.image)
		self.modelLabel.text = viewModel.model
		self.priceLabel.text = viewModel.price
	}
}
