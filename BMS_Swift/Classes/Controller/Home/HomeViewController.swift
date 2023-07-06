//
//  HomeViewController.swift
//  BMS_Swift
//
//  Created by MAC on 26.6.23.
//

import UIKit

class HomeViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: self.view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        cell?.textLabel?.text = "\(indexPath.section) - \(indexPath.row)"
        cell?.textLabel?.textColor = getRandomColor()
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
//        let secondVC = SecondViewController()
//        secondVC.hidesBottomBarWhenPushed = true
        
//        self.navigationController?.pushViewController(secondVC, animated: true)
        self.customNavigationMethod(nextVC: SecondViewController())
    }
}

//导航一起滚动设置
//extension HomeViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        var offsetY = scrollView.contentOffset.y
//        if #available(iOS 11.0, *) {
//            offsetY += scrollView.adjustedContentInset.top
//        }
//        self.vhl_navTranslationY = min(0, -offsetY)
//    }
//}
