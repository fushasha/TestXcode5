//
//  TheTableViewController.m
//  TestXcode5
//
//  Created by Albert Chu on 13-9-19.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "TheTableViewController.h"

@interface TheTableViewController ()
<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *tableView_;
}

@end


@implementation TheTableViewController

- (void)leftBarButtonItemPressed:(UIBarButtonItem *)barButtonItem
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = @"表视图";
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    DLog(@"frameHeight: %f", Screen_Height);
        
    //[self.navigationController.navigationBar setBackgroundImage:PNGIMAGE(@"nav_bar") forBarMetrics:UIBarMetricsDefault];
    
    
    //-- leftItem ----------------------------------------------------------------------------------
    UIBarButtonItem *leftButtonItem =
    [[UIBarButtonItem alloc]initWithTitle:@"Done"
                                    style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(leftBarButtonItemPressed:)];
    
    leftButtonItem.tintColor =  RGBCOLOR(62, 132, 182);
    
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    //--------------------------------------------------------------------------------------------//
    
    
    //-- 表视图 -----------------------------------------------------------------------------------
    tableView_ =
    [[UITableView alloc] initWithFrame:CGRectMake(0, 80, App_Frame_Width, Screen_Height-164)
                                 style:UITableViewStylePlain];
    
    tableView_.backgroundColor = [UIColor blueColor];
    tableView_.opaque = NO;
    tableView_.backgroundView = nil;
    
    tableView_.separatorColor = [UIColor clearColor];
    
    
    [tableView_ setDataSource:self];
    [tableView_ setDelegate:self];
    [self.view addSubview:tableView_];
    
    
    if (SystemVersion_floatValue >= 7)
    {
        //self.edgesForExtendedLayout = UIRectEdgeNone;  // iOS 7 only
    }
    
    
    //---------------------------------------------------------------------------------
    DLog(@"%f,%f,%f,%f",
         
         tableView_.frame.origin.x,
         tableView_.frame.origin.y,
         tableView_.frame.size.width,
         tableView_.frame.size.height
         
         );
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 4;
    }
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section   = [indexPath section];
    NSInteger row       = [indexPath row];
    
    NSString *identifier = [NSString stringWithFormat:@"CellIdentifier__%d__%d", section, row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if ( nil == cell )
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        cell.contentView.backgroundColor = [UIColor cyanColor];
        
        cell.textLabel.textColor = [UIColor brownColor];
        
    }
    
    
    // config the cell
    cell.textLabel.text = [NSString stringWithFormat:@"s%d--r%d", section, row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, App_Frame_Width, 30.f)];
    headerView.backgroundColor = RGBACOLOR(200, 220, 250, 0.9);
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(12.f, 0.f, 200.f, 30.f)];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.text = [NSString stringWithFormat:@"section %d", section];
    
    [headerView addSubview:headerLabel];
    
    return headerView;
}

#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


@end