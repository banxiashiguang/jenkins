//
//  ToDoListTableViewController.h
//  Hello
//
//  Created by lqx on 16/4/20.
//  Copyright © 2016年 lqx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoListTableViewController : UITableViewController

//保存每个代办事项
@property NSMutableArray *list;


//从Add-To-Do-List向To-Do-List采用unwind过渡，需要在目的视图控制器中添加以下代码
- (IBAction) gotoToDoList:(UIStoryboardSegue *) segue;

@end