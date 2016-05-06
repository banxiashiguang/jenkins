//
//  ToDoListTableViewController.m
//  Hello
//
//  Created by lqx on 16/4/20.
//  Copyright © 2016年 lqx. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItem.h"
#import "XYZAddToDoItemViewController.h"

@interface ToDoListTableViewController ()

@end

@implementation ToDoListTableViewController

//
- (IBAction)gotoToDoList:(UIStoryboardSegue *)segue
{
    XYZAddToDoItemViewController *source = [segue sourceViewController];//取得源视图控制器
    if ([source itemNew] != nil) {
        [self.list addObject:source.itemNew];//添加进list中
        [self.tableView reloadData];
    }
}

//该函数在加载视图的时候调用
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.list = [[NSMutableArray alloc] init];
    [self initLoadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//初始化表格式图中的数据
-(void) initLoadData {
    ToDoItem *t1 = [[ToDoItem alloc] init];
    t1.itemName = @"Buy Milk";
    [self.list addObject:t1];
   
    ToDoItem *t2 = [[ToDoItem alloc] init];
    t2.itemName = @"Read A Book";
    [self.list addObject:t2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//告知视图，有多少个section需要加载到table里
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}
//告知controller每个section需要加载多少个单元或多少行//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.list count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    ToDoItem *item = [self.list objectAtIndex:indexPath.row];
    cell.textLabel.text = item.itemName;
    
    if (item.isCompleted) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewRowAnimationNone;
    }
    
    return cell;
}

//点击单元格时调用此函数
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ToDoItem *item = [self.list objectAtIndex:indexPath.row];//当前行的对象
    item.isCompleted = !item.isCompleted;
    
    //修改完之后，需要重新载入视图数据
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
