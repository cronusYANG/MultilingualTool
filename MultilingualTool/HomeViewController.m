//
//  HomeViewController.m
//  MultilingualTool
//
//  Created by POPLAR on 2018/11/26.
//  Copyright © 2018 POPLAR. All rights reserved.
//

#import "HomeViewController.h"
#import "ResultViewController.h"
#import <SVProgressHUD.h>

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *firstTextView;
@property (weak, nonatomic) IBOutlet UITextView *secondTextView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Multilingual-Tool";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Empty" style:UIBarButtonItemStylePlain target:self action:@selector(emptyClick)];
    
}

-(void)emptyClick{
    self.firstTextView.text = @"";
    self.secondTextView.text = @"";
}

- (IBAction)overturnClick:(id)sender {
    NSString *f = self.firstTextView.text;
    NSString *s = self.secondTextView.text;
    self.firstTextView.text = s;
    self.secondTextView.text = f;
}


- (IBAction)convertClick:(id)sender {
    NSArray *fArray = [_firstTextView.text componentsSeparatedByString:@"\n"];
    NSArray *sArray = [_secondTextView.text componentsSeparatedByString:@"\n"];
    NSMutableArray *resArray = [NSMutableArray array];
    if (fArray.count == sArray.count) {
        for (NSInteger i = 0; i < fArray.count; i++) {
            NSMutableString *mf = [NSMutableString stringWithString:fArray[i]];
            NSString *f;
            f = [mf stringByReplacingOccurrencesOfString:@"\r" withString:@""];
            NSString *ms = [NSMutableString stringWithString:sArray[i]];
            NSString *s;
            s = [ms stringByReplacingOccurrencesOfString:@"\r" withString:@""];
            NSString *res = [NSString stringWithFormat:@"\"%@\" = \"%@\";",f,s];
            [resArray addObject:res];
        }
        
        NSString *resStr = [resArray componentsJoinedByString:@"\n"];
        ResultViewController *vc = [[ResultViewController alloc] init];
        vc.result = resStr;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        [SVProgressHUD showErrorWithStatus:@"转换数量不一致"];
        [SVProgressHUD dismissWithDelay:1.5];
    }
}


@end
