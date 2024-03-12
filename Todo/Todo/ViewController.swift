//
//  ViewController.swift
//  Todo
//
//  Created by 양주원 on 3/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    var doneButton: UIBarButtonItem?
    var tasks = [Task]() {
        didSet {
            self.saveTasks()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // selector: 포괄형 구문 호출
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadTasks()
    }
    //selector로 호출 메서드
    @objc func doneButtonTap() {
        self.navigationItem.leftBarButtonItem = self.editButton
        self.tableView.setEditing(false, animated: true)
    }
    
    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
        guard !self.tasks.isEmpty else { return }
        // editButton이 doneButton으로 변경
        self.navigationItem.leftBarButtonItem = self.doneButton
        // tableView가 편집모드로 전환
        self.tableView.setEditing(true, animated: true)
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
            self?.tableView.reloadData()
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
        // Done 상태에 따라 표시를 다르게 함
        if task.done {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
}

extension ViewController:UITableViewDelegate {
    //didSelectRowAt은 어떤셀이 선택되었는지 알려주는 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = self.tasks[indexPath.row]
        task.done = !task.done
        self.tasks[indexPath.row] = task
        // with는 어떤 애니메이션으로 구현되게끔할지 정할수있음
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
