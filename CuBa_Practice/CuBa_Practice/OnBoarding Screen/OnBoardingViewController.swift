//
//  OnBoardingViewController.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 05/05/22.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var prevBtn: CustomWhiteBacKButton!
    @IBOutlet weak var nextBtn: CustomWhiteBacKButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: - Variables
    var pageControlSlides = [OnBoardingModel]()
    var page = 0 {
        didSet {
            pageControl.currentPage = page
            if(page == pageControlSlides.count - 1){
                nextBtn.setTitle("Welcome", for: .normal)
            }else{
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purpleColor
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        cardView.layer.cornerRadius = 12
        cardView.layer.masksToBounds = true
        collectionView.delegate = self
        collectionView.dataSource = self
        setData()
        turnOnSwipeToBack()
    }
    @IBAction func onClickOfNextButton(_ sender: CustomWhiteBacKButton) {
        if(page != pageControlSlides.count - 1){
            page += 1
            let indexPath = IndexPath(item: page, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }else{
            if let signIn = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signInViewController" ) as? SignInViewController {
                self.navigationController?.pushViewController(signIn, animated: true)
            }
        }
    }
    @IBAction func onClickOfPrevButton(_ sender: Any) {
        page -= 1
        let indexPath = IndexPath(item: page, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

//MARK: - UICollectionViewDelegate
extension OnBoardingViewController: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDataSource
extension OnBoardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageControlSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? OnBoardingScreenCell {
            cell.configureCell(slide: pageControlSlides[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
}

//MARK: - Custom Function
extension OnBoardingViewController {
    private func setData(){
        pageControlSlides.append(OnBoardingModel(title: "Welcome to CaBu !", subTitle: "CaBu UI kit Crafted with passion and deep precision, this UI Kit has features that are very complete according to your product needs", btnTitle: "Waiting To Start"))
        pageControlSlides.append(OnBoardingModel(title: "Second Page", subTitle: "This is first page stating what this app is about”, “A second page stating more app info incase you need them”, “The very last page with yet more info for our esteem users", btnTitle: "Not Started Still"))
        pageControlSlides.append(OnBoardingModel(title: "Last Page", subTitle: "the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", btnTitle: "Get Started"))
    }
}

extension OnBoardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        page = Int(scrollView.contentOffset.x/width)
    }
    
}
