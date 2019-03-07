
//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 村瀬美緒 on 2019/02/17.
//  Copyright © 2019 jp.techacademy.mio.murase. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    let image = ["img1","img2","img3"]
    
    
    var counter:Int = 0
    
    let imageNameArray = [
        "img1",
        "img2",
        "img3",
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let name = imageNameArray[dispImageNo]
        let image = UIImage(named: name);            imageView.image = image
        
    }
    
    
    @IBOutlet weak var PlayPause: UIButton!
    
    @IBOutlet weak var Prev: UIButton!
    
    @IBOutlet weak var Next: UIButton!
    
    //再生ボタンを押した時のメソッド
    @IBAction func PlayPause(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(displayImage), userInfo: nil, repeats: true)
      
        if self.timer != nil {
            print("再生中")
            
            
            PlayPause.setTitle("再生", for: UIControl.State.normal)
        
            
            
            Prev.isEnabled = true
            
            Next.isEnabled = true                }
        else {
            PlayPause.setTitle("停止", for: UIControl.State.normal)
            Prev.isEnabled = false
            
            Next.isEnabled = false
            
            
            
            
        }
    }
    
    
    
    
    @IBAction func onPrev(sender: AnyObject) {
        
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    @IBAction func onNext(sender: AnyObject) {
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    /// 表示している画像の番号を元に画像を表示する
    @objc func displayImage() {
        print("動作確認")
        // 画像の名前の配列
        //            let imageNameArray = [
        //                "img1",
        //                "img2",
        //                "img3",
        //                ]
        
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    
    
    @IBAction func CloseUp(_ sender: Any) {
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let ResultViewController = segue.destination as! ResultViewController
        
        ResultViewController.image = imageView.image
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
