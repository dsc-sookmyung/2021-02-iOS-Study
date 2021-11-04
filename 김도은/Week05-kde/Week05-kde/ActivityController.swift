import UIKit

class ActivityController: UIViewController {
    
    @IBAction func startButtonClicked(_ sender: Any) {
        activityIndicator.startAnimating()
    }
    
    @IBAction func stopButtonClicked(_ sender: Any) {
        activityIndicator.stopAnimating()
    }
    
    lazy var activityIndicator : UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
      
        activityIndicator.center = self.view.center
        activityIndicator.color = .purple
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
            
        activityIndicator.stopAnimating()
        return activityIndicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(activityIndicator)
    }


}


