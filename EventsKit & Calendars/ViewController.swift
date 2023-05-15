//
//  ViewController.swift
//  EventsKit & Calendars
//
//  Created by Nazar Kopeika on 15.05.2023.
//
import EventKitUI /* 1 */
import EventKit /* 2 */
import UIKit

class ViewController: UIViewController, EKEventViewDelegate { /* 5 1 protocol */
    
    let store = EKEventStore() /* 10 Store - its where our events are written to and read from */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapAdd)) /* 7 */
    }

    @objc func didTapAdd() { /* 8 */
        let vc = EKCalendarChooser() /* 28 */
        vc.showsDoneButton = true /* 30 */
        vc.showsCancelButton = true /* 31 */
        present(UINavigationController(rootViewController: vc), animated: true) /* 29 */
        
//        store.requestAccess(to: .event) { [weak self] success , error in /* 11 */ /* 15 add weak self */
//            if success, error == nil { /* 12 */
//                DispatchQueue.main.async { /* 13 */
//                    guard let store = self?.store else { return } /* 16 */
//
//                    let newEvent = EKEvent(eventStore: store) /* 17 */
//                    newEvent.title = "Events Youtube Video" /* 18 */
//                    newEvent.startDate = Date() /* 19 */
//                    newEvent.endDate = Date() /* 20 */
//
//                    let otherVC = EKEventEditViewController() /* 24 */
//                    otherVC.eventStore = store /* 25 */
//                    otherVC.event = newEvent /* 26 */
//                    self?.present(otherVC, animated: true, completion: nil) /* 27 */
//
//               let vc vesent(navVC, animated: true) /* 6 */ /* 22 change vc */
//                }
//            }
//        }
    }

    func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) { /* 9 */
        controller.dismiss(animated: true, completion: nil) /* 23 */
    }
}

