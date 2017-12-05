//
//  ViewController.swift
//  CustomCollectionLayout_Leon
//
//  Created by lai leon on 2017/10/17.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

let YHRect = UIScreen.main.bounds
let YHHeight = YHRect.size.height
let YHWidth = YHRect.size.width
let YHNoNavRect = CGRect(x: 0, y: 0, width: YHWidth, height: YHHeight - 64)
let YHNoTarRect = CGRect(x: 0, y: 0, width: YHWidth, height: YHHeight - 49)
let YHNoNavTarRect = CGRect(x: 0, y: 0, width: YHWidth, height: YHHeight - 49 - 64)

class ViewController: UIViewController {
    let tableView: UITableView = {
        let tableView = UITableView(frame: YHNoNavRect, style: .plain)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        return tableView
    }()
    let reuseIdentifier = String(describing: UITableViewCell.self)
    let datas = ["瀑布流", "圆形", "线性"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
    }


    private func setupView() {
        title = "选择布局"
        edgesForExtendedLayout = []
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = datas[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 5))
        cell.textLabel?.textColor = .orange
        cell.textLabel?.textAlignment = .center
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let show = ShowViewController()
        show.title = datas[indexPath.row]
        switch datas[indexPath.row] {
        case "瀑布流":
            show.style = "waterfall"
        case "圆形":
            show.style = "circle"
        default:
            show.style = "line"
        }
        navigationController?.pushViewController(show, animated: true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}