//
//  ViewController+View.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/7/19.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import UIKit

extension ViewController{
    func exampleHideStatusBarOnlyOnce() {
        //https://medium.com/@JJeremy.XUE/swift-玩玩-status-bar-狀態列-df4e17691da8
        //由於只能複寫之後都是read only因此只能在初始化時設定一次
        //-可全專案或個別VC設定
//        override var prefersStatusBarHidden: Bool {
//        return true
//        }
    }
    func exampleSameAsConstraint()  {
        let aa = UIView()
        aa.backgroundColor = .blue
        self.containerView.addSubview(aa)
        aa.sameAsSuperViewTopAndBottomAnchor()
        aa.widthAnchor.constraint(equalToConstant: 10).isActive = true
        aa.centerXAnchor.constraint(equalTo: aa.firstSuperView.centerXAnchor).isActive = true
        
    }
    func exampleAddBoardLayer() {
        containerView.layer.addBordLayer(witchColor: .blue, width: 2)
    }
    func exampleProgrammaticallyTableViewController()  {
        addSubViewWithChildController(addSubViewController: ProgrammaticallyTableViewController(), toWitchView: containerView)
    }
    func exampleProgrammaticallyCustomTableViewController()  {
        addSubViewWithChildController(addSubViewController: ProgrammaticallyCustomTableViewController(), toWitchView: containerView)
    }
    func exampleYYxButton()  {
        let aa =  YYxButton(frame: containerView.bounds)
        
        containerView.addSubview(aa)
    }
    func exampleRandomCGflotMultiplier() {
        let aa = CGFloat.giveMeMultiplierValue()
        print(aa)
        
    }
    func exampleStackView() {
        var buttons = [UIButton]()
        for i in 1 ... 3 {
            let btn = UIButton(type: .system)
            btn.setTitle("Button \(i)", for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            buttons.append(btn)
        }
        
        //https://medium.com/@JJeremy.XUE/swift-%E8%AA%AA%E8%AA%AA-%E5%A0%86%E7%96%8A%E8%A6%96%E5%9C%96-uistack-view-557c09f24645
        let stackView = UIStackView(arrangedSubviews: buttons)
       stackView.distributeFillEqually(axis: .vertical, marginSpace: 10)
        view.addSubview(stackView)
      
        
        self.containerView.addSubview(stackView)
        stackView.anchorEqualParentView()
        
//          stackView.setCustomSpacing(30, after: buttons.first!)

    }
    func exampleConstraintAnchor() {
        // autolayout
        let view = UIView()
        view.backgroundColor = .green
        
        let margins = view.layoutMarginsGuide
        
        let label = UILabel(frame: .zero)
        label.backgroundColor = .yellow
        label.text = "Hello Layout Constraints"
        view.addSubview(label)
        
        let label2 = UILabel(frame: .zero)
        label2.backgroundColor = .orange
        label2.text = "Another Label"
        view.addSubview(label2)
        
        var buttons = [UIButton]()
        for i in 1 ... 3 {
            let btn = UIButton(type: .system)
            btn.setTitle("Button \(i)", for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            buttons.append(btn)
        }
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.spacing = 10
        view.addSubview(stackView)
        stackView.setCustomSpacing(30, after: buttons.first!)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            label2.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            label2.widthAnchor.constraint(equalToConstant: 200),
            
            stackView.leadingAnchor.constraint(equalTo: label2.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.heightAnchor.constraint(equalTo: label.heightAnchor),
            label.heightAnchor.constraint(equalTo: stackView.heightAnchor),
            label2.heightAnchor.constraint(equalTo: stackView.heightAnchor),

            
            ])
        
        self.view = view
    
    }
    func exampleProgrammaticallyStackView() {
        func hideContainerView(){
            containerView.isHidden = true
        }
       hideContainerView()
        
        let rows: [[(String, Int)]] = [               //two dimensional array of tuples: 6 rows by 2 columns
            [("rat",    2008), ("ox",      2009)],
            [("tiger",  2010), ("rabbit",  2011)],
            [("dragon", 2012), ("snake",   2013)],
            [("horse",  2014), ("goat",    2015)],
            [("monkey", 2016), ("rooster", 2017)],
            [("dog",    2018), ("pig",     2019)]
        ];
        
        print("\(rows.count) rows, \(rows[0].count) columns");
        let color: UIColor = UIColor(red: 189/255, green: 7/255, blue: 17/255, alpha: 1);
        let spacing: CGFloat = 18; //spacing in all vertical UIStackViews except the smallest
        
        //Create the title label.
        
        let title: UILabel = UILabel();
        title.backgroundColor = color;
        title.font = UIFont(name: "Copperplate", size: 30);
        title.textColor = .white;
        
        title.text = " Chinese Zodiac ";   //spaces to allow rounded corners
        title.frame.size = title.intrinsicContentSize;
        title.layer.cornerRadius = title.frame.height / 2;
        title.layer.masksToBounds = true;
        let titleHeightConstraint: NSLayoutConstraint = title.heightAnchor.constraint(equalToConstant: title.frame.height);
        titleHeightConstraint.isActive = true;
        
        let bigVerticalStackView: UIStackView = UIStackView();  //will contain signs.count horizontal stack views
        bigVerticalStackView.axis = .vertical;
        bigVerticalStackView.distribution = .fillEqually;
        bigVerticalStackView.spacing = 18;
        var aa = 0
        for row in rows {
            let horizontalStackView: UIStackView = UIStackView();
            horizontalStackView.axis = .horizontal;
            horizontalStackView.distribution = .fillEqually;
            bigVerticalStackView.addArrangedSubview(horizontalStackView);
            
            for sign in row {
                guard let image: UIImage = UIImage(named: sign.0) else {
                    continue; //Don't return.  Maybe we can get other signs to work.
                }
                aa = aa + 1
                print("aa = \(aa)")
                let imageView: UIImageView = UIImageView(image: image);
                imageView.contentMode = .scaleAspectFit;   //Do not distort.
                
                let label: UILabel = UILabel();
                label.backgroundColor = color;
                label.font = UIFont(name: "Copperplate", size: 18);
                label.textColor = .white;
                label.text = " \(sign.0.capitalized): \(sign.1) ";   //spaces to allow rounded corners
                label.frame.size = label.intrinsicContentSize;
                label.layer.cornerRadius = label.frame.height / 2;
                label.layer.masksToBounds = true;
                
                let heightConstraint: NSLayoutConstraint = label.heightAnchor.constraint(equalToConstant: label.frame.height);
                heightConstraint.isActive = true;
                
                let smallVerticalStackView: UIStackView = UIStackView();
                smallVerticalStackView.axis = .vertical;
                smallVerticalStackView.distribution = .fill;
                smallVerticalStackView.alignment = .center;
                smallVerticalStackView.addArrangedSubview(imageView);
                smallVerticalStackView.addArrangedSubview(label);
                horizontalStackView.addArrangedSubview(smallVerticalStackView);
            }
            
            aa = 0
        }
        
        //The biggest stack view contains the title and all the signs.
        
        let biggestVerticalStackView: UIStackView = UIStackView();
        biggestVerticalStackView.axis = .vertical;
        biggestVerticalStackView.alignment = .center;
        biggestVerticalStackView.spacing = spacing;
        biggestVerticalStackView.translatesAutoresizingMaskIntoConstraints = false;
        biggestVerticalStackView.addArrangedSubview(title);
        biggestVerticalStackView.addArrangedSubview(bigVerticalStackView);
        view.addSubview(biggestVerticalStackView);
        
        //Make the biggestVerticalStackView be coterminous
        //with the safe area of the big white view.
        
        let top: NSLayoutConstraint = biggestVerticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor);
        top.isActive = true;
        
        let bottom: NSLayoutConstraint = biggestVerticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor);
        bottom.isActive = true;
        
        let leading: NSLayoutConstraint = biggestVerticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor);
        leading.isActive = true;
        
        //Don't have to give a name to the instance of NSLayoutConstraint.
        biggestVerticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true;
    }
    
}
