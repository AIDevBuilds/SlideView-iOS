//
//  SlideInSlideOut.m
//  slideInSlideOut
//
//  Created by Sandeep Singh on 05/12/16.
//  Copyright © 2016 Sandeep Singh. All rights reserved.
//

#import "SlideInSlideOut.h"

@implementation SlideInSlideOut


- (void)didMoveToSuperview
{
    self.hidden = NO;
    
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    
    NSString *width = [NSString stringWithFormat:@"%f",screenSize.size.width];
    NSString *height = [NSString stringWithFormat:@"%f",screenSize.size.height];
    
    // REMOVE "%" FROM STRING
    _showSlideViewWidth = [_showSlideViewWidth substringToIndex:[_showSlideViewWidth length] -1];
    _showSlideViewHeight = [_showSlideViewHeight substringToIndex:[_showSlideViewHeight length] -1];
    
    // Here calculated width and height
    float calculatedWidth = [width intValue] * [_showSlideViewWidth intValue]/100;
    float calculatedHeight = [height intValue] * [_showSlideViewHeight intValue]/100;
    
    // Set the background color of slideView
    self.backgroundColor = [self colorWithHexString:_colorCode];
    
    if (_isSVShowFromBottom == YES)
    {
        NSLog(@"%f",_topestItem.origin.y);
        NSLog(@"%f",_topestItem.size.height);
        self.frame = CGRectMake(0, _topestItem.size.height+_topestItem.origin.y, calculatedWidth, calculatedHeight);
    }
    else
    {
        // Calculated slideView
        self.frame = CGRectMake(0, 0, calculatedWidth, calculatedHeight);
    }
    
    if (_doYouWantTableView == YES)
    {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(1, 0, self.frame.size.width - 2, self.frame.size.height)];
        
        // if user want to show separator line between items
        //tableView.separatorColor = [UIColor clearColor];
        
        tableView.delegate = self;
        tableView.dataSource = self;
        [self addSubview:tableView];
    }
    else
    {
        NSLog(@"Nothing to show");
    }
}

// Show color using color code
- (UIColor *)colorWithHexString:(NSString*)hexString
{
    NSString *stringInUpperCase = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([stringInUpperCase length] < 6)
    {
        return [UIColor grayColor];
    }
    
    // strip 0X if it appears
    if ([stringInUpperCase hasPrefix:@"0X"])
    {
        stringInUpperCase = [stringInUpperCase substringFromIndex:2];
    }
    
    if ([stringInUpperCase length] != 6)
    {
        return  [UIColor grayColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [stringInUpperCase substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [stringInUpperCase substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [stringInUpperCase substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _itemsOnTV.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"tableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // if user want to show cell selected color
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = [_itemsOnTV objectAtIndex:indexPath.row];
    
    return cell;
}

 -(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
            NSLog(@"%ld",(long)indexPath.row);
            break;
            
            case 1:
            NSLog(@"%ld",(long)indexPath.row);
            break;
            
        default:
            break;
    }
}

@end
