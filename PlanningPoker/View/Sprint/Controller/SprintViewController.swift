//
//  SprintViewController.swift
//  PlanningPoker
//
//  Created by Rubens Ferreira Ramos on 21/06/21.
//

import UIKit
import RxSwift
import RxSwiftExt

protocol SprintView: AnyObject {
}

class SprintViewController: UIViewController {

    @IBOutlet weak var SprintTableView: UITableView!
    
    var presenter: SprintPresenterToView?
    
    private let dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sprints"
        setupTableView()
        bindPresenter()
    }

    private func setupTableView() {
        self.SprintTableView.delegate = self
        self.SprintTableView.dataSource = self
        self.SprintTableView.rowHeight = UITableView.automaticDimension
        
        self.SprintTableView.registerCell(type: SprintTableViewCell.self)
    }
    
    private func bindPresenter() {
        presenter?.sprints
            .observe(on: MainScheduler())
            .bind { [weak self] _ in
                self?.SprintTableView.reloadData()
            }.disposed(by: dispose)
        
        presenter?.sprint
            .observe(on: MainScheduler())
            .bind { [weak self] _ in
                self?.showAlertSprint()
            }.disposed(by: dispose)
        
        presenter?.getSprints()
    }
    
    private func showAlertSprint() {
        guard let sprint = presenter?.sprint.value else { return }
        let alert = UIAlertController(
            title: "Detalhes Sprint",
            message: "Id: \(sprint.id) \nNome: \(sprint.nome)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func confirmDeleteSprint(with id: Int) {
        let alert = UIAlertController(
            title: "Apagar Sprint",
            message: "Tem certeza que deseja apagar essa Sprint?",
            preferredStyle: .alert
        )
        
        let yesAction = UIAlertAction(
            title: "Apagar",
            style: .destructive) { [weak self] _ in
            self?.presenter?.deleteSprint(by: id)
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .default)
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

extension SprintViewController: SprintView {
}

extension SprintViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.sprints.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueCell(withType: SprintTableViewCell.self, for: indexPath) as SprintTableViewCell
        
        if let sprint = presenter?.sprints.value?[indexPath.row] {
            cell.bind(sprint: sprint)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let id = presenter?.sprints.value?[indexPath.row].id else { return }
        presenter?.getSprint(by: id)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { [weak self] action, view, completion in
            if let id = self?.presenter?.sprints.value?[indexPath.row].id {
                self?.confirmDeleteSprint(with: id)
                completion(true)
            }
        }
        action.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}

