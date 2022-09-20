import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblButons: UIStackView!

    private let circleView = UIView()
    private let size = CGFloat(40)
    private var gameFieldWidth: CGFloat = 0.0
    private var gameFIeldHeight: CGFloat = 0.0
    private let step = CGFloat(5)
    private let message = "The end of screen"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        initGameField()
        initView()
    }
    
    private func initGameField(){
        gameFieldWidth = view.frame.size.width - size
        gameFIeldHeight = view.frame.size.height - lblButons.frame.size.height - size
    }
    
    private func initView() {
        let circleX = CGFloat(gameFieldWidth / 2)
        let circleY = CGFloat(gameFIeldHeight / 2)

        circleView.frame = CGRect(x: circleX, y: circleY, width: size, height: size)
        circleView.layer.cornerRadius = CGFloat(size / 2)
        circleView.backgroundColor = .blue
        
        view.addSubview(circleView)
    }
    
    @IBAction func onTopClick(_ sender: UIButton) {
        if circleView.frame.origin.y > 0 {
            circleView.frame.origin.y -= step
        } else {
            showToast()
        }
    }
    
    @IBAction func onRightClick(_ sender: UIButton) {
        if circleView.frame.origin.x < gameFieldWidth {
            circleView.frame.origin.x += step
        } else {
            showToast()
        }
    }
    
    @IBAction func onLeftClick(_ sender: UIButton) {
        if circleView.frame.origin.x > 0 {
            circleView.frame.origin.x -= step
        } else {
            showToast()
        }
    }
    
    @IBAction func onDownClick(_ sender: UIButton) {
        if circleView.frame.origin.y < gameFIeldHeight {
            circleView.frame.origin.y += step
        } else {
            showToast()
        }
    }

    private func showToast(){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        self.present(alert, animated: true)
        let duration: Double = 3
            
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true)
        }
    }
}

