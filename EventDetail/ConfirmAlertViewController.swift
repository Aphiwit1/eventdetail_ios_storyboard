import UIKit

class ConfirmAlertView: UIViewController {
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var confirmView: UIView!

    var delegate: ConfirmAlertViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        animateView()
    }

    func setupView() {
        // set for bg and phone curve
        confirmView.layer.cornerRadius = 15
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)

        // set for btn
        deleteButton.layer.cornerRadius = 8
        cancelButton.layer.cornerRadius = 8
    }

    func animateView() {
        //transparent and bottom to show on top
        confirmView.alpha = 0
        confirmView.frame.origin.y = confirmView.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.confirmView.alpha = 1.0
            self.confirmView.frame.origin.y = self.confirmView.frame.origin.y - 50
        })
    }

    @IBAction func onTapCancelButton(_ sender: Any) {
        delegate?.cancelButtonTapped() // do something as delegate then dismiss
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onTapDeleteButton(_ sender: Any) {
        delegate?.deleteButtonTapped()
        dismiss(animated: true, completion: nil)
    }
}
