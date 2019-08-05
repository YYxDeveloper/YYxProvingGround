//
//  ListCell.swift
//  Tucan
//
//  Created by Cat on 2/5/18.
//  Copyright © 2018 Midnight. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {

     var tucanImageView = UIImageView()
     var tucanNameLabel = UILabel()
     var tucanTitleLabel = UILabel()
     var dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        customize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        customize()
    }
    
    func getDate() -> String {
        let date = Date()
        let formater = DateFormatter()
        formater.dateFormat = "dd MMMM yyy"
        let result = formater.string(from: date)
        return result
    }
    
    private func customize() {
//        self.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 1, alpha: 1.0)
        self.contentView.backgroundColor = .orange
        tucanImageView.contentMode = .scaleAspectFit
        
        tucanTitleLabel.font = UIFont.systemFont(ofSize: 15)
        tucanTitleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)

        tucanTitleLabel.textAlignment = .center
        tucanTitleLabel.textColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 1.0)
        
        dateLabel.font = UIFont.systemFont(ofSize: 13)
        dateLabel.textAlignment = .left
        dateLabel.textColor = UIColor.gray
        dateLabel.text = getDate()
        
        tucanNameLabel.font = UIFont.systemFont(ofSize: 20)

        tucanNameLabel.textAlignment = .left
        tucanNameLabel.backgroundColor = .blue
         tucanNameLabel.textColor = .white
//        tucanNameLabel.textColor = UIColor(hue: 0, saturation: 0, brightness: 0.3, alpha: 1.0)
        
//        contentView.addSubview(tucanImageView)
//        contentView.addSubview(tucanTitleLabel)
//        contentView.addSubview(dateLabel)
        contentView.addSubview(tucanNameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tucanNameLabel.anchorEqualCenter(height: 100, width: 200)
//        tucanImageView.frame = CGRect(x: 8,
//                                      y: 8,
//                                      width: self.bounds.size.width - 16,
//                                      height: self.bounds.size.width - 16 )
//
//        tucanTitleLabel.frame = CGRect(x: 8,
//                                      y: tucanImageView.frame.maxY + 8,
//                                      width: self.bounds.size.width - 16,
//                                      height: 36)
//
//        dateLabel.frame = CGRect(x: 8,
//                                       y: tucanTitleLabel.frame.maxY + 8,
//                                       width: self.bounds.size.width - 16,
//                                       height: 12)
//
//        tucanNameLabel.frame = CGRect(x: 8,
//                                      y: dateLabel.frame.maxY + 8,
//                                      width: self.bounds.size.width - 16,
//                                      height: 60)

//         tucanNameLabel.numberOfLines = 4
        
//        tucanImageView.translatesAutoresizingMaskIntoConstraints = false
//        tucanImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        tucanImageView.heightAnchor.constraint(equalToConstant: 500).isActive = true
//        tucanImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        tucanImageView.centerYAnchor.constraint(equalTo: firstSuperView.centerYAnchor).isActive = true

    }
    
    func setData(image: UIImage?, text: String) {
        tucanImageView.image = UIImage(named: "frozen.jpg")!
        tucanNameLabel.text = text
        tucanTitleLabel.text = "Toucans Are An Amazing Birds"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.selectionStyle = .blue
    }
}
