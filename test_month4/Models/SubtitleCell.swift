
import UIKit

class SubTitleCell: UITableViewCell{
    private var subtitle = MakerView.shared.makeLabel(text:"", textAlign: .left, font: .boldSystemFont(ofSize: 18), textColor: Colors.label, background: .clear)
    var checkBox = MakerView.shared.makeButton(backgroundColor: .white,cornerRadius: 5, tinitColor: Colors.label)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.heightAnchor.constraint(equalToConstant: 63).isActive = true
        contentView.layer.cornerRadius = 5
        contentView.backgroundColor = Colors.orange
        
        
        contentView.addSubview(checkBox)
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkBox.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkBox.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 52),
            checkBox.heightAnchor.constraint(equalToConstant: 20),
            checkBox.widthAnchor.constraint(equalToConstant: 20)
        ])
                
        
        contentView.addSubview(subtitle)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitle.centerYAnchor.constraint(equalTo: checkBox.centerYAnchor),
            subtitle.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 10),
            subtitle.heightAnchor.constraint(equalToConstant: 20)
        ])
        

        
    }
    
    
    func setCellValues(subtitleValue: Title) {
        subtitle.text = subtitleValue.title
        if subtitleValue.done {
            checkBox.setImage(UIImage(systemName: "checkmark"), for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
