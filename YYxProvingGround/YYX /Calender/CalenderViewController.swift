//
//  ViewController.swift
//  myCalender2
//
//  Created by Muskan on 10/22/17.
//  Copyright © 2017 akhil. All rights reserved.
//

import UIKit

enum MyTheme {
    case light
    case dark
}

class CalenderViewController: UIViewController,WWCalendarTimeSelectorProtocol {
    
    var theme = MyTheme.dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.title = "My Calender"
//        self.navigationController?.navigationBar.isTranslucent=false
//        self.view.backgroundColor=Style.bgColor
//
//        //
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
//
//        view.addSubview(calenderView)
//        calenderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive=true
//        calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
//        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
//        //calenderView hieht is constant = 365
//        calenderView.heightAnchor.constraint(equalToConstant: 365).isActive=true
////        calenderView.backgroundColor = .red
//
//        let rightBarBtn = UIBarButtonItem(title: "Light", style: .plain, target: self, action: #selector(rightBarBtnAction))
//        self.navigationItem.rightBarButtonItem = rightBarBtn
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    @objc func rightBarBtnAction(sender: UIBarButtonItem) {
        if theme == .dark {
            sender.title = "Dark"
            theme = .light
            Style.themeLight()
        } else {
            sender.title = "Light"
            theme = .dark
            Style.themeDark()
        }
        self.view.backgroundColor=Style.bgColor
        calenderView.changeTheme()
    }
    
    let calenderView: CalenderView = {
        let v=CalenderView(theme: MyTheme.dark)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
   
    
}

