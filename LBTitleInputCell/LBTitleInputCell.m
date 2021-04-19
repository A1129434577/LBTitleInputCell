//
//  LBTitleInputCell.m
//  MBP_MAPP
//
//  Created by 刘彬 on 16/4/11.
//  Copyright © 2016年 刘彬. All rights reserved.
//

#import "LBTitleInputCell.h"
@interface LBTitleInputCell()
@property (nonatomic,assign)CGFloat longestTitleWidth;
@property (nonatomic,strong)UIFont *font;
@end
@implementation LBTitleInputCell

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView *)tableView titleArray:(NSArray *)array font:(UIFont *)font{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        _font = font?font:[UIFont systemFontOfSize:16];
        
        //将分组Array变成一个Array
        if ([[array firstObject] isKindOfClass:[NSArray class]]) {
            NSMutableArray *tempArray = [[NSMutableArray alloc] init];
            [array enumerateObjectsUsingBlock:^(NSArray *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [tempArray addObjectsFromArray:obj];
            }];
            array = tempArray;
        }
        
        //用_titleLabel去计算最长的title
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = _font;
        _titleLabel.numberOfLines = 0;
        [self.contentView addSubview:_titleLabel];
        
        __weak typeof(_titleLabel) weakTitleLabel = _titleLabel;
        NSArray *titleSortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
            weakTitleLabel.text = obj1;
            CGSize labelSize1 = [weakTitleLabel sizeThatFits:CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
            weakTitleLabel.text = obj2;
            CGSize labelSize2 = [weakTitleLabel sizeThatFits:CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
            return labelSize1.width < labelSize2.width;
        }];
        
        _titleLabel.text = [titleSortedArray firstObject];
        _longestTitleWidth = [_titleLabel sizeThatFits:CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))].width;
        
        _titleLabel.text = nil;
        
        _titleLabel.frame = CGRectMake(tableView.layoutMargins.left, CGFLOAT_MIN, _longestTitleWidth, CGFLOAT_MIN);
        
        _inputTextField = [[LBTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_titleLabel.frame)+10, CGFLOAT_MIN, CGRectGetWidth(tableView.frame)-(CGRectGetMaxX(_titleLabel.frame)+10)-tableView.layoutMargins.right, CGFLOAT_MIN)];
        _inputTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _inputTextField.font = _font;
        [self.contentView addSubview:_inputTextField];
        
    }
    
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    _titleLabel.frame = CGRectMake(CGRectGetMinX(_titleLabel.frame), CGRectGetMinY(_titleLabel.frame), CGRectGetWidth(_titleLabel.frame), CGRectGetHeight(self.contentView.frame)-CGRectGetMinY(_titleLabel.frame)*2);
    _inputTextField.frame = CGRectMake(CGRectGetMinX(_inputTextField.frame), CGRectGetMinY(_inputTextField.frame), CGRectGetWidth(_inputTextField.frame), CGRectGetHeight(self.contentView.frame)-CGRectGetMinY(_inputTextField.frame)*2);
    
}
@end
