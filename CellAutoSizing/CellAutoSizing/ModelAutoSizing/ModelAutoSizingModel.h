//
//  ModelAutoSizingModel.h
//  CellAutoSizing
//
//  Created by wangfang on 16/4/16.
//  Copyright © 2016年 WangDongYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ModelAutoSizingModel : NSObject
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *content;



// cell height

@property (nonatomic, assign) CGFloat cellHeight;
@end
