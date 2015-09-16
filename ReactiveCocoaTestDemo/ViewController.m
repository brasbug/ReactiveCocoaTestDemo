//
//  ViewController.m
//  ReactiveCocoaTestDemo
//
//  Created by Jack on 15/9/16.
//  Copyright (c) 2015年 Jack. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textfield01;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  

//    [[self.textfield01.rac_textSignal filter:^BOOL(id value) {
//        NSString *text = value;
//        return text.length > 3;
//    }] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
    [[[self.textfield01.rac_textSignal map:^id(NSString * value) {
        return @(value.length);
    }]filter:^BOOL(NSNumber *length) {
        return [length integerValue] > 3;
    }] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
