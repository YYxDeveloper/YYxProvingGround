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
import Combine

extension ViewController{
    func exampleFontLength()  {
        fontTestLabel.text = "xxx"
        let aa = fontTestLabel.fontWidth
        print(aa)
    }
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
    func exampleCustomFlag() {
        #if DEBUGtoNAVI
        //survey keynote "flag"
        print("DEBUGtoNAVI")
        #else
        print("else of DEBUGtoNAVI")
        #endif
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
        self.cookingTimer.countingTime.addObserver{ (timeStr,sec) in
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
    func exampleCompareDateIsEqual() {
          let currentYear = Calendar.current.component(.year, from: Date())

                let dateComponents = DateComponents(calendar: Calendar.current,year: currentYear, month: 2, day: 7, hour: 18, minute: 30)
                let aadateComponents = DateComponents(calendar: Calendar.current,year: currentYear, month: 2, day: 7, hour: 18, minute: 20)

                let cc = dateComponents.date
                let yy = aadateComponents.date
                if let yy = yy, let cc = cc {
                    if yy == cc {
                        print("ccc")
                    }else{
                        print("aaa")
                    }
                }
      }
    func exampleSliderViewController() {
        let vc = SliderViewController()
        
        addSubViewWithChildController(addSubViewController: vc, toWitchView: containerView)
        
    }
    @available(iOS 13.0, *)
    @available(iOS 13.0, *)
    
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
    @available(iOS 13.0, *)
    func exampleCombine_assign() {
        //Assign 可以很方便地将接收到的值通过 KeyPath 设置到指定的 Class 上（不支持 Struct）
        
        
        class Student {
            let name: String
            var score: Int
            
            init(name: String, score: Int) {
                self.name = name
                self.score = score
            }
        }
        
        
        let student = Student(name: "Jack", score: 90)
        print(student.score)
        let observer = Subscribers.Assign(object: student, keyPath: \.score)
        let publisher = PassthroughSubject<Int, Never>()
        publisher.subscribe(observer)
        publisher.send(91)
        print(student.score)
        publisher.send(100)
        print(student.score)
        
        
    }
    /**
     https://www.jianshu.com/p/df8535b40079
     */
    @available(iOS 13.0, *)
    func exampleCombine_sink() {
        
    }
    @available(iOS 13.0, *)
    func exampleCombine_CurrentValueSubject() {
//        CurrentValueSubject : 包含单个值并且当值改变时发布新元素的subject
        let a = CurrentValueSubject<Int, NSError>(1)
        a.sink(receiveCompletion: {
            print("xx11\($0)")
        }, receiveValue: {
            print("xx22\($0)")
        })
        
        a.value = 2
        a.value = 3
        a.send(4)
//        a.send(completion: Subscribers.Completion<NSError>.finishe         a.send(completion: Subscribers.Cocxmpletion<NSError>.failure(NSError(domain: "domain", code: 500, userInfo: ["errorMsg":"error"])))
        a.value = 5
    }
    
}

