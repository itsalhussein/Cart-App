import UIKit

/// Once app navigator is initialized,
/// It have a root controller to do all navigation on till it receive new root
final class AppNavigator {
    private static var rootController: UINavigationController!
    @discardableResult
    init(window: UIWindow, viewController : UIViewController) {
        let nav = UINavigationController(rootViewController: viewController)
        AppNavigator.rootController = nav
        nav.interactivePopGestureRecognizer?.isEnabled = false
        window.rootViewController = nav
        window.makeKeyAndVisible()
        return
    }
    
    func setNewRoot(with newRoot: Destinations) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let nv = UINavigationController(rootViewController: newRoot.viewcontroller)
            nv.interactivePopGestureRecognizer?.isEnabled = false
            AppNavigator.rootController = nv
            appDelegate.window?.rootViewController = AppNavigator.rootController
        } else {
            // Fallback on earlier versions
        }
    }
    
    func setRoot(with newRoot: Destinations) {
        if let _ = UIApplication.shared.delegate as? AppDelegate {
            let nv = UINavigationController(rootViewController: newRoot.viewcontroller)
            nv.interactivePopGestureRecognizer?.isEnabled = false
            AppNavigator.rootController = nv
        } else {
            // Fallback on earlier versions
        }
    }
    
    init() throws {
        if AppNavigator.rootController == nil {
            throw NavigatorError.noRoot
        }
    }
    
    func present(_ dest: Destinations) {
        AppNavigator.rootController.present(dest.viewcontroller, animated: true, completion: nil)
    }
    
    func back() {
        AppNavigator.rootController.popViewController(animated: true)
    }
    
    func push(_ dest: Destinations) {
        AppNavigator.rootController.pushViewController(dest.viewcontroller, animated: true)
    }
}

enum NavigatorError: Error {
    case noRoot
}
