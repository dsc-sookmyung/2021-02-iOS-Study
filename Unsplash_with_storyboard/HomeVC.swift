//
//  ViewController.swift
//  Unsplash_with_storyboard
//
//  Created by 고나미 on 2021/11/13.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var searchIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searcFilterSegment: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("HomeVC - viewDidLoad() 호출됨 ")
        
        self.searchButton.layer.cornerRadius = 10
        
        self.searchBar.searchBarStyle = .minimal
    }

    //44분경
    @IBAction func onSearchButtonClicked(_ sender: Any) {
        print("HomeVC - onSearchButtonClicked() called / selectedIndex:  \(searchFilterSegment.selectedSegmentIndex)")
        
        switch seachFilterSegment.selectedSegmentIndex {
        case 0:
            print("사진으로 이동")
            segueId = "goToPhotoCollectionVC "
        case 1:
            print("사용자 화면으로 이동")
            segueId = "goToUserListVC "
        default:
            print("default")
            segueId = "goToPhotoCollectionVC"
        }
                // 화면으로 이동
               // pushVC()
    }
    
    //MARK: - IBAction methods
    @IBAction func searchValueChanged(_ sender: UISegmentedControl) {
        print("")
        var searchBarTitle = ""
        
        switch sender.selectedSegmentIndex {
            
        case 0:
            searchBarTitle = "사진 키워드"
        case 1:
            searchBarTitle = "사용자 이름"
        default:
            searchBarTitle = "사진 키워드"
        }
        
        self.searchBar.placeholder = searchBarTitle + " 입력"
        
        self.searchBar.becomeFirstResponder() // 포커싱 주기
        
//        self.searchBar.resignFirstResponder() // 포커싱 해제
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
       
       // 화면이동
       self.performSegue(withIdentifier: segueId, sender: self)
               
    }

    //MARK: - UISearchBar Delegate methods
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("HomeVC - searchBarSearchButtonClicked() ")
        
        guard let userInputString = searchBar.text else { return }
        
        if userInputString.isEmpty {
            // toast with a specific duration and position
           // self.view.makeToast("검색 키워드 입력", duration: 1.0, position: .center)
        } else {
            pushVC()
            searchBar.resignFirstResponder()
        }
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("HomeVC - searchBar textDidChange() searchText : \(searchText)")
        
        // 사용자가 입력한 값이 없을때
        if (searchText.isEmpty) {
            self.searchButton.isHidden = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
                // 포커싱 해제
                searchBar.resignFirstResponder()
            })
        } else {
            self.searchButton.isHidden = false
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let inputTextCount = searchBar.text?.appending(text).count ?? 0
        
        print("shouldChangeTextIn : \(inputTextCount) / text : \(text)")
        
        if (inputTextCount >= 12){
           // toast with a specific duration and position
          // self.view.makeToast("12자 까지만 입력가능.", duration: 1.0, position: .center)
       }

//        if inputTextCount <= 12 {
//            return true
//        } else {
//            return false
//        }
        return inputTextCount <= 12
    }
    
    
    //MARK: - UIGestureRecognizerDelegate
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
//        print("HomeVC - gestureRecognizer shouldReceive() called")
        
        // 터치로 들어온 뷰가 요놈이면
       // if(touch.view?.isDescendant(of: searchFilterSegment) == true){
//            print("세그먼트가 터치되었다.")
            return false
        } else if (touch.view?.isDescendant(of: searchBar) == true){
//            print("서치바가 터치되었다.")
            return false
        } else {
            view.endEditing(true)
//            print("화면이 터치되었다.")
            return true
        }
    }
    

