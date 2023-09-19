

import UIKit

class ViewController: UIViewController {
    var section = 0
    var titleCheckBox = UIButton()
    var todoList: [TodoList] = []

    
    let titleCellId = "TitleCell"
    let subTitleCellId = "SubTitleCell"
    
    var tableView: UITableView = {
        let view = UITableView()
        view.separatorStyle = .none
        return view
    }()
    
    private var topView = MakerView.shared.makeView(backgroundColor: Colors.navigationBar)

    private var botomView = MakerView.shared.makeView(backgroundColor: Colors.navigationBar)
    
    private var leftView = MakerView.shared.makeView(backgroundColor: Colors.navigationBar)
    private var rightView = MakerView.shared.makeView(backgroundColor: Colors.navigationBar)

    
    private var listBtn = MakerView.shared.makeButton(image: UIImage(named: "clipboard"), tinitColor: .white, isSelected: true, backgroundImg: UIImage(named: "circle"))
    private var calendarBtn = MakerView.shared.makeButton(image: UIImage(named: "calendar"), tinitColor: .white)
    
    
    private let addBtn = MakerView.shared.makeButton(image: UIImage(named: "add"), tinitColor: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(TitleCell.self, forCellReuseIdentifier: titleCellId)
        tableView.register(SubTitleCell.self, forCellReuseIdentifier: subTitleCellId)
        
        initUI()
        initData()
    }


    private func initUI(){
        navigationBarCongig()
        topViewConfig()
        tableViewConfig()
        
        bottomViewConfig()
        leftViewConfig()
        rightViewConfig()

        addBtnConfig()
    }
    
    private func tableViewConfig(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -194)
            
        ])
        
    }
    
    private func topViewConfig(){
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 97)
        ])
    }
    
    private func bottomViewConfig(){
        view.addSubview(botomView)
        botomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            botomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            botomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            botomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            botomView.heightAnchor.constraint(equalToConstant: 65)
        ])
    }
    
    private func leftViewConfig(){
        view.addSubview(leftView)
        leftView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftView.leadingAnchor.constraint(equalTo: botomView.leadingAnchor),
            leftView.trailingAnchor.constraint(equalTo: botomView.centerXAnchor),
            leftView.topAnchor.constraint(equalTo: botomView.topAnchor),
            leftView.bottomAnchor.constraint(equalTo: botomView.bottomAnchor),
        ])
        
        leftView.addSubview(listBtn)
        listBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            listBtn.centerYAnchor.constraint(equalTo: leftView.centerYAnchor),
            listBtn.centerXAnchor.constraint(equalTo: leftView.centerXAnchor),
            listBtn.widthAnchor.constraint(equalToConstant: 56),
            listBtn.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func rightViewConfig(){
        view.addSubview(rightView)
        rightView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightView.trailingAnchor.constraint(equalTo: botomView.trailingAnchor),
            rightView.leadingAnchor.constraint(equalTo: botomView.centerXAnchor),
            rightView.topAnchor.constraint(equalTo: botomView.topAnchor),
            rightView.bottomAnchor.constraint(equalTo: botomView.bottomAnchor),
        ])
        
        rightView.addSubview(calendarBtn)
        calendarBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calendarBtn.centerYAnchor.constraint(equalTo: rightView.centerYAnchor),
            calendarBtn.centerXAnchor.constraint(equalTo: rightView.centerXAnchor),
            calendarBtn.widthAnchor.constraint(equalToConstant: 56),
            calendarBtn.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func addBtnConfig(){
        view.addSubview(addBtn)
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addBtn.bottomAnchor.constraint(equalTo: botomView.topAnchor, constant: -26),
            addBtn.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            addBtn.widthAnchor.constraint(equalToConstant: 69),
            addBtn.heightAnchor.constraint(equalToConstant: 69)
        ])
    }
   
    private func navigationBarCongig(){
        navigationController?.navigationBar.backgroundColor = Colors.navigationBar
        navigationController?.navigationBar.tintColor = .white
        
        
        let leftBarImg = UIImage(named: "checkList")
        
        
        navigationController?.navigationBar.topItem?.setLeftBarButtonItems([UIBarButtonItem(image: leftBarImg, style: .done, target: nil, action: nil)], animated: false)
        
        
        let rightBarImg = UIImage(systemName: "gearshape")
        
        navigationController?.navigationBar.topItem?.setRightBarButtonItems([UIBarButtonItem(image: rightBarImg, style: .done, target: nil, action: nil)], animated: false)
        
    }
    private func initData(){

        todoList = [TodoList(title: "Learning UI/UX", subtitle: [], isOpen: false, isDone: false),
                    TodoList(title: "Homework", subtitle: [Title(title: "Sport", done: false),
                                                           Title(title: "Mathematic", done: false),
                                                           Title(title: "Science", done: false)
                                                           ], isOpen: false, isDone: false),
                                                           
                    TodoList(title: "Read a book", subtitle: [], isOpen: false, isDone: false),
                    TodoList(title: "Hangout with friends", subtitle: [], isOpen: false, isDone: false),
                    TodoList(title: "Exercise", subtitle: [Title(title: "Cardio", done: false),
                                                           Title(title: "Power", done: false)], isOpen: false, isDone: false),
                    TodoList(title: "Play game", subtitle: [], isOpen: false, isDone: false)
        
        ]
    }
    

}

