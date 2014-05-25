//
//  CPTAFNetworkingViewController.m
//  CocoaPodsTest
//
//  Created by Анастасия Долгих on 5/25/14.
//  Copyright (c) 2014 Anastasia. All rights reserved.
//

#import "CPTAFNetworkingViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
@interface CPTAFNetworkingViewController ()
@property(nonatomic, strong) IBOutlet UILabel *firstLabel;
@property(nonatomic, strong) IBOutlet UILabel *secondLabel;
@end

@implementation CPTAFNetworkingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)afnetworkingButtonDidClick:(id)sender
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://google.com/resources.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

-(IBAction)mudprogressButtonDidClick:(id)sender
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Changing text in labels";
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        self.firstLabel.text = @"1";
        self.secondLabel.text = @"2";
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
