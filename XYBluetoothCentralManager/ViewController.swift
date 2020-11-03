//
//  ViewController.swift
//  XYBluetoothCentralManager
//
//  Created by macvivi on 2020/10/29.
//  Copyright © 2020 macvivi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    var peripheralArray: [CBPeripheral] = []
    
    @IBAction func scanClick(_ sender: Any) {
        print("开始扫描")
        BluetoothManager.sharedInstance.startScan { (peripheral) in
            self.syncData()
        }
    }
    
    @IBAction func stopClick(_ sender: Any) {
        print("停止扫描")
        BluetoothManager.sharedInstance.stopScan()
        syncData()
    }
    
    func syncData() {
        self.peripheralArray = BluetoothManager.sharedInstance.peripheralArray as! [CBPeripheral]
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
         BluetoothManager.sharedInstance.startScan { (peripheral) in
                   self.syncData()
               }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peripheralArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let peripheral = peripheralArray[indexPath.row]
        cell.textLabel?.text = (peripheral.name != nil) ? peripheral.name : "无蓝牙名"
        cell.detailTextLabel?.text = peripheral.identifier.uuidString
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

