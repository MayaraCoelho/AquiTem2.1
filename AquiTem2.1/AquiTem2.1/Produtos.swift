//
//  Produtos.swift
//  AquiTem2.1
//
//  Created by Emanoel Padua Paschoal de Faria on 3/24/15.
//  Copyright (c) 2015 Mayara Coelho. All rights reserved.
//

import Foundation
import UIKit

private let _ProdutosSharedInstance = Produtos()

class Produtos {
    
    class var sharedInstance:Produtos {

   
    return _ProdutosSharedInstance
}
    var resultadoDaBusca : NSArray = []
    
    func CriaVendedores(nome:String,marca:String,descricao:String,localizacao:String,localizacao2:String,telefone:String)
    {
        
        
        let url = NSURL(string: "http://cariocando.zz.vc/inserePerguntas7.php?nome=\(nome)&marca=\(marca)&descricao=\(descricao)&localizacao=\(localizacao)&localizacao2=\(localizacao2)&telefone=\(telefone)")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!)
            {
                (data, response, error) in
                println(NSString(data: data, encoding: NSUTF8StringEncoding))
        }
        
        task.resume()
        
    }
    
    func BuscaVendedores()
    {
    }
    func parseJSON(inputData: NSData)
    {
        var error: NSError?
        var parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error)
        
        let result = parsedObject as NSArray!
        //result.count
        
        
        
        resultadoDaBusca = result;
        
        println(resultadoDaBusca[0]["Name"])
        
        var nome: AnyObject? = (resultadoDaBusca[0]["Name"])!
        
        // println("hendi merece trabalhar na \(nome)")
        
        
        //            for field in result
        //            {
        //                println(field["Name"]!)
        //                println(field["Latitude"]!)
        //            }
        
        
        
        //            return result
        
        
        
        
    }
    func mudaNome()
    {
        let urlPath: String = "http://cariocando.zz.vc/busca.php?"
        parseJSON(getJSON(urlPath))
        
        var nome = (resultadoDaBusca[resultadoDaBusca.count-1]["Name"]) as String
        
    }
    
    func getJSON(urlToRequest: String) -> NSData
    {
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
    
}





