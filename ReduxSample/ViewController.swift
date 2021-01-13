//
//  ViewController.swift
//  ReduxSample
//
//  Created by radu on 13.01.2021.
//

import UIKit
import ReSwift

class ViewController: UIViewController, StoreSubscriber
{
    // MARK: - Outlets
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var placeholder1: UILabel!
    @IBOutlet weak var placeholder2: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        store.subscribe(self)
    }
    
    // MARK - UI Actions
    @IBAction func rockButton(_ sender: Any)
    {
        store.dispatch(ChooseWeaponAction(weapon: .rock))
    }
    
    @IBAction func paperButton(_ sender: Any)
    {
        store.dispatch(ChooseWeaponAction(weapon: .paper))
    }
    
    @IBAction func scissorsButton(_ sender: Any)
    {
        store.dispatch(ChooseWeaponAction(weapon: .scissors))
    }
    
    @IBAction func restartButtonPressed(_ sender: Any)
    {
        store.dispatch(GameResetAction())
    }

    // MARK: - StoreSubscriber
    func newState(state: AppState)
    {
        message.text = state.message.rawValue
        
        if state.player2Play.chosen
        {
            placeholder1.text = state.player1Play.weapon?.rawValue
            placeholder2.text = state.player2Play.weapon?.rawValue
        }
        else
        {
            placeholder1.text = state.player1Play.chosen ? "chosen" : ""
            placeholder2.text = state.player2Play.chosen ? "chosen" : ""
        }
    }
}
