//
//  ViewController.swift
//  FirstApp
//
//  Created by Kydyrgazy Sailau on 19.12.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let myDiamond: UIImageView = {
        let diamondImage = UIImageView()
        diamondImage.image = UIImage(named: "diamond")
        return diamondImage
    }()
    
    var richLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.text = "I'm RICH"
        label.textColor = .red
        return label
    }()
    
    var button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor (ciColor: .green)
        button.layer.cornerRadius = 15
        button.sizeToFit()
        button.setTitleColor(.black, for: .focused)
        button.setTitle("💵CLICK ME💵", for: .normal)
        return button
    }()
    
    var money: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Money: "
        label.textColor = .red
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemMint
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        setupView()
        setupConstrains()
    }
    @objc func buttonTapped(){
        money.text = "Money: \(Int.random(in: 0..<9999)) $"
    }
}


// MARK: - Setup views and constrains methods

private extension ViewController {
func setupView() {
view.addSubview(myDiamond)
view.addSubview(richLabel)
view.addSubview(button)
view.addSubview(money)
}
func setupConstrains() {
    richLabel.snp.makeConstraints { make in
        make.centerX.equalToSuperview()
        make.bottom.equalTo(myDiamond.snp.top)
    }
    myDiamond.snp.makeConstraints { make in
        make.center.equalToSuperview()
        make.width.height.equalTo(300)
    }
    button.snp.makeConstraints { make in
        make.centerX.equalToSuperview()
        make.height.equalTo(50)
        make.width.equalTo(150)
        make.bottom.equalTo(money.snp.top).offset(-20)
    }
    money.snp.makeConstraints { make in
        make.centerX.equalToSuperview()
        make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(100)
    }
    }
}
