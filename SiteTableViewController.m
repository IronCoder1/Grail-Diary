//
//  SiteTableViewController.m
//  Grail Diary
//
//  Created by MBPinTheAir on 03/05/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import "SiteTableViewController.h"
#import "Site.h"
#import "DetailViewController.h"

@interface SiteTableViewController ()
@property (strong, nonatomic) NSArray *siteList;
@property (strong, nonatomic) NSMutableArray *sites;

@end

@implementation SiteTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Grail Diary";
    
    _sites = [[NSMutableArray alloc]initWithCapacity:0];
    [self loadSites];

}

-(void)loadSites{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sites" ofType:@"json"];
    NSArray *siteList = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    for (NSMutableDictionary *aDict in siteList) {
        
        Site *newSite = [[Site alloc]init];
        newSite.name = aDict[@"name"];
        newSite.location = aDict[@"location"];
        newSite.siteDescription  = aDict[@"description"];
        newSite.siteImageName = aDict[@"image"];
        
        [self.sites addObject:newSite];
        
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.sites count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    Site *iVarOfSite = self.sites[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = [UIColor blueColor];
    cell.textLabel.text = iVarOfSite.name;
    cell.detailTextLabel.text = iVarOfSite.location;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"detailSegue" sender:nil];
    
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
    
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        // the instance of hvc will confirm to delegate
        DetailViewController *dvc =[segue destinationViewController];
        
        NSIndexPath *newPath = [self.tableView indexPathForSelectedRow];
        Site *detailViewSiteInstance = self.sites[newPath.row];
        
        dvc.siteModelObject = detailViewSiteInstance;
    }
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



@end
