//
//  ViewController.swift
//  rxswift_learn
//
//  Created by hongwuzhao on 8/20/19.
//  Copyright © 2019 tencent. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum MyError: Error {
    case anError
}
// 2
func print<T: CustomStringConvertible>(label: String, event: Event<T>) {
    print(label, event.element ?? event.error ?? event)
}

class ViewController: UIViewController {
    let disposeBag = DisposeBag()

    @IBOutlet weak var checkedBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ObservableCreate()
//        exampleJust_Of_From()
        examplePublishSubject()

        buttonInterped()
    }

    func ObservableCreate() {
        let numbers: Observable<Int> = Observable.create { observer -> Disposable in
            observer.onNext(0)
            observer.onNext(1)
            observer.onNext(2)
            observer.onCompleted()
            return Disposables.create()
        }
        numbers.subscribe(onNext: { value in
            print(value)
        }, onError: { (Error) in

        }, onCompleted: {

        }) {

        }
    }

    //
    func exampleJust_Of_From() {
        let one = 1
        let two = 2
        let three = 3

        let obvervable: Observable<Int> = Observable<Int>.just(one)
        let obvervable2 = Observable.of(one, two, three)
        let obvervable3 = Observable.of([one, two, three])
        let obvervable4 = Observable.from([one, two, three])

    }

    func examplePublishSubject() {
//        let subject = PublishSubject<String>()
//        subject.onNext("The next subject string")
//        let subjectionOne = subject.subscribe(onNext:{ string in
//            print(string)
//        })
//        subject.onNext("The next subject string")
//
//        let replaySubject = ReplaySubject<String>.create(bufferSize: 10)
//        let behaviorSubject = BehaviorSubject<String>(value: "Will Be publish to latest sub")
//        let variableSubject = Variable<String>("Vari subject")
//
//        let behavSubjectionPre = behaviorSubject.subscribe(onNext: { (output) in
//            print(output)
//        }, onError: { (error) in
//
//        }, onCompleted: {
//
//        })
//
//        let behavSubjection = behaviorSubject.subscribe(onNext: { (output) in
//            print(output)
//        }, onError: { (error) in
//
//        }, onCompleted: {
//
//        })


        // PublishSubject
//        let subject = PublishSubject<String>()
//        subject.onNext("1")
//        let subscriptionTwo = subject.subscribe { event in
//            print("2)",  event.element ?? event)
//        }
//        subject.onNext("2")
//        let subscriptionThree = subject.subscribe {
//            print("3)",  $0.element ?? $0)
//        }
//        subject.onNext("3")
//        subscriptionTwo.dispose()
//        subject.onNext("4")
//        subject.onCompleted()
//        subject.onNext("5")

        // BehaviorSubject 会将最后一个信号重放给新的订阅者
//        let behaviorSubject = BehaviorSubject<String>(value: "Behavior 1")
//        let behavioSubscriOne = behaviorSubject.subscribe {
//            print(label: "1)", event: $0)
//        }
//        behaviorSubject.onNext("Behavior 2")
//        let behavioSubscriTwo = behaviorSubject.subscribe {
//            print(label: "2)", event: $0)
//        }
//        behaviorSubject.onError(MyError.anError)
//        let behavioSubscriThree = behaviorSubject.subscribe {
//            print(label: "3)", event: $0)
//        }

        //ReplaySubject 会保存一个指定大小的缓存存储之前发送的信号
        // 1
//        let subject = ReplaySubject<String>.create(bufferSize: 2)
//        let disposeBag = DisposeBag()
//        // 2
//        subject.onNext("1")
//        subject.onNext("2")
//        subject.onNext("3")
//        subject.onError(MyError.anError)
//        // 3
//        subject
//            .subscribe {
//                print(label: "1)", event: $0)
//            }
//            .addDisposableTo(disposeBag)
//        subject
//            .subscribe {
//                print(label: "2)", event: $0)
//            }
//            .addDisposableTo(disposeBag)

        //Variable 封装的是BehaviorSubject
        var variable = Variable("Initial value")
        let disposeBag = DisposeBag()
        // 2
        variable.value = "New initial value"
        // 3
        variable.asObservable()
            .subscribe {
                print(label: "1)", event: $0)
        }.disposed(by: disposeBag)

        // 1
        variable.value = "1"
        // 2
        variable.asObservable()
            .subscribe {
                print(label: "2)", event: $0)
            }
            .addDisposableTo(disposeBag)
        // 3
        variable.value = "2"

    }

    func buttonInterped() {
//        let checkVaild = BehaviorRelay(value: false)
//        checkVaild.asObservable().bind(to: checkedBtn.rx.isSelected).disposed(by: disposeBag)
//        checkedBtn.rx.tap.subscribe(onNext: { [weak self] in
//            checkVaild.accept(!checkVaild.value)
//            self?.checkedBtn.isSelected = checkVaild.value
//            self?.loginBtn.isEnabled = checkVaild.value
//        }).disposed(by: disposeBag)
//        checkVaild.asObservable().bind(to: loginBtn.rx.isEnabled).disposed(by: disposeBag)

        //简化操作
        loginBtn.isEnabled = false
        checkedBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.checkedBtn.isSelected = !(self?.checkedBtn.isSelected ?? false)
            self?.loginBtn.isEnabled = self?.checkedBtn.isSelected ?? false
        }).disposed(by: disposeBag)

        //二选一操作
        let buttons = [checkedBtn, loginBtn].compactMap { $0 }
        let selectedButton = Observable.from(buttons.map { button in
            button.rx.tap.map {
                button
            }
        }).merge()
        buttons.reduce(Disposables.create()) { (disposalble, button) in
            let subscribution = selectedButton.map {
                $0 == button
            }.bind(to: button.rx.isSelected)
            return Disposables.create(disposalble, subscribution)
        }.disposed(by: disposeBag)
    }
}

//extension Reactive where Base: UIButton {
//    public var selected: Binder<Bool> {
//        return Binder(self.base) { (button, selected) in
//            button.isSelected = selected
//        }
//    }
//}

