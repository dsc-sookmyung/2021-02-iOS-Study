//
//  ViewController.swift
//  Week06-kde
//
//  Created by doeun kim on 2021/11/14.
//

import UIKit
import Toast_Swift
import Alamofire

class HomeVC: BaseVC, UISearchBarDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var searchFilterSegment: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var searchIndicator: UIActivityIndicatorView!
    
    var keyboardDismissTabGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: nil)
    
    //MARK: - override method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("HomeVc - viewDidLoad() 호출됨")
        
        // ui 설정
        self.config()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("HomeVC - viewDidAppear() called")
        // 포커싱 주기
        self.searchBar.becomeFirstResponder()
    }
    
    //화면이 넘어가기 전에 준비한다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("HomeVC - prepare() called / segue.identifier : \(segue.identifier)")
        
        switch segue.identifier {
        case SEGUE_ID.USER_LIST_VC:
            // 다음 화면의 뷰 컨트롤러를 가져온다.
            let nextVC = segue.destination as! UserListVC
            
            guard let userInputValue = self.searchBar.text else {return}
            
            nextVC.vcTitle = userInputValue + " 👩🏼‍💻"
            
        default:
            print("default")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("HomeVC - viewWillAppear() called")
        //키보드 올라가는 이벤트를 받는 처리
        //키보드 노티 등록
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowHandle(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideHandle), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("HomeVC - viewWillDisappear() called")
        // 키보드 노티 해제
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    //MARK: - fileprivate methods
    
    fileprivate func config(){
        // ui 설정
        self.searchButton.layer.cornerRadius = 10
        
        self.searchBar.searchBarStyle = .minimal
        
        self.searchBar.delegate = self
        
        self.keyboardDismissTabGesture.delegate = self
        
        //제스처 추가하기
        self.view.addGestureRecognizer(keyboardDismissTabGesture)
        
    }
    
    fileprivate func pushVC(){
        var segueId : String = ""
        
        switch searchFilterSegment.selectedSegmentIndex {
        case 0:
            print("사진 화면으로 이동")
            segueId = "goToPhotoCollectionVC"
        case 1:
            print("사용자 화면으로 이동")
            segueId = "goToUserListVC"
        default:
            print("default")
            segueId = "goToPhotoCollectionVC"
        }
        
        //  화면 이동 - HomeVC화면에서 이동함
        self.performSegue(withIdentifier: segueId, sender: self)
    }
    
    @objc func keyboardWillShowHandle(notification: NSNotification){
        print("HomeVC - keyboardWillShowHandle() called")
        
        //키보드 사이즈 가져오기
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            print("keyboardSize.height: \(keyboardSize.height)")
            print("searchButton.frame.origin.y : \(searchButton.frame.origin.y)")
            
            if(keyboardSize.height < searchButton.frame.origin.y){
                print("키보드가 버튼을 덮었다.")
                let distance = keyboardSize.height - searchButton.frame.origin.y
                print("이만큼 덮었다. distance : \(distance)")
                self.view.frame.origin.y = distance + searchButton.frame.height
            }
            
            
        }
        
        //self.view.frame.origin.y = -100
    }
    
    @objc func keyboardWillHideHandle(){
        print("HomeVC - keyboardWillHideHandle() called")
        
        self.view.frame.origin.y = 0
    }
    
    
    //MARK: - IBAction methods
    //검색 버튼이 클릭되었을 때
    @IBAction func onSearchButtonClicked(_ sender: UIButton) {
        print("HomeVC - onSearchButtonClicked() called \(searchFilterSegment.selectedSegmentIndex)")
        
//        let url = API.BASE_URL + "search/photos"
//
        guard let userInput = self.searchBar.text else { return }
//
//        //키, 벨류 형식의 딕셔너리
//        let queryParam = ["query" : userInput, "client_id" : API.CLIENT_ID]
        
//        AF.request(url, method: .get, parameters: queryParam).responseJSON(completionHandler: { response in
//            debugPrint(response)
//        })
        
        /*
        AF.request("https://api.unsplash.com/search/photos").response { response in
            debugPrint(response)
        }
        */
        
        var urlToCall : URLRequestConvertible?
        
        switch searchFilterSegment.selectedSegmentIndex {
        case 0:
            urlToCall = MySearchRouter.searchPhotos(term: userInput)
        case 1:
            urlToCall = MySearchRouter.searchUsers(term: userInput)
        default:
            print("default")
        }
        
        if let urlConvertible = urlToCall {
            MyAlamofireManager
                .shared
                .session
                .request(urlConvertible)
                .validate(statusCode: 200..<401)
                .responseJSON(completionHandler: { response in
//                    debugPrint(response)
                })
        }
        
        
        //화면으로 이동
        //pushVC()
        
    }
    
    
    @IBAction func searchFilterValueChanged(_ sender: UISegmentedControl) {
        print("HomeVC - searchFilterValueChanged() called / index: \(sender.selectedSegmentIndex)")
        
        var searchBarTitle = ""
        
        switch sender.selectedSegmentIndex {
            
        case 0:
            searchBarTitle = "사진 키워드"
        case 1:
            searchBarTitle = "사용자 이름"
        default:
            searchBarTitle = "사진 키워드"
        }
        
        self.searchBar.placeholder = searchBarTitle + " 입력  "
        
        //포커싱 주기
        self.searchBar.becomeFirstResponder()
        
        //포커싱 해제
        //self.searchBar.resignFirstResponder()
        
    }
    
    //MARK: - UISearchBar Delegate methods
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("HomeVC - searchBarSearchButtonClicked()")
        
        guard let userInputString = searchBar.text else {return}
        
        if userInputString.isEmpty {
            // toast with a specific duration and position
            self.view.makeToast("👻 검색 키워드를 입력해 주세요", duration: 1.0, position: .center)
        }
        else{
            pushVC()
            searchBar.resignFirstResponder()
        }
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("HomeVC - searchBar textDidChange() searchText : \(searchText)")
        
        // 사용자가 입력한 값이 없을 때
        if(searchText.isEmpty){
            self.searchButton.isHidden = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
                //포커싱 해제
                searchBar.resignFirstResponder()
            })
            
           
        }
        else{
            self.searchButton.isHidden = false
        }
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
                
        let inputTextCount = searchBar.text?.appending(text).count ?? 0
        
        print("shouldChangeTextIN : \(inputTextCount)")

        if(inputTextCount >= 12){
            // toast with a specific duration and position
            self.view.makeToast("🛎12자 까지만 입력 가능합니다!", duration: 1.0, position: .center)
        }
        
        if inputTextCount <= 12 {
            return true
        }
        else{
            return false
        }
        
        //return inputTextCount <= 12
    }
    
    //MARK: - UIGestureRecognizerDelegate
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("HomeVC - gestureRecognizer shouldReceive() called")
        
        //터치로 들어온 뷰가 요놈이면
        if(touch.view?.isDescendant(of: searchFilterSegment) == true){
            print("세그먼트가 터치되었다.")
            return false
        }
        else if (touch.view?.isDescendant(of: searchBar) == true){
            print("서치바가 터치되었다")
            return false
        }
        else{
            view.endEditing(true)
            print("화면이 터치되었다.")
            return true
        }
        
    }

}

