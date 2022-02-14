/*
 See LICENSE folder for this sample's licensing information.
 */

import UIKit

class ReminderListCell: UITableViewCell {
    typealias DoneButtonAction = () -> Void

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var doneButton: UIButton!

    var doneButtonAction: DoneButtonAction?
    
    @IBAction func doneButtonTriggered(_ sender: UIButton) {
        doneButtonAction?()
    }
}

