//
//  XYZAddToDoItemViewController.m
//  Hello
//
//  Created by lqx on 16/4/20.
//  Copyright © 2016年 lqx. All rights reserved.
//

#import "XYZAddToDoItemViewController.h"

@interface XYZAddToDoItemViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButtion;

@property (weak, nonatomic) IBOutlet UITextField *textFiled;

@end

@implementation XYZAddToDoItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//在segue(离开页面时,离开页面之后调用gotoToDoList)执行之前，系统会通过调用prepareForSegue函数检查用户是点击按钮。
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButtion)
        return;
    if ([[self.textFiled text] length] >0) {
        self.itemNew = [[ToDoItem alloc] init];
        self.itemNew.itemName = self.textFiled.text;
        self.itemNew.isCompleted = NO;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
