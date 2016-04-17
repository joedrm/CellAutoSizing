//
//  FrameFModel.h
//  CellAutoSizing
//
//  Created by wangfang on 16/4/16.
//  Copyright © 2016年 WangDongYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CellModel.h"


@class CellModel;
@interface FrameFModel : NSObject

@property (nonatomic, strong) CellModel *frameCellM;

@property (nonatomic, assign) CGRect iconViewF;
@property (nonatomic, assign) CGRect contentF;

@property (nonatomic, assign) CGFloat cellHeight;

@end
