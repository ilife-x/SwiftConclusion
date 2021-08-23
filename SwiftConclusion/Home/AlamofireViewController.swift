//
//  AlamofireViewController.swift
//  SwiftConclusion
//
//  Created by xiao on 2021/8/19.
//

import UIKit

class AlamofireViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
    }
}


extension AlamofireViewController{
    func setupUI(){
        title = "Alamofire usage"
        view.backgroundColor = .white
    }
    
    func loadData() {
        AF.request(API.binlog).response{
            response in
            debugPrint(response)
        }
        
    }

}
