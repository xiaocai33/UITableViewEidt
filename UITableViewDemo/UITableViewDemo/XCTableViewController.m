//
//  XCTableViewController.m
//  UITableViewDemo
//
//  Created by 小蔡 on 16/7/26.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "XCTableViewController.h"

@implementation XCTableViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor grayColor];
    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"5"]];
//    //  创建需要的毛玻璃特效类型
//    /**
//     *  UIBlurEffectStyleExtraLight,
//     *  UIBlurEffectStyleLight,
//     *  UIBlurEffectStyleDark
//     */
//    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
//    
//    //添加到要有毛玻璃特效的控件中
//    UIVisualEffectView *visual = [[UIVisualEffectView alloc] initWithEffect:blur];
//    visual.frame = imageView.bounds;
//    
//    [imageView addSubview:visual];
//    
//    //设置模糊透明度
//    visual.alpha = 0.8;
//    [self.tableView addSubview:imageView];
}

#pragma mark - UITableViewDataSource 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    } else if (section == 1){
        return 5;
    } else{
        return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"XCCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd组 第%zd行", indexPath.section, indexPath.row];
    
    return cell;
}
#pragma mark - UITableViewDelegate 代理方法
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"第一组";
    } else if (section == 1){
        return @"第二组";;
    } else{
        return @"第三组";;
    }
}

/**
 *  设置表格可编辑
 */
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UITableViewRowAction *sendAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"发送" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            NSLog(@"点击了发送");
        }];
        sendAction.backgroundColor = [UIColor orangeColor];
        
        UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            NSLog(@"点击了删除");
        }];
        
        UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"修改" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            NSLog(@"点击了修改");
        }];
        action.backgroundEffect =  [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        
        return @[sendAction, deleteAction, action];
    } else if (indexPath.section == 1){
        UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"修改" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            NSLog(@"点击了修改");
        }];
        //毛玻璃特效类型
        /**
         *  UIBlurEffectStyleExtraLight,
         *  UIBlurEffectStyleLight,
         *  UIBlurEffectStyleDark
         */
        action.backgroundEffect =  [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        return @[action];
    }
    return nil;
}


@end
