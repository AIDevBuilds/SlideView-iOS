//
//  ViewController.m
//  slideInSlideOut
//
//  Created by Sandeep Singh on 05/12/16.
//  Copyright © 2016 Sandeep Singh. All rights reserved.
//

#import "ViewController.h"
#import "SlideInSlideOut.h"

@interface ViewController ()
{
    SlideInSlideOut *slideView;
    BOOL isShowSlideView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    // create object of SlideInSlideOut class
    slideView = [[SlideInSlideOut alloc] init];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    isShowSlideView = NO;
}

- (IBAction)clickBtnPressed:(id)sender
{
    // Sender send to the button
    UIButton *clickBtn = (UIButton *)sender;
    
    if (isShowSlideView == YES)
    {
        slideView.hidden = YES;
        isShowSlideView = NO;
        
    }
    
    else
    {
        slideView.hidden = NO;
        [self openSlideView];
        isShowSlideView = YES;
    }
}

- (void) openSlideView
{
    // Give the frame to SlideView
    slideView.topestItem = _navigationView.frame;
    
    // show the width of slideView
    slideView.showSlideViewWidth = @"50%";
    
    // show the height of slideView
    slideView.showSlideViewHeight = @"100%";
    
    // set the color of SlideView
    slideView.colorCode = @"8cc540";
    
    // If SlideView show from bottom
    slideView.isSVShowFromBottom = YES;
    
    // For tableView
    slideView.doYouWantTableView = YES;
    slideView.itemsOnTV = @[@"One", @"Two", @"Three", @"Four", @"Five", @"Six", @"Seven"];
    
    // Add slideView in ViewController
    [self.view addSubview:slideView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
