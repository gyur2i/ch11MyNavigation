//
//  ViewController.swift
//  Navigation
//
//  Created by 김규리 on 2022/02/03.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    
    var isOn = true
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn // 처음 이미지는 불이 켜져 있는 이미지
    }
    
    // 세그웨이 이용한 화면 전환
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController // 세그웨이의 도착 컨트롤러를 EditViewController으로
        
        if segue.identifier == "editButton"{ // 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use button"
            
        } else if segue.identifier == "editBarButton"{ // 바 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use Bar button"
        }
        
        editViewController.textMessage = txMessage.text! // editViewController의 textMessage에 입력 받은 텍스트 필드의 값 저장
        editViewController.isOn = isOn // editViewController의 스위치 상태를 메인의 이미지 상태와 똑같게
        editViewController.delegate = self // ?
    }

    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool){
        if isOn == true {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
        
    }

}
