//
//  ViewController.swift
//  Todo
//
//  Created by 양주원 on 3/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tavleView: UITableView!
    var tasks = [Task]() {
        didSet {
            self.saveTasks()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tavleView.dataSource = self
        self.loadTasks()
    }

    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할일 등록", message: "할일을 입력해주세요", preferredStyle: .alert)
        // 클래스처럼 클로저도 참조타입, 본인을 self로 캡쳐할때 강한순환참조로 되어서 메모리 누수발생
        // 클로저 선언부에 weak 선언하여 메모리 누수 방지
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            // 할일을 등록할때마다 tasks에 할일이 추가가됨
            self?.tasks.append(task)
            //할일이 추가될대마다 뷰가 갱신됨
            self?.tavleView.reloadData()
        })
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        //configurationHandler: textField 꾸며주는 객체
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "할 일을 입력해주세요."
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveTasks() {
        let data = self.tasks.map {
            [
                "title": $0.title,
                "done": $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    
    func loadTasks() {
        let userDefaults = UserDefaults.standard
        // 저장된 데이터 불러오기, object 메서드는 anytype으로 반환
        // 저장된 데이터는 딕셔너리로 저장해서 딕셔너리 타입캐스팅, 실패시 nil이 될수있어 guard let 사용
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else { return }
        self.tasks = data.compactMap {
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            return Task(title: title, done: done)
        }
    }
}

extension ViewController: UITableViewDataSource {
    //numberOfRowsInSection: 각 섹션에 표시할 행의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    //cellForRowAt indexPath: 특정섹션에 n번째 row에 그리는데 필요한 반환하는 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //대량의 cell을 만들때 일일이 만들어주어서 메모리낭비를 방지하기위해 스크롤 내리면서 cell을 재사용
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        return cell
    }
}
