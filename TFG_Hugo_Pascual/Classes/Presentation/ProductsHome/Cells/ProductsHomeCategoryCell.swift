//
//  ProductsHomeCategoryCell.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/04/2021.
//

import UIKit

class ProductsHomeCategoryCell: UITableViewCell {

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
	
	func setUpCellViewModel(model: ProductsHomeCategoryCellViewModel) {
		self.iconImageView.image = UIImage(named: model.image ?? "")
		self.titleLabel.text = model.title
		self.descriptionLabel.text = model.description
	}
    
}

class ProductsHomeCategoryCellViewModel {

	var category: ProductCategory?
	var image: String?
	var title: String?
	var description: String?
	
	init(category: ProductCategory? = nil, image: String? = nil, title: String? = nil, description: String? = nil) {
		self.category = category
		self.image = image
		self.title = title
		self.description = description
	}
}

extension ProductsHomeCategoryCellViewModel {
	static let motherboard = ProductsHomeCategoryCellViewModel(category: .motherboard, image: ImagesNamesConstants.motherboard_icon, title: "ÇPlacas Base", description: "çEl corazón de tu ordenador donde todo debe encajar.")
	static let cpu = ProductsHomeCategoryCellViewModel(category: .cpu, image: ImagesNamesConstants.cpu_icon, title: "ÇPorcesadores", description: "çEl cerebro de tu ordenador que todo lo controla.")
	static let gpu = ProductsHomeCategoryCellViewModel(category: .gpu, image: ImagesNamesConstants.gpu_icon, title: "ÇTarjetas gráficas", description: "çEl precesador de lo visual y que te da tus fps.")
	static let ram = ProductsHomeCategoryCellViewModel(category: .ram, image: ImagesNamesConstants.ram_icon, title: "ÇModulos RAM", description: "çDonde se cargan las ordenes de tu procesador.")
}
