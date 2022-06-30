//
//  productModel.swift
//  sampleApp
//
//  Created by Raghav Deo on 06/04/22.
//

import Foundation
class product
{
    var pId:String?
    var pName:String?
    var pRate:Double?
    
    
}
class products
{
    var productArray=[product?]()
    func fillArray(p:product?)
    {
        if let pr=p
        {
        productArray.append(pr)
        }
    }
}
