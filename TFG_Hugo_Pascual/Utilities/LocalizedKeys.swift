//
//  LocalizedKeys.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 11/05/2021.
//

// swiftlint:disable type_body_length
// swiftlint:disable identifier_name
// swiftlint:disable line_length
// swiftlint:disable file_length

import Foundation

struct LocalizedKeys {
	
	struct Common {
		static let buy = "common_buy".localized //"Comprar"
		static let delete = "common_delete".localized //"Eliminar"
		static let cancel = "common_cancel".localized //"Cancelar"
		static let email = "common_email".localized //"Correo electrónico"
		static let username = "common_username".localized //"Nombre de usuario"
		static let password = "common_password".localized //"Contraseña"
		
	}
	
	struct Error {
		static let generic_description = "error_generic_description".localized //"Ha ocurrido un error"
	}
	
	struct Login {
		static let login = "login_screen_title".localized //"Iniciar sesión"
		static let no_account = "login_no_account".localized //"¿No tienes una cuenta? Regístrate"
	}

	struct Registration {
		static let registration = "registration_screen_title".localized //"Registrate"
	}

	struct MyProfile {
		static let profile = "my_profile_screen_title".localized //"Perfil"
		static let logout = "my_profile_logout".localized //"Cerrar sesión"
		static let my_products_button_title = "my_profile_my_products_button_title".localized //"Mis productos"
	}

	struct ProductsHome {
		static let products = "products_home_screen_title".localized //"Produtos"
		static let add_product_button_title = "products_home_add_product_button_title".localized //"Publicar producto"
		static let motherboard_title = "products_home_motherboard_title".localized //"Placa Madre"
		static let motherboard_description = "products_home_motherboard_description".localized //"El corazón de tu ordenador que comunica el resto de componentes."
		static let cpu_title = "products_home_cpu_title".localized //"Procesador"
		static let cpu_description = "products_home_cpu_description".localized //"El cerebro de tu ordenador que todo lo controla."
		static let gpu_title = "products_home_gpu_title".localized //"Tarjeta gráfica"
		static let gpu_description = "products_home_gpu_description".localized //"El procesador de lo visual y que te da tu fps."
		static let ram_title = "products_home_ram_title".localized //"Modulo RAM"
		static let ram_description = "products_home_ram_description".localized //"Donde se cargan las ordenes de t procesador."
	}
 
	struct ProductsList {
		static let products_list = "products_list_screen_title".localized //"Lista de productos"
	}

	struct AddProduct {
		static let add_product = "add_product_screen_title".localized //"Añadir producto"
		static let category_section_title = "add_product_category_section_title".localized //"Categoría"
		static let no_category_choosen = "add_product_no_category_choosen".localized //"Sin categoría"
		static let choose_category = "add_product_choose_category".localized //"Elegir"
		static let model_section_title = "add_product_model_section_title".localized //"Modelo"
		static let price_section_title = "add_product_price_section_title".localized //"Precio"
		static let description_section_title = "add_product_description_section_title".localized //"Descripción"
		static let attach_image_button_title = "add_product_attach_image_button_title".localized //"Adjuntar imagen"
		static let no_attached_image = "add_product_no_attached_image".localized //"Sin imagen adjunta"
		static let attached_image = "add_product_attached_image".localized //"Imagen adjunta"
	}

	struct ProductChooseCategory {
		static let choose_category = "product_choose_category_screen_title".localized //"Elige categoria";
	}
	
	struct ProductDetail {
		static let product_detail = "product_detail_screen_title".localized //"Detalle del producto"
	}
}
