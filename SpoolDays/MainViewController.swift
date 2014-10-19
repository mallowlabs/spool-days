import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        title = "Spool Days"
        loadCollectionView()
        loadAddButton()
    }

    func loadCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let width = (view.bounds.width - 30) / 3
        layout.itemSize = CGSize(width: width, height: width)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView!.registerClass(DateCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView!.delegate = self
        collectionView!.dataSource = self
        collectionView!.backgroundColor = UIColor.whiteColor()
        view.addSubview(collectionView!)
    }

    func loadAddButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("addButtonTapped:"))
        navigationItem.rightBarButtonItem = addButton
    }

    func addButtonTapped(sender: AnyObject) {
        let editViewController = EditViewController(dateViewModel: DateViewModel())
        let navigationController = UINavigationController(rootViewController: editViewController)
        navigationController.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        presentViewController(navigationController, animated: true, completion: nil)
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.collectionView!.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as DateCollectionViewCell

        cell.dateViewModel.title = "Title\(indexPath.row)"
        cell.dateViewModel.date = NSDate(timeIntervalSinceNow: Double(indexPath.row * 60 * 60 * 24))
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
