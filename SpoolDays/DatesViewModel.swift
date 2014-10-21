class DatesViewModel: RVMViewModel, UITableViewDataSource  {
    dynamic var dates: [BaseDate] = []
    let itemChangedSignal = RACSubject()

    func fetch() {
        dates = BaseDate.MR_findAllSortedBy("sort", ascending: true) as [BaseDate]
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dates.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let dateViewModel = DateViewModel(baseDate: dates[indexPath.row])
        return DateTableViewCell(reuseIdentifier: "Cell", dateViewModel: dateViewModel)
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            BaseDateWrapper(baseDate: dates[indexPath.row]).delete()
            fetch()
            itemChangedSignal.sendNext(RowsChangeEvent(indexPath: indexPath, newIndexPath: nil, eventType: RowsChangeEvent.EventType.Delete))
        }
    }

    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        BaseDateWrapper.move(fromIndex: fromIndexPath.row, toIndex: toIndexPath.row)
        fetch()
        itemChangedSignal.sendNext(RowsChangeEvent(indexPath: fromIndexPath, newIndexPath: toIndexPath, eventType: RowsChangeEvent.EventType.Move))
    }
}