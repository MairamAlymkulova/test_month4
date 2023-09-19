

import UIKit

class TitleCell: UITableViewCell{
    private let listButton = MakerView.shared.makeButton( tinitColor: Colors.label)
    private var title = MakerView.shared.makeLabel(textAlign: .left, font: .boldSystemFont(ofSize: 18), textColor: Colors.label, background: Colors.orange, cornerRadius: 5)
   
    var checkBox = MakerView.shared.makeButton(backgroundColor: .white, cornerRadius: 5, tinitColor: Colors.label)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.heightAnchor.constraint(equalToConstant: 63).isActive = true
        contentView.layer.cornerRadius = 10
        
        contentView.backgroundColor = Colors.orange
        
       
        
        contentView.addSubview(checkBox)
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkBox.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkBox.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
            checkBox.heightAnchor.constraint(equalToConstant: 20),
            checkBox.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        
        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: checkBox.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 10),
            title.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        contentView.addSubview(listButton)
            listButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                listButton.centerYAnchor.constraint(equalTo: checkBox.centerYAnchor),
                listButton.trailingAnchor.constraint(equalTo: checkBox.leadingAnchor, constant: -3),
                listButton.heightAnchor.constraint(equalToConstant: 17),
                listButton.widthAnchor.constraint(equalToConstant: 17)
            ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCellValues(todoList: TodoList) {
        title.text = todoList.title
        if todoList.subtitle.count > 0 && todoList.isOpen {
            listButton.setImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .normal)

        }else if todoList.subtitle.count > 0 {
            listButton.setImage(UIImage(systemName: "arrowtriangle.forward.fill"), for: .normal)
        }
    }
    
}
