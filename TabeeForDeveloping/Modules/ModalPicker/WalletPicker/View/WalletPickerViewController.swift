//
//  WalletPickerViewController.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit
import FloatingPanel

final class WalletPickerViewController: UIViewController {
    
    private var pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    private var pages: [WalletSinglePageModel] = []
    private var currentIndex: Int = 0
    
    private let pageControl: UIPageControl = {
        $0.tintColor = UIColor.lightGray
        $0.pageIndicatorTintColor = UIColor.lightGray
        $0.currentPageIndicatorTintColor = UIColor.darkGray
        $0.backgroundColor = UIColor.clear
        
        return $0
    }(UIPageControl())
    
    // MARK: - Properties
    
    private let containerView: UIView = {
        $0.backgroundColor = .white
//        $0.layer.cornerRadius = Constraints.buttonHeight / 2
//        $0.layer.shadowColor = Palette.Background.basisDark.color.cgColor
//        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
//        $0.layer.masksToBounds = false
        return $0
    }(UIView())
    
    
    private let vStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.alignment = .center
        $0.spacing = 16
        return $0
    }(UIStackView())
    
    private var descriptionLabel: UILabel = {
        $0.text          = "Здесь какое-то описание и текст и еще что то там"
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.lineBreakMode = .byTruncatingMiddle
        //$0.font          = FontBook.regular.of(style: .body)
        //$0.textColor     = Palette.Text.contrast.color
        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        return $0
    }(UILabel())
    
    private let button: UIButton = {
        $0.setTitle("Закрыть модалку", for: .normal)
        //$0.setImage(AppAssets.catalogSectionHeaderSort.image, for: .normal)
        $0.contentEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)
        //$0.tintColor = Palette.Text.contrast.color
        return $0
    }(UIButton(type: .system))
    
    
    
    var output: WalletPickerViewOutput!
    
    // MARK: - UI Components
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayout()
        setupActions()

        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyStyles()
    }
}

// MARK: - WalletPickerViewInput

extension WalletPickerViewController: WalletPickerViewInput {
    
    func updateView(_ viewState: DataFlow.ViewState) {
        switch viewState {
            
        case .loading:
            //TODO: сюда надо какой нибудь лоадер
            ()
        case .loaded(pages: let pages):
            self.pages = pages
            
            //pageController.dataSource = nil;
            //pageController.dataSource = self;
            
            //pageController.delegate = nil;
            //pageController.delegate = self;

            let controllers = createWalletPageController()
            
            pageController.setViewControllers([controllers.first!], direction: .forward, animated: true, completion: nil)
            
            pageControl.numberOfPages = pages.count
            
        case .error:
            //TODO: отобразить ошибку
            ()
        }
    }
    
    func setupInitialState(_ viewState: WalletPickerDataFlow.View.ViewState) {
        //TODO: показать loading screen
    }
}

// MARK: - Setup UI

private extension WalletPickerViewController {
    
    func setupViews() {
        view.addSubview(containerView)
        
        setupPageController()

        //containerView.addSubview(vStackView)
        //vStackView.addArrangedSubview(descriptionLabel)
        //vStackView.addArrangedSubview(button)
    }
    
    func setupLayout() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }

//        vStackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
    }
    
    // MARK: - Actions
    
    func setupActions() {
        button.addTarget(self, action: #selector(buttonActionHandler(_:)), for: .touchUpInside)
    }
    
    
    func applyStyles() {
        view.backgroundColor = .white
    }
}

// MARK: - Constants

private extension WalletPickerViewController {
    struct Constraints { }
}

// MARK: - Actions
extension WalletPickerViewController {
    @objc func buttonActionHandler(_ button: UIButton) {
        print("tapped - closing modal")
        output.closeTapped()
    }
}

// MARK: - PageViewController Setup

extension WalletPickerViewController {
    private func setupPageController() {

        pageController.dataSource = self
        pageController.delegate = self
        pageController.view.backgroundColor = .clear

        addChild(pageController)
       
        containerView.addSubview(pageController.view)
        //containerView.addSubview(pageControl)
        
        let initialVC = WalletPageViewController(with: .init(pageIndex: 0, colorCircles: [
            .init(id: "-", dataForView: .init(
                leftColor: .green,
                rightColor: .green,
                backgroundColoe: .green,
                circleRadius: 15,
                activityInProgress: true,
                needBorder: false,
                borderColor: .green,
                borderWidth: 2,
                cornerRadius: 3),
                  action: { _ in })
        ]), output: self)
        
        pageController.setViewControllers([initialVC], direction: .forward, animated: true, completion: nil)
        
        pageController.didMove(toParent: self)
        
        pageControl.numberOfPages = pages.count
        
        pageController.view.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.leading.trailing.equalToSuperview().inset(8)
            make.top.equalToSuperview().offset(16)
            
            //это закомментить когда будет кастомный пейдж контрол ниже
            make.bottom.equalToSuperview().inset(25)
        }
        
//        pageControl.snp.makeConstraints { make in
//            make.leading.trailing.equalToSuperview().inset(16)
//            make.height.equalTo(20)
//            make.top.equalTo(pageController.view.snp.bottom).offset(16)
//            make.bottom.equalToSuperview().inset(25)
//        }
        
        setupDefaultPageControll()
    }
    
    
    //конфиг для дефолтного пейдж контрола - но мы тут юзаем кастомный - поэтоу пока закомментил
    func setupDefaultPageControll(){

        let apperance = UIPageControl.appearance()
        apperance.pageIndicatorTintColor = UIColor.lightGray
        apperance.currentPageIndicatorTintColor = UIColor.darkGray
        apperance.backgroundColor = UIColor.clear
    }
    
    func createWalletPageController() -> [WalletPageViewController] {
        let pages: [WalletPageViewController] = pages.map { singlePageModel in
            let controller = WalletPageViewController(with: singlePageModel, output: self)
            
            return controller
        }
        
        return pages
    }
}

// MARK: - PageViewController DataSource & Delegate

extension WalletPickerViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentVC = viewController as? WalletPageViewController else {
            return nil
        }
        
        var index = currentVC.page.pageIndex
        
        if index == 0 {
            return nil
        }
        
        index -= 1
        
        let vc = WalletPageViewController(with: pages[index], output: self)
        
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentVC = viewController as? WalletPageViewController else {
            return nil
        }
        
        var index = currentVC.page.pageIndex
        
        if index >= self.pages.count - 1 {
            return nil
        }
        
        index += 1
        
        let vc = WalletPageViewController(with: pages[index], output: self)
        
        return vc
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return self.currentIndex
    }
    
//    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//
//        guard let currentVC = pageViewController.viewControllers?.first as? WalletPageViewController else {
//            assertionFailure("error with index")
//            return
//        }
//
//        pageControl.currentPage = currentVC.page.pageIndex
//    }
}

// MARK: - Single Page Controllers output

extension WalletPickerViewController: WalletPageViewControllerOutput {
    
}

// MARK: - FloatingPanelController Delegate

extension WalletPickerViewController: FloatingPanelControllerDelegate {
    func floatingPanelDidRemove(_ fpc: FloatingPanelController) {
        output.sendAnalytic(event: .moduleDismiss)
    }
}
