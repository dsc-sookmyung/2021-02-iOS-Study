import UIKit
import Lottie

class LottieController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text =  "메인 화면"
        label.font = UIFont.boldSystemFont(ofSize: 70)
        
        return label
    }()
    
    let animationView: AnimationView = {
        
        let animView = AnimationView(name: "83395-addland-heatfav-v2")
        animView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        
        animView.contentMode = .scaleAspectFill
        
        return animView
    }()

    //뷰가 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .black
        view.addSubview(animationView)
        animationView.center = view.center
        
        //애니메이션 실행
        animationView.play{ (finish) in
            //
            print("애니메이션이 끝났다.")
            
            self.view.backgroundColor = .white
            self.animationView.removeFromSuperview()
            
            self.view.addSubview(self.titleLabel)
            
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        }
        
    }

}

