//
//  DetailViewController.h
//  Grail Diary
//
//  Created by MBPinTheAir on 04/05/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Site.h"


@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *siteImageView;
@property (strong, nonatomic) Site *siteModelObject;
@property (weak, nonatomic) IBOutlet UILabel *descriptnLabel;

@end
