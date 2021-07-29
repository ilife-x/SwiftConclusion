//
//  SettingViewController.swift
//  SwiftConclusion
//
//  Created by xiao on 2021/7/28.
//

import UIKit
import Alamofire

class SettingViewController: UIViewController {

    lazy var tableview = UITableView()
    static let cellID:String = "cellID"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        loadData()

    }
    
    
    func configUI() {
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
        tableview.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
    }
    
    func loadData() {
        
        struct Page: Encodable {
            let page: Int
        }

        let page = Page(page: 1)

        AF.request(API.imgrank,
                   method:.post,
                   parameters: page,
                   encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        }
        
        
        
        

    }


}

//MARK:- delegate
extension SettingViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableview.dequeueReusableCell(withIdentifier: Self.cellID)
        if cell  == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: Self.cellID)
        }
        cell?.selectionStyle = .none
        
        return cell!

    }
}

extension SettingViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
}
