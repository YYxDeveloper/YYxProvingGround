//
//  HYBOpenAnAccountViewController.swift
//  YYxProvingGround
//
//  Created by young.lu on 2019/8/26.
//  Copyright © 2019 002. All rights reserved.
//

import UIKit

class HYBOpenAnAccountViewController: UIViewController {
//     let headLabelsView = UIStackView()
//     let selectedView = UIStackView()
//     let bodyView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editHeadView()
        
    }
    func editHeadView() {
        let  fiveteen:CGFloat = 15
        
        
        
        let headContainerView = UIView()
        self.view.addSubview(headContainerView)
        headContainerView.backgroundColor = .yellow
        headContainerView.setAutoresizingFalse()
        
        let titlesContainerView = UIView()
        titlesContainerView.backgroundColor = .green
        headContainerView.addSubview(titlesContainerView)
        titlesContainerView.setAutoresizingFalse()

        let logoContainerView = UIStackView()
//        logoContainerView.backgroundColor = .red
        headContainerView.addSubview(logoContainerView)
        logoContainerView.distributeFillEqually(axis: .horizontal, marginSpace: 5)
        logoContainerView.setAutoresizingFalse()
        
      
        func editContainerViewlayout(){
            let topMargnSpace:CGFloat = 25
            let dividMarginSpace:CGFloat = fiveteen
            let bottomMarginSpace = fiveteen
            
            NSLayoutConstraint.activate([
                headContainerView.topAnchor.constraint(equalTo: safelayoutGuide.topAnchor),
                headContainerView.sameAsSuperViewLeadingAnchor(),
                headContainerView.sameAsSuperViewTrailingAnchor(),
                headContainerView.heightAnchor.constraint(equalToConstant: 130),
                
                titlesContainerView.sameAsSuperViewTopAnchor(margnSpace: topMargnSpace),
                titlesContainerView.bottomAnchor.constraint(equalTo: logoContainerView.topAnchor),
                titlesContainerView.heightAnchor.constraint(equalToConstant: 40),
               
                logoContainerView.topAnchor.constraint(equalTo: titlesContainerView.bottomAnchor),
                logoContainerView.sameAsSuperViewBottomAnchor(),
 
                logoContainerView.sameAsSuperViewLeadingAnchor(),
                titlesContainerView.sameAsSuperViewLeadingAnchor(),

                logoContainerView.sameAsSuperViewTrailingAnchor(),
                titlesContainerView.sameAsSuperViewTrailingAnchor(),

                
                ])
        }
        editContainerViewlayout()
        func editHeadBackgroundView(){
            let headBackgroundView = UIImageView()

            headContainerView.addSubview(headBackgroundView)
            headBackgroundView.setAutoresizingFalse()
            headBackgroundView.image = UIImage(named: "bg")

            let headForntgroundView = UIImageView()
            headContainerView.addSubview(headForntgroundView)
            headForntgroundView.setAutoresizingFalse()
            headForntgroundView.image = UIImage(named: "开户背景")

           NSLayoutConstraint.activate([
                headBackgroundView.sameAsSuperViewTopAnchor(),
                headBackgroundView.sameAsSuperViewLeadingAnchor(),
                headBackgroundView.sameAsSuperViewTrailingAnchor(),

                headForntgroundView.sameAsSuperViewTopAnchor(),
                headForntgroundView.sameAsSuperViewLeadingAnchor(),
                headForntgroundView.sameAsSuperViewTrailingAnchor(),


           ])
        }
        editHeadBackgroundView()
        
        headContainerView.bringSubviewToFront(titlesContainerView)
        headContainerView.bringSubviewToFront(logoContainerView)
        
        func editTitlesView(){
            let k8LogoImageView = UIImageView()
            titlesContainerView.addSubview(k8LogoImageView)
            k8LogoImageView.image = UIImage(named: "合作logo白色")
            k8LogoImageView.setAutoresizingFalse()
            
            let dividView = UIView()
            titlesContainerView.addSubview(dividView)
            dividView.backgroundColor = .white
            dividView.setAutoresizingFalse()
            
            let aboveDescribLabel = UILabel()
            aboveDescribLabel.text = "亚洲区唯一"
            aboveDescribLabel.font.withSize(24)
            aboveDescribLabel.textColor = .white
            titlesContainerView.addSubview(aboveDescribLabel)
            aboveDescribLabel.setAutoresizingFalse()
            
            let beloweDescribLabel = UILabel()
            beloweDescribLabel.text = "博彩合作伙伴"
            beloweDescribLabel.font.withSize(24)
            beloweDescribLabel.textColor = .white
            titlesContainerView.addSubview(beloweDescribLabel)
            beloweDescribLabel.setAutoresizingFalse()
            
           
            NSLayoutConstraint.activate([
                k8LogoImageView.sameAsSuperViewTopAnchor(),
                dividView.sameAsSuperViewTopAnchor(),
                aboveDescribLabel.sameAsSuperViewTopAnchor(),
                
                k8LogoImageView.sameAsSuperViewBottomAnchor(),
                dividView.sameAsSuperViewBottomAnchor(),
                beloweDescribLabel.sameAsSuperViewBottomAnchor(),
                
                dividView.centerXAnchor.constraint(equalTo: dividView.firstSuperView.centerXAnchor),
                dividView.widthAnchor.constraint(equalToConstant: 1),
//
                k8LogoImageView.trailingKissLeading(withView: dividView,marginSpace: 15),
                k8LogoImageView.widthAnchor.constraint(equalToConstant: 50),
                
                aboveDescribLabel.leadingKissTrailing(withView: dividView,marginSoace: 15),
                beloweDescribLabel.leadingKissTrailing(withView: dividView,marginSoace: 15)
            ])
            
            
        }
        editTitlesView()
        func editlogosView(){
            let logoView = UIView()
            logoView.backgroundColor = .blue
            logoContainerView.addSubview(logoView)
            logoContainerView.addArrangedSubview(logoView)

            let logoView1 = UIView()
            logoView1.backgroundColor = .orange
            logoContainerView.addSubview(logoView1)
           logoContainerView.addArrangedSubview(logoView1)
            
//            let k8LogoImageView = UIImageView()
//            logoView.addSubview(k8LogoImageView)
//            k8LogoImageView.image = UIImage(named: "合作logo白色")
//            k8LogoImageView.setAutoresizingFalse()
//
//            let aboveDescribLabel = UILabel()
//            aboveDescribLabel.text = "亚洲区唯一"
//            aboveDescribLabel.font.withSize(24)
//            aboveDescribLabel.textColor = .white
//            logoView.addSubview(aboveDescribLabel)
//            aboveDescribLabel.setAutoresizingFalse()
//
//            let beloweDescribLabel = UILabel()
//            beloweDescribLabel.text = "博彩合作伙伴"
//            beloweDescribLabel.font.withSize(24)
//            beloweDescribLabel.textColor = .white
//            logoView.addSubview(beloweDescribLabel)
//            beloweDescribLabel.setAutoresizingFalse()
            
//             NSLayoutConstraint.activate([
//                logoView.sameAsSuperViewTopAnchor(margnSpace: 20),
//                logoView.sameAsSuperViewLeadingAnchor(margnSpace: 40),
//                logoView.sameAsSuperViewTrailingAnchor(margnSpace: 40),
//                logoView.sameAsSuperViewBottomAnchor()
//                ])
            
//            logoContainerView.addArrangedSubview(<#T##view: UIView##UIView#>)
//            NSLayoutConstraint.activate([
//                k8LogoImageView.sameAsSuperViewTopAnchor(),
//                aboveDescribLabel.sameAsSuperViewTopAnchor(),
//
//                k8LogoImageView.sameAsSuperViewBottomAnchor(),
//                beloweDescribLabel.sameAsSuperViewBottomAnchor(),
//
//                k8LogoImageView.sameAsSuperViewLeadingAnchor(),
//                //
//                k8LogoImageView.trailingKissLeading(withView: aboveDescribLabel,marginSpace: 15),
//                k8LogoImageView.widthAnchor.constraint(equalToConstant: 50),
//
//                aboveDescribLabel.leadingKissTrailing(withView: k8LogoImageView,marginSoace: 15),
//                beloweDescribLabel.leadingKissTrailing(withView: k8LogoImageView,marginSoace: 15)
//                ])
          
         
            
        }
        editlogosView()
       
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
