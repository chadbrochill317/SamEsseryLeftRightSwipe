//
//  TableViewController.m
//  SamEsseryLeftRightSwipe
//
//  Created by Sam Essery on 2015-03-27.
//  Copyright (c) 2015 Sam Essery. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController2.h"

@interface TableViewController ()

@property int rowSelectionNumber; 

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    AppDelegate *appDelegate2 = [[UIApplication sharedApplication]delegate];
    NSLog(@"Array Count %i", appDelegate2.theModel.courseArray.count);
    return [appDelegate2.theModel.courseArray count]; 
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Course Identifier" forIndexPath:indexPath];
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    appDelegate.theModel.courseStorage = [CourseClass new];
    appDelegate.theModel.courseStorage = [appDelegate.theModel.courseArray objectAtIndex:indexPath.row];
    cell.textLabel.text = appDelegate.theModel.courseStorage.name;
    if (appDelegate.theModel.courseStorage.selection == 1) {
        cell.detailTextLabel.text = @"YES";
    }else{
        cell.detailTextLabel.text = @"NO"; 
    }
    cell.imageView.image = appDelegate.theModel.courseStorage.thumbnail;
    
    return cell;
    
}


-(void)tableView:(UITableView *)rowSelection didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"row %i", indexPath.row);
    self.rowSelectionNumber = indexPath.row;
    
    // Create new View
    ViewController2 *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Details"];
    
    // Pass data to new view
    detailViewController.Position = self.rowSelectionNumber;
    
    // Push the new view on to the stack
    [self.navigationController pushViewController:detailViewController animated:YES];
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
