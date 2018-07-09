//
//  ViewController.swift
//  ios-test
//
//  Created by 张斌 on 2018/7/9.
//  Copyright © 2018年 张斌. All rights reserved.
//

import UIKit
var count:Int = 0
class ViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        count+=1
        print("viewDidLoad?:\(count)")
        
        //创建label
        let label = UILabel(frame: CGRect(x:0,y:20,width:300,height:30))
        label.text = "hei,label,mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm,nnnnnnnnnnnnnnnnnnnnnnnnnnnnn"
        self.view.addSubview(label)
        label.backgroundColor = UIColor.cyan
        label.font = UIFont.systemFont(ofSize: 23)
        label.textColor = UIColor.red
        label.textAlignment = .center
        label.shadowColor = UIColor.blue
        label.shadowOffset = CGSize(width: 100, height: 100)
        label.numberOfLines = 0
        
        //button控件
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 60, width: 300, height: 50)
        button.backgroundColor = UIColor.white
        self.view.addSubview(button)
        button.setTitle("点一下", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.setImage(UIImage(named: "head"), for: .normal)
        button.titleEdgeInsets = UIEdgeInsetsMake(0,0,0,0)
        //button.imageEdgeInsets = UIEdgeInsetsMake(120,0,0,0)
        button.addTarget(self, action: #selector(to), for: .touchUpInside)
        
        //field 控件
        let field = UITextField(frame: CGRect(x: 0, y: 150, width: 300, height: 20))
        field.borderStyle = .roundedRect
        field.placeholder = "输入字符"
        view.addSubview(field)
        field.textAlignment = .center

//        let imageView = UIImageView(image: UIImage(named: "head"))
//        field.leftView = imageView
//        field.leftViewMode = .always
//        field.rightView = imageView
//        field.rightViewMode = .whileEditing
        
        //绑定事件
        field.delegate = self
        
        //Switch 开关控件
        let swi = UISwitch(frame: CGRect(x: 0, y: 220, width: 300, height: 30))
        view.addSubview(swi)
        swi.onTintColor = .green
        swi.tintColor = .red
        swi.thumbTintColor = .orange
        
        swi.addTarget(self, action: #selector(to), for: .touchUpInside)
        
        //page controller 绑定分页控制器
        let pc = UIPageControl(frame: CGRect(x: 0, y: 300, width: 300, height: 40))
        view.addSubview(pc)
        pc.currentPage = 2
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .black
        pc.numberOfPages = 8
        pc.addTarget(self, action: #selector(to), for: .valueChanged)
        
        //Segmented 分段控制器
        let seg = UISegmentedControl(items: ["one","2","3","four"])
        view.addSubview(seg)
        seg.frame = CGRect(x: 0, y: 360, width: 300, height: 50)
    
        seg.isMomentary = false
        seg.setImage(UIImage(named: "head")?.withRenderingMode(.alwaysOriginal), forSegmentAt: 2)
        seg.setContentOffset(CGSize(width: 10, height: 20), forSegmentAt: 0)
        seg.addTarget(self, action: #selector(pf), for: .valueChanged)
        seg.apportionsSegmentWidthsByContent = true //自适应宽度
        
        //slider 滑块
        let slider = UISlider(frame: CGRect(x: 0, y: 420, width: 300, height: 40))
        slider.isContinuous = true
        slider.maximumValue = 20
        slider.minimumValue = 0
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .green
        slider.thumbTintColor = .blue
        slider.addTarget(self, action: #selector(pf2), for: .valueChanged)
        view.addSubview(slider)
        
        //loading 控件
        let loading = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        loading.center = CGPoint(x: view.frame.size.width/2, y: 700)
        loading.color = .black
        view.addSubview(loading)
        loading.startAnimating()
        
        //
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count > 0{
            let charas:[Character] = ["0","1","2","4","5"]
            let char = string.first!
            if !charas.contains(char){
                print("请出入数字")
                return false
            }
            if textField.text!.count+string.count>11{
                print("超过11位")
                return false
            }
        }
        return true
    }
    
    @objc func to() {
        let vc =  NewViewController();
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func pf(seg:UISegmentedControl){
        print(seg.selectedSegmentIndex)
        seg.setTitle("测试\(seg.selectedSegmentIndex)", forSegmentAt: seg.selectedSegmentIndex)
    }
    
    @objc func pf2(slider:UISlider){
        print(slider.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        count+=1
        print("didReceiveMemoryWarning?:\(count)")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        count+=1
        print("init:\(count)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        count+=1
        print("init?:\(count),\(aDecoder)")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib();
        count+=1
        print("awakeFromNib:\(count)")
    }

    override func loadView() {
        super.loadView();
        count+=1
        print("loadView:\(count)")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        count+=1
        print("viewWillLayoutSubviews:\(count)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        count+=1
        print("viewWillLayoutSubviews:\(count)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        count+=1
        print("viewWillAppear:\(count)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        count+=1
        print("viewDidAppear:\(count)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        count+=1
        print("viewWillDisappear:\(count)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        count+=1
        print("viewDidDisappear:\(count)")
    }
    
    deinit {
        count+=1
        print("deinit:\(count)")
    }
}

