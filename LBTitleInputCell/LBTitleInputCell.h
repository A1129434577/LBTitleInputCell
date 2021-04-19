//
//  LBTitleInputCell.h
//  MBP_MAPP
//
//  Created by 刘彬 on 16/4/11.
//  Copyright © 2016年 刘彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBTextField.h"

@interface LBTitleInputCell : UITableViewCell
@property(nonatomic,strong,readonly)UILabel *titleLabel;
@property(nonatomic,strong,readonly)LBTextField *inputTextField;


/// 初始化方法
/// @param tableView 所在tableView
/// @param reuseIdentifier 重用标识
/// @param array 标题数组（既可以是单数组也可以是分组数组）
/// @param font 文字font
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView *)tableView titleArray:(NSArray *)array font:(UIFont *)font;
@end
