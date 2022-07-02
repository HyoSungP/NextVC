//
//  ViewController.swift
//  NextVC
//
//  Created by parkhyo on 2022/07/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 1) 코드로 뷰컨트롤 화면 이동 (다음화면이 코드로만 구성되어있을 때 사용가능)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController()
        firstVC.someString = "코드로 화면 바꾸기"
        firstVC.modalPresentationStyle = .fullScreen
        present(firstVC, animated: true, completion: nil)
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else {
            return
        }
        secondVC.someString = "코드로 스토리보드 객체를 생성해서 화면 이동"
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
    }
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toThirdVC", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toThirdVC" {
            guard let thirdVC = segue.destination as? ThirdViewController else {
                return
            }
            thirdVC.someString = "스토리보드에서 세그웨이 사용하여 화면이동"
        }
    }
    
    
}

