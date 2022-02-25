//
//  EditViewController.swift
//  Navigation
//
//  Created by 김규리 on 2022/02/03.
//

import UIKit

protocol EditDelegate {
    // EditViewController에서 함수 호출
    // 수정화면의 데이터를 메인화면에 전달
    func didMessageEditDone(_ controller: EditViewController, message: String)
    
    // 수정화면의 스위치 상태를 메인화면으로 보내기 위한 함수
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}

class EditViewController: UIViewController {
    var textWayValue: String = ""
    var textMessage: String = ""
    // delegate 변수 생성
    var delegate : EditDelegate?
    var isOn = false // 수정화면에서 직접 스위치를 제어할 수 없기 때문에 만든 변수
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 메인화면에서 수정화면의 텍스트를 제어
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swIsOn.isOn = isOn // 처음 스위치는 꺼져있는 모습
    }
    
    // 완료 버튼 함수
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil { // 수정화면의 텍스트 필드 내용을 메인화면으로 전달
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        
        // 완료 버튼을 클릭 -> 메인화면으로 이동
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
