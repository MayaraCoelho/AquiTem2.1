//
//  ListaVendedoresEtrutura.swift
//  AquiTem2.1
//
//  Created by Mayara Coelho on 3/22/15.
//  Copyright (c) 2015 Mayara Coelho. All rights reserved.
//

import Foundation
import UIKit

// classe responsável pela estrutura da TableViewController
struct ListaVendedoresEstrutura {
    
    //variáveis responsáveis pelo conteúdo que aparecerá dentro de cada células.
    var nome: String
    var marca: String
    var categoria: String
    var imagem: UIImage!
//    var localidade: String
    
    
}

//The UITableViewController class creates a controller object that manages a table view.
// An instance of UITableView (or simply, a table view) is a means for displaying and editing hierarchical lists of information.

class ListaVendedores: UITableViewController {
    
    @IBOutlet weak var textNome: UILabel!
    @IBOutlet weak var textMarca: UILabel!
    // criação de um array para vendedores da estrutura acima.
    var vendedores = [ListaVendedoresEstrutura]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // população da tableview
        vendedores = [ListaVendedoresEstrutura (nome: "Amanda", marca: "Tutti Doces", categoria: "doces", imagem: UIImage(named: "1.jpg" )),
                      ListaVendedoresEstrutura(nome: "Mayara", marca: "Sweet Healthy", categoria: "healthy", imagem: UIImage(named: "2.jpg")),
                      ListaVendedoresEstrutura (nome: "Emanoel", marca: "Trufas e Cia", categoria: "doces", imagem: UIImage(named: "3.jpg"))]
        
        // sets the estimated row height of the cell, which is the height of the existing prototype cell
        tableView.estimatedRowHeight = 68.0
        
        //changes the rowHeight property to UITableViewAutomaticDimension, which is the default row height in iOS 8.
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // remove os separadores vazios.
        tableView.tableFooterView = UIView(frame:CGRectZero)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Reload the table
        self.tableView.reloadData()
        
    }
    
    // função responsável pelo número de linhas da table view
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int{
        return vendedores.count
    }
    
    override func viewDidAppear(animated: Bool) {
        
        tableView.reloadData()
        
    }
    
    // função que constrói
        override func tableView(tableView:UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            var cell :  UITableViewCell? = self.tableView.dequeueReusableCellWithIdentifier("Cell") as?  UITableViewCell
            
            if( cell == nil){
               cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
            
                
            }
    
        var vendedor = self.vendedores[indexPath.row]
            
        cell!.textLabel!.text = vendedor.marca
        cell?.detailTextLabel?.text = "Localidade"
        cell!.textLabel!.text = vendedor.categoria
        cell!.imageView!.image = vendedor.imagem
        cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
        
    }

}




