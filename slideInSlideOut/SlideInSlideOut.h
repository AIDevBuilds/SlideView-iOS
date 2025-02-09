//
//  SlideInSlideOut.h
//  slideInSlideOut
//
//  Created by Sandeep Singh on 05/12/16.
//  Copyright © 2016 Sandeep Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideInSlideOut : UIView <UITableViewDelegate, UITableViewDataSource>

// Set slideView Frame
@property (strong, nonatomic) NSString  *showSlideViewWidth;
@property (strong, nonatomic) NSString  *showSlideViewHeight;
@property (strong, nonatomic) NSArray *itemsOnTV;

// Boolean properties
@property BOOL isSVShowFromBottom;
@property BOOL doYouWantTableView;

// Get another frame this is because i want to show my slideview at the bottom of button and etc.
@property CGRect topestItem;

@property (strong, nonatomic) NSString *colorCode;

//method for slideView Y index


@end
