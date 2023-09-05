





import UIKit
import SnapKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

class MenuViewController: UIViewController {
    
    let textLabel = UILabel()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    let exercise = Praxis.praxis
   
    private let layout = CustomLayout()
    var itemW: CGFloat {
        return screenWidth * 0.4
    }
    var itemH: CGFloat {
        return itemW * 1.45
    }
    let exerciseImages = Praxis.praxisImage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1)
        navigationItem.hidesBackButton = true
        setupUI()
        setupViews()
    }
    
    
    
    
    func setupUI() {
    
        textLabel.text = "Time for praxis"
        textLabel.font = UIFont(name: "Helvetica-Bold", size: 38)
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        textLabel.shadowColor = .white
        textLabel.shadowOffset = CGSize(width: 1, height: 2)
        view.addSubview(textLabel)
        
        textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview().inset(55)
        }
        
    }
    
    
}

extension MenuViewController {
    private func setupViews() {
        collectionView.backgroundColor = .clear
        collectionView.decelerationRate = .fast
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        collectionView.collectionViewLayout = layout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 50.0
        layout.minimumInteritemSpacing = 50.0
        layout.itemSize.width = itemW
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(60)
            make.right.left.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
    }
}

//MARK: - UICollectionViewDataSource

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exercise.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        
        cell.label.text = exercise[indexPath.item]
        if indexPath.item < exerciseImages.count {
                cell.imageView.image = exerciseImages[indexPath.item]
            } else {
                
                cell.imageView.image = nil
            }
        
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 4
        cell.contentView.backgroundColor = .white
        cell.layer.cornerRadius = 5
        cell.layer.cornerCurve = .circular
        
        return cell
    }
    
    
}

//MARK: - UICollectionViewDelegate

extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let actionController = ActionViewController()
        navigationController?.pushViewController(actionController, animated: true)
    }
}

//MARK: - UICollectionViewViewDelegateFlowLayout

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: itemW, height: itemH)
    }
}

extension MenuViewController {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            setupCell()
        }
    }
    private func setupCell() {
        let indexPath = IndexPath(item: layout.currentPage, section: 0)
        if let cell = collectionView.cellForItem(at: indexPath) {
            transformCell(cell)
        }
    }
    
    private func transformCell(_ cell: UICollectionViewCell, isEffect: Bool = true) {
        if !isEffect {
            cell.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            return
        }
        UIView.animate(withDuration: 0.2) {
            cell.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
        for otherCell in collectionView.visibleCells {
            if otherCell != cell {
                UIView.animate(withDuration: 0.2) {
                    cell.transform = .identity
                }
            }
        }
    }
}

class CustomCollectionViewCell: UICollectionViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(10)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(10)
            make.width.height.equalTo(150)
            make.height.equalTo(350)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
