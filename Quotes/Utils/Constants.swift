//
//  Constants.swift
//  Quotes
//
//  Created by Dalveer singh on 24/06/22.
//

import Foundation
import SwiftUI
struct Constants{
    static let appSecondary = Color.gray.opacity(0.1)
    static let appPrimary = Color.black.opacity(0.9)
    
    // API KEYS
    static let base_url = "https://api.quotable.io"
    static let get_quote_url = "\(base_url)/quotes?page="
    static let get_tags_url = "\(base_url)/tags"
    static let get_authors_url = "\(base_url)/authors"
    static let get_author_with_slugname = "\(base_url)/authors?slug="
    static let get_randon_quote_url = "\(base_url)/random"
    static let get_quotes = "\(base_url)/quotes"
    static let get_quotes_for_author = "\(base_url)/quotes?author="
    static let image_base_url = "https://api.pexels.com/v1/"
    /// Color collection
    static let appColor1 = Color(red: 222/255, green: 246/255, blue: 202/255)
    static let appColor2 = Color(red: 176/255, green: 254/255, blue: 118/255)
    static let appColor3 = Color(red: 245/255, green: 187/255, blue: 0)
    static let appColor4 = Color(red: 228/255, green: 217/255, blue: 1)
    static let appColor5 = Color(red: 39/255, green: 52/255, blue: 105/255)
    static let appColor6 = Color(red: 63/255, green: 52/255, blue: 63/255)
    static let appColor7 = Color(red: 244/255, green: 213/255, blue: 141/255)
    static let appColor8 = Color(red: 249/255, green: 231/255, blue: 231/255)
    static let appColor9 = Color(red: 184/255, green: 184/255, blue: 1)
    
    // FONTS
    static let fontRegular = "PlayfairDisplay-Regular"
    static let fontItalic = "PlayfairDisplay-Italic"
    static let fontBold = "PlayfairDisplay-Bold"
    static let fontBoldItalic = "PlayfairDisplay-BoldItalic"
    static let fontBlack = "PlayfairDisplay-Black"
    static let fontBlackItalic = "PlayfairDisplay-BlackItalic"
    static let fontGothamLight = "Gotham-Light"
    static let fontGaramondRoman = "Garamond-Roman"
    static let fontVollkornItalic = "Vollkorn-Italic"
    static let fontFreightSansBook = "Freight-SansBook"
    static let fontMontserratRegular = "Montserrat-Regular"
    static let fontDancingScriptRegular = "DancingScript-Regular"
    static let fontOpenSansRegular  = "OpenSans-Regular"
    static let fontTimesNewRoman = "TimesNewRomanPSMT"
    static let fontPoppinsRegular  = "Poppins-Regular"
    static let fontNunitoRegular  = "Nunito-Regular"
}
