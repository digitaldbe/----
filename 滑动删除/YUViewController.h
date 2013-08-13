//
//  YUViewController.h
//  滑动删除
//
//  Created by chen on 12/8/13.
//  Copyright (c) 2013 IOSCHEN复习. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YUViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic)NSMutableArray *list;
@property(strong ,nonatomic)UITableView *tableView;
@property(strong,nonatomic)UITableViewCell *tableViewCell;
@end
