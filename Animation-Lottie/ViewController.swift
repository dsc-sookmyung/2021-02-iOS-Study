//
//  ViewController.swift
//  Animation-Lottie
//
//  Created by 고나미 on 2021/11/04.
//

import UIKit
import Lottie


class ViewController: UIViewController {
    
    let animationView: AnimationView = ()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        override func viewDidAppear( animate:Bool) {
            setup()
        }
    }
    
    func setup() {
        //animationView 크기가 view와 같도록 설정
        animationView.frame = view.bounds
        //사용할 JSON 파일의 이름을 적어준다.
        animationView.animation = Animation.named("82611-Done")
        animationView.contentMode = .scaleAspectFit
        //실행
        animationView.play()
        //view안에 Subview로 넣어준다,
        view.addSubview(animationView)
}
    
    
    
    let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(animationView)
        animationView.center = view.center
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myView.backgroundColor = .red
        myView.center = view.center
        view.addSubview(myView)
        
        
        //터치하면 애니메이션이 작동하는 버튼 만들기
        let button = UIButton(frame: CGRect(x: (view.frame.size.width-200)/2, y: view.frame.size.height-220, width: 200, height: 200))
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(animate), for: .touchUpInside)
        view.addSubview(button)
            
        }
    
       
        //애니메이션 효과를 설정한다. 버튼을 터치하면 1초 후에 myView가 지정한 크기만큼 커진 후 다시 원래 크기로 돌아온다.
        @objc func animate() {
            UIView.animate(withDuration: 1, animations: {
                self.myView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
                self.myView.center = self.view.center
            }, completion: {done in
                if done {
                    UIView.animate(withDuration: 1, animations: {
                        self.myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
                        self.myView.center = self.view.center

                })
                
            }
        })
        
     }
    

}
