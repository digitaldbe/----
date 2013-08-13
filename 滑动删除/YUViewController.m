//
//  YUViewController.m
//  滑动删除
//
//  Created by chen on 12/8/13.
//  Copyright (c) 2013 IOSCHEN复习. All rights reserved.
//

#import "YUViewController.h"

@interface YUViewController ()

@end

@implementation YUViewController
//@synthesize忽略，可以不写
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    NSMutableArray *array=[NSMutableArray arrayWithObjects:@"one",@"two",@"three",@"four",@"five", nil];
    self.list=array;
    
//    UIImageView *imgView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0,320,100)];
//    imgView.backgroundColor = [UIColor redColor];//因为没有设置image属性，为了显示出图片覆盖区域
//    imgView.userInteractionEnabled=YES;
//    UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage)];
//    [imgView addGestureRecognizer:singleTap];
//    [imgView addSubview:imgView];
}
//-(void)onClickImage{
//    NSLog(@"图片被点击!");
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.list count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"CellIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {//if(cell==nil)
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }else{
        while ([cell.contentView.subviews lastObject ]!=nil) {
            [(UIView*)[cell.contentView.subviews lastObject]removeFromSuperview];
        }
    }
    cell.textLabel.text=[self.list objectAtIndex:[indexPath row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //滑动删除
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.list removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source.
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //需要的移动行
    NSInteger fromRow = [sourceIndexPath row];
    //获取移动某处的位置
    NSInteger toRow = [destinationIndexPath row];
    //从数组中读取需要移动行的数据
    id object = [self.list objectAtIndex:fromRow];
    //在数组中移动需要移动的行的数据
    [self.list removeObjectAtIndex:fromRow];
    //把需要移动的单元格数据在数组中，移动到想要移动的数据前面
    [self.list insertObject:object atIndex:toRow];
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
