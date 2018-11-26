//
//  ResultViewController.m
//  MultilingualTool
//
//  Created by POPLAR on 2018/11/26.
//  Copyright © 2018 POPLAR. All rights reserved.
//

#import "ResultViewController.h"
#import <SVProgressHUD.h>

@interface ResultViewController ()
@property (weak, nonatomic) IBOutlet UITextView *resTextView;
@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Result";
    [self.resTextView setEditable:NO];
    self.resTextView.text = self.result;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Copy All" style:UIBarButtonItemStylePlain target:self action:@selector(copyAllData)];
}

-(void)copyAllData{
    
    UIPasteboard *pBoard = [UIPasteboard generalPasteboard];
    pBoard.string = self.result;
    [SVProgressHUD showSuccessWithStatus:@"successful copy"];
    [SVProgressHUD dismissWithDelay:1.5];
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
