//
//  productViewModel.swift
//  sampleApp
//
//  Created by Raghav Deo on 06/04/22.
//

import Foundation
class viewModel
{
    let ps=products()
    let p=product()
    func getFromModel(id:String?,name:String?,rate:Double?)->product?
    {
        if let prId=id
        {
        p.pId=prId
        }
        if let prname=name
        {
        p.pName=prname
        }
        if let prrate=rate
        {
        p.pRate=prrate
        }
       
        return p
    }
}
