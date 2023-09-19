

import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let subtitleAmount = todoList[section].subtitle.count
        
        if todoList[section].isOpen && subtitleAmount > 0 {
            return subtitleAmount + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: titleCellId, for: indexPath) as! TitleCell
            cell.setCellValues(todoList: todoList[indexPath.section])
            
            
            cell.checkBox.addTarget(self, action: #selector(checkBoxBtnPressed), for: .touchUpInside)
            
            cell.checkBox.tag = indexPath.section
            
            checkBoxState(state: todoList[indexPath.section].isDone, sender: cell.checkBox)
            self.titleCheckBox = cell.checkBox
            return cell
            
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: subTitleCellId, for: indexPath) as! SubTitleCell
            let subtitleIndex = indexPath.row - 1
            let subtitle = todoList[indexPath.section].subtitle[subtitleIndex]
            cell.setCellValues(subtitleValue: subtitle)
            cell.checkBox.tag = indexPath.row - 1
            cell.checkBox.addTarget(self, action: #selector(allDone), for: .touchUpInside)
            
            checkBoxState(state: todoList[indexPath.section].subtitle[indexPath.row - 1].done, sender: cell.checkBox)

            self.section = indexPath.section

            return cell
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 && todoList[indexPath.section].subtitle.count > 0  {
            todoList[indexPath.section].isOpen = !todoList[indexPath.section].isOpen
            tableView.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .default, title: "delete"){_,_ in
            if indexPath.row == 0{
                self.todoList.remove(at: indexPath.section)
                tableView.deleteSections([indexPath.section], with: .fade)
            }
            else{
                self.todoList[indexPath.section].subtitle.remove(at: indexPath.row - 1)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        
        delete.backgroundColor = Colors.label
        
        return [delete]
    }
    

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        " "
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        5
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        todoList.count
    }
    
    
    @objc func checkBoxBtnPressed(sender: UIButton) {
        let section = sender.tag
        todoList[section].isDone = !todoList[section].isDone
        checkBoxState(state: todoList[section].isDone, sender: sender)

    }
   
    
    @objc func allDone(sender: UIButton) {
        let row = sender.tag
        todoList[section].subtitle[row].done = !todoList[section].subtitle[row].done

        checkBoxState(state: todoList[section].subtitle[row].done, sender: sender)

        
        let allDone = todoList[section].subtitle.allSatisfy {$0.done}
        
        if allDone{
            todoList[section].isDone = true
            checkBoxState(state: todoList[section].isDone, sender: titleCheckBox)


        }else{
            todoList[section].isDone = false
            checkBoxState(state: todoList[section].isDone, sender: titleCheckBox)

        }
    }

    private func checkBoxState(state: Bool, sender: UIButton){
        
        if state{
            sender.setImage(UIImage(systemName: "checkmark"), for: .normal)
        }else{
            sender.setImage(.none, for: .normal)
        }
    }
}
