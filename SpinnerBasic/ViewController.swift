//
//  ViewController.swift
//  SpinnerBasic
//
//  Created by dinhphu98 on 4/18/18.
//  Copyright © 2018 dinhphu98. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        download(from: "http://i.imgur.com/qV5uuOz.jpg")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    
    func download(from urlString: String) {
        if let url = URL(string: urlString) {
            spinner.startAnimating()
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                        self.spinner.stopAnimating()
                        self.spinner.isHidden = true
                    }
                }
            }
        }
    }
    
}
