//
//  Shop.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
    
    public func clear(){
        showingProduct = false
        selectedProduct = nil
    }
    
    public func setShowingProduct(b: Bool) {
        showingProduct = b
    }
    
    public func setSelectedProduct(p: Product) {
        selectedProduct = p
    }
}
