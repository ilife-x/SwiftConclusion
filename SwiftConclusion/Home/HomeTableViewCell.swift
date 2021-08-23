//
//  HomeTableViewCell.swift
//  SwiftConclusion
//
//  Created by xiao on 2021/8/19.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
     var title:String = "" {
        didSet{
            titleLabel.text = title
        }
    }
    
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = 2
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.selectionStyle = .none
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalTo(20)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
    }
    
}
