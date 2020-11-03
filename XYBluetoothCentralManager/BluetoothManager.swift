//
//  BluetoothManager.swift
//  CycleBike
//
//  Created by macvivi on 2020/10/28.
//  Copyright © 2020 macvivi. All rights reserved.
//

import UIKit

class BluetoothManager: NSObject, XXCoreBluetoothManagerDelegate {

    //创建单例
    static let sharedInstance = BluetoothManager()
    
    //蓝牙是否开启
    var bluetoothState: Bool {
        return (XXCoreBluetoothManager.shareInstance()?.isBluetoothAvailabel())!
    }
    
    //己经搜索到的蓝牙外设数组
    var peripheralArray: NSMutableArray {
        (XXCoreBluetoothManager.shareInstance()?.scanArr)!
    }
    
    override init() {
        super.init()
        XXCoreBluetoothManager.shareInstance()?.delegate = self
    }
    
    //扫描完已经扫描到的外设会被保存到peripheralArray数组中
    func startScan(findPeripheral: @escaping (CBPeripheral) -> Void) {
        XXCoreBluetoothManager.shareInstance()?.startScan({ (peripheral) in
            findPeripheral(peripheral!)
        })
    }
    
    //停止扫描
    func stopScan() {
        //清空外设数组
        XXCoreBluetoothManager.shareInstance()?.scanArr = NSMutableArray()
        XXCoreBluetoothManager.shareInstance()?.stopScan()
    }
    
    //连接（自动）
       
    
    //发数据
    func sendData() {
        print("调用方法")
    }

    //收数据
    func getData(_ data: Data!) {
        
    }
    
    

    
}
