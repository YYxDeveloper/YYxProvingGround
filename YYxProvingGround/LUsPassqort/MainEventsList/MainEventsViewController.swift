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
    let names = ["魔國臻","bbbbb"]
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

extension MainEventsViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell =  tableView.dequeueReusableCell(withIdentifier: "MainEventTableViewCell", for: indexPath) as! MainEventTableViewCell
        cell.eventTitle.text = names[indexPath.row]
          return cell
      }
}
