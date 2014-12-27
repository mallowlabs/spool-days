import UIKit

class DateTableViewCell: SWTableViewCell {
    var dateViewModel: DateViewModel

    init(reuseIdentifier: String?, dateViewModel: DateViewModel) {
        self.dateViewModel = dateViewModel
        super.init(style: UITableViewCellStyle.Value1, reuseIdentifier: reuseIdentifier)
        loadButtons()
        updateLabels()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func resetDate() {
        dateViewModel.resetDate()
    }

    private func updateLabels() {
        if let baseDate = dateViewModel.baseDate {
            textLabel?.text = baseDate.title
            let dateInterval = BaseDateWrapper(baseDate: baseDate).dateInterval()
            detailTextLabel?.text = "\(dateInterval) " + NSLocalizedString("Days", comment: "")
        }
    }

    private func loadButtons() {
        let leftButtons = NSMutableArray()
        leftButtons.sw_addUtilityButtonWithColor(UIColor(red: 0.07, green: 0.75, blue: 0.16, alpha: 1.0), title: NSLocalizedString("Reset", comment: ""))
        leftUtilityButtons = leftButtons
    }
}
