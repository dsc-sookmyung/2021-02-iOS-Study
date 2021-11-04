import UIKit

class ViewController: UIViewController {
    
    let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myView.backgroundColor = .red
        myView.center = view.center
        view.addSubview(myView)
        
        let button = UIButton(frame: CGRect(x: (view.frame.size.width - 200)/2, y: view.frame.size.height - 220, width: 200, height: 70))
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("start", for: .normal)
        button.addTarget(self, action: #selector(animate), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func animate() {
        /*
        UIView.animate(withDuration:  1, animations:{
            //self.myView.alpha = 0.0
            
            /*
            self.myView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            self.myView.center = self.view.center
            */

            self.myView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            
        })*/
        
        UIView.animate(withDuration: 1, animations: {
            self.myView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            self.myView.center = self.view.center
        }, completion: { done in
            if done {
                /*
                UIView.animate(withDuration: 1, animations: {
                    self.myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
                    self.myView.center = self.view.center
                })
                */
                
                self.shrink()
                
            }
        })
    }
    
    func shrink () {
        UIView.animate(withDuration: 1, animations: {
            self.myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            self.myView.center = self.view.center
        }, completion: { done in
            self.animate()
        })
    }
    
}


