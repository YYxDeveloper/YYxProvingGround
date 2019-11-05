//
//  MainEventsViewController.swift
//  YYxProvingGround
//
//  Created by young.lu on 2019/10/30.
//  Copyright © 2019 002. All rights reserved.
//

import UIKit
//for now just example of custom tableView
class MainEventsViewController: UIViewController {
  
    
    @IBOutlet weak var eventList: UITableView!
    let names = ["魔國臻","bbbbb","廣末涼子","國國國國國"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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

extension MainEventsViewController:UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell =  tableView.dequeueReusableCell(withIdentifier: "MainEventTableViewCell", for: indexPath) as! MainEventTableViewCell
        cell.eventTitle.text = names[indexPath.row]
        
        cell.reloadLayout()

          return cell
      }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "MainEventTableViewCell", for: indexPath) as! MainEventTableViewCell

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        eventList.reloadData()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let cell =  eventList.cellForRow(at: IndexPath(row: 0, section: 0)) as! MainEventTableViewCell
        cell.layoutView.layer.removeAllAnimations()
//        button.layer.removeAllAnimations()
//        button.layer.transform = CATransform3DIdentity
    }
    
}
