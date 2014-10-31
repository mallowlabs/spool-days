class LogWrapper: NSObject {
    let log: Log
    init(log: Log) {
        self.log = log
    }

    class func findResetLogsByBaseDate(baseDate: BaseDate) -> [Log] {
        let predicate = NSPredicate(format: "baseDate = %@ and event = %@", baseDate, "reset")
        return Log.MR_findAllSortedBy("date", ascending: false, withPredicate: predicate) as [Log]
    }
}