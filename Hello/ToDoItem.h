//
//  ToDoItem.h
//  Hello
//
//  Created by lqx on 16/4/21.
//  Copyright © 2016年 lqx. All rights reserved.
//

#import <Foundation/Foundation.h>

//每个对象都是一个待办事项
@interface ToDoItem : NSObject

@property NSString *itemName;//名字
@property BOOL isCompleted;//状态标记
@property NSDate *creationTime;//时间


@end
