//
//  DetailViewController.m
//  Grail Diary
//
//  Created by MBPinTheAir on 04/05/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLabel.text = [NSString stringWithFormat:@"Name: %@",self.siteModelObject.name];
    self.locationLabel.text = [NSString stringWithFormat:@"Location: %@",self.siteModelObject.location ];
    self.descriptnLabel.text= self.siteModelObject.siteDescription;
    self.siteImageView.image = [UIImage imageNamed:self.siteModelObject.siteImageName];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
