//
//  HomeViewController.swift
//  SwiftConclusion
//
//  Created by xiao on 2021/7/28.
//

import UIKit

class HomeViewController: UIViewController {

    static let cellID = "homeCell"
    lazy var tableView:UITableView = {
        let t = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: .plain)
//        t.separatorStyle = .none
        t.rowHeight = 88
        t.delegate = self
        t.dataSource = self
        t.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeViewController.cellID)
        return t
    }()
    
    let array = ["alamofire 使用"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(tableView)
    }


}


extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewController.cellID) as! HomeTableViewCell
        let title = array[indexPath.row]
        cell.title = title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AlamofireViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    
    
}
