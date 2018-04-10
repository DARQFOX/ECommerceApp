//
//  Constants.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/3/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import Foundation

struct Constants {
    
        struct ProductFeed {
        
        static let TITLE = "Merch!"
        
        struct Cells {
            static let PRODUCT_FEED_CELL = "ProductFeedCell"
            static let PRODUCT_DETAIL_CELL = "ProductDetailCell"
            static let BUY_BUTTON_CELL = "BuyButtonCell"
            static let SHOW_PRODUCT_DETAIL_CELL = "ShowProductDetailCell"
            static let SUGGESTION_CELL = "SuggestionTableViewCell"
            static let SUGGESTION_COLLECTION_VIEW_CELL = "SuggestionCollectionViewCell"
        }
        
        struct Controllers {
            static let SHOW_IMAGES_PAGE_VC = "ProductImagesPageViewController"
            static let PRODUCT_IMAGE_VIEW_CONTROLLER = "ProductImageViewController"
        }
        
        struct Segues {
            static let DETAIL_VIEW_SEGUE = "DetailViewSegue"
        }
    }
    
    struct ShoppingBag {
        
        static let TITLE = "SHOPPING BAG"
        
        struct Cells {
            static let NUMBER_OF_ITEMS_CELL = "NumberOfItemsCell"
            static let PRODUCT_IN_BAG_CELL = "ProductInBagCell"
            static let SUBTOTAL_CELL = "SubtotalCell"
            static let TOTAL_CELL = "TotalCell"
            static let CHECKOUT_CELL = "CheckoutCell"
        }
        
        struct Controllers {
            
        }
        
        struct Segues {
            
        }
    }
    
    
}

