//
//  ViewController.swift
//  iosfilehandlingstudy
//
//  Created by kenan on 25.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customTf: UITextField!
    
    @IBOutlet weak var customImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func write(_ sender: UIButton) {
        let message:String = customTf.text!
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let filePath = dir.appendingPathComponent("dosyam.txt")
            do{
                try message.write(to: filePath, atomically: false, encoding: String.Encoding.utf8)
                customTf.text = ""
            }catch{
                print("Dosya yazılırken hata oluştu")
            }
        }
    }
    

    @IBAction func read(_ sender: UIButton) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let filePath = dir.appendingPathComponent("dosyam.txt")
            if FileManager.default.fileExists(atPath: filePath.path){
                do{
                    customTf.text = try String(contentsOf: filePath,encoding: String.Encoding.utf8)
                }catch{
                    print("dosya yazılırken hata oluştu.")
                }
            }
        }
    }
    
   
    @IBAction func deleteFile(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let filePath = dir.appendingPathComponent("dosyam.txt")
            if FileManager.default.fileExists(atPath: filePath.path){
                do{
                    try FileManager.default.removeItem(at: filePath)
                    customTf.text = ""
                }catch{
                    print("Dosya okurken hata oluştu.")
                }
            }
        }
    }
    
    @IBAction func save(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let filePath = dir.appendingPathComponent("resimim.png")
            let image = UIImage(named: "resim")
            
            do{
                try image?.pngData()?.write(to: filePath)
            }catch{
                print("Dosya yazılırken hata oluştu")
            }
        }
    }
    
    @IBAction func show(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let filePath = dir.appendingPathComponent("resimimg.png")
            self.customImageView.image =  UIImage(contentsOfFile: filePath.path)
        }
    }
    
    @IBAction func deleteImage(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let filePath = dir.appendingPathComponent("resimim.png")
            
            if FileManager.default.fileExists(atPath: filePath.path){
                do{
                    try FileManager.default.removeItem(at: filePath)
                }catch{
                    print("Resim silinirken hata oluştu.")
                }
            }
            
        }
    }
    
}

