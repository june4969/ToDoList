//
//  TaskViewController.swift
//  Task
//
//  Created by air on 15/09/2023.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label : UILabel!
    
    var task:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
        

       
    }
    
    @objc func deleteTask() {
        // UserDefaults에서 현재 작업 위치를 가져옴
        let currentPosition = UserDefaults.standard.integer(forKey: "currentPosition")
        
        // 현재 작업 위치의 작업을 삭제
        UserDefaults.standard.removeObject(forKey: "task_\(currentPosition)")
        
        // 작업 카운트 감소
        var count = UserDefaults.standard.integer(forKey: "count")
        count -= 1
        UserDefaults.standard.set(count, forKey: "count")
        
        // 다음 작업 위치로 이동 (예: 다음 작업을 삭제하도록 설정)
        UserDefaults.standard.set(currentPosition + 1, forKey: "currentPosition")
        
        // 작업이 삭제되었음을 NotificationCenter로 알림
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TaskDeleted"), object: nil)
        
        // 이전 화면으로 돌아가기 (옵셔널)
        navigationController?.popViewController(animated: true)
    }

    


}
