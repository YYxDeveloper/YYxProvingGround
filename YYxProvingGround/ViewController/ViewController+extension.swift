//
//  ViewCOntroller+extension.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/5/9.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

//------------
//https://stackoverflow.com/questions/37442593/custom-operator-to-simplify-if-let
infix operator ?=
func ?= <T>( left: inout T, right: T?) {
    if let right = right {
        left = right
    }
}

// overload to deal with an optional left handed side
func ?= <T>( left: inout T?, right: T?) {
    if let right = right {
        left = right
    }
}
//---------
extension Suit: CaseIterable {}
enum Suit: String {
    case spades = "♠"
    case hearts = "♥"
    case diamonds = "♦"
    case clubs = "♣"
}

//
extension ViewController{
    enum theJSonModel {
        case UserInformationsJsonExample
        case exampleDictionaryStructure
    }
    func exampleDecodeJsonDatabyUtf8(witchModel:theJSonModel) {
        switch witchModel {
        case .exampleDictionaryStructure:
            FileManager.default.decodeJsonDatabyUtf8FromBundle(fileName: "exampleDictionaryStructure", modelType: EachPartItems.self, compelete: { data in
                print(data)
            })
        case .UserInformationsJsonExample:
            FileManager.default.decodeJsonDatabyUtf8FromBundle(fileName: "UserInformationsJsonExample", modelType: UserInformations.self.self, compelete: { data in
                print(data)
            })
            
        }
       
    }
    func examplePrepocessorMarco() {
        #if DEBUG
            print("DEBUG MODEL")
        #else
            print("RELEASE MODEL")
        #endif
    }
    func exmapleGetInfoPlistData()  {
//        FileManager.default.showInfoPlistData()
       _ = FileManager.default.checkInfoPlistData()
        
    }
    func exampleMVVMBindingForInstance()  {
        self.cookingTimer.start()
        self.cookingTimer.countingTime.addObserver{ [weak self] (timeStr,sec) in
                        print("!!\(timeStr)")
            //             print("!!@\(sec)")
            
            
        }
    }
    func exampleTintView()  {
        let tintView = TintView.init(frame: containerView.bounds)
        self.containerView.addSubview(tintView)
    }
    //
    func exampleCreateOwnDynamicTableViewController()   {
        
        self.addSubViewWithChildController(addSubViewController: reactDefaultUITableViewController, toWitchView: view)
         let fakeDatas = ["ray","sam","bill","jay","11ray","11sam","11bill","j11ay","11ray","22sam","22bill","22jay","r22ay","33sam","33bill","33jay","ray","sam","bill","jay","ray","sam","bill","jay","ray","sam","bill","jay","ray","sam","bill","jay"]
        reactDefaultUITableViewController.presenter.updateDatasFirstTime(cellRequiment: fakeDatas)
        

        
    }
    func exampleColumnCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        let featuredAppController = FormCollectionVeiwController(collectionViewLayout: layout)
        
        addSubViewWithChildController(addSubViewController: featuredAppController, toWitchView: view)
        
        
    }
    func exampleHorizontalSlider() {
        addHorizontalSliderWithHeigh50(toWitchView: containerView)
    }
    func exampleTabbedViewController() {
        let tVC = UIViewController.giveMeViewControllerFromStoryBoard(storyBoardName: "TabbedViewController", storyBoardID: "TabbedViewController")
        addSubViewWithChildController(addSubViewController: tVC, toWitchView: view)
    }
    func examplePullRefrsh() {
        //https://www.appcoda.com.tw/custom-pull-to-refresh/
        let tb = UITableView(frame: containerView.bounds)
        tb.backgroundColor = .red
        containerView.addSubview(tb)
        
        
        refreshControl = UIRefreshControl()
        
        refreshControl.backgroundColor = UIColor.yellow
        refreshControl.tintColor = UIColor.blue
        
        tb.addSubview(refreshControl)
        
        //close:  refreshControl.endRefreshing()
        
    }
    func exampleWakeMeOnce() {
      Timer.wakeMeOnce(duration: 5, repeats: false, timeUp: {
            print(("sss"))
      })
    }
    func exampleLocalization() {
        turnBtn.setTitle(LocalizableMan.giveMeLocalizedString(withKey: "aa"), for: .normal)
    }
    func exampleReadJsonFileWithBundle() {
        FileManager.default.decodeJsonDatabyUtf8FromBundle(fileName: "exampleTOEICVocabulary", modelType: TOEICVocabularyModel.self, compelete: {data in
            
            print(data.eachVocabularys)
        })
    }
    func exampleGenerateUUID() {
        let uuid = String.giveMeRandomUUID()
        print(uuid)

    }
    func exampleCalender() {
        //just change initView to CalenderViewController in story board
    }
    func exampleSliderViewController() {
        let vc = SliderViewController()
        
        addSubViewWithChildController(addSubViewController: vc, toWitchView: containerView)
        
    }
    func exampleVisualFormat() {
        
        var cellTopView: UIView = {
            
            let view = UIView()
            view.backgroundColor = UIColor.cyan
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
            
            
        }()
        
        var cellBottomRightButton: UIButton = {
            
            let button = UIButton()
            button.backgroundColor = UIColor.gray
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
            
            
        }()
        
        
        var cellBottomLeftButton: UIButton = {
            
            let button = UIButton()
            button.backgroundColor = UIColor.blue
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
            
            
        }()
        func configureCell()  {
            
            
            self.containerView.addSubview(cellTopView)
            self.containerView.addSubview(cellBottomRightButton)
            self.containerView.addSubview(cellBottomLeftButton)
            
            let viewDictionary:[String:Any] = [
                "cellTopView":cellTopView,
                "cellBottomRightButton":cellBottomRightButton,
                "cellBottomLeftButton":cellBottomLeftButton
            ]
            
            self.containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-2-[cellTopView]-2-|" , options: .init(rawValue: 0), metrics: nil, views: viewDictionary))
            
            self.containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-2-[cellBottomLeftButton]-2-[cellBottomRightButton(cellBottomLeftButton)]-2-|" , options: .init(rawValue: 0), metrics: nil, views: viewDictionary))
            
            self.containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-2-[cellTopView]-2-[cellBottomLeftButton(cellTopView)]-2-|" , options: .init(rawValue: 0), metrics: nil, views: viewDictionary))
            
            self.containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-2-[cellTopView]-2-[cellBottomRightButton(cellTopView)]-2-|" , options: .init(rawValue: 0), metrics: nil, views: viewDictionary))
            
            
            
        }
        configureCell()
    }
    // MARK: extension Array & Enum
    func examplePrintEnumToArray(){
        //tip: must follow CaseIterable
        Suit.allCases.forEach {
            print($0.rawValue)
        }
        
    }
    
}

