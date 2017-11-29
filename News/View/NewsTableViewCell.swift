//
//  TableViewCell.swift
//  News
//
//  Created by wyh on 2017/11/29.
//  Copyright © 2017年 wyh. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    var titleLabel = UILabel()
    var picture: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel = UILabel(frame: CGRect(x: 10, y: 3, width: 200, height: 90))
        titleLabel.backgroundColor = .white
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.init(0.2))
        
        picture = UIImageView(frame: CGRect(x: 228, y: 15, width: 77, height: 65))
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(picture)
    }
    
    func initTilte(title: String) {
        self.titleLabel.text = title
    }
    
    //cell的重用
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    // been required
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
