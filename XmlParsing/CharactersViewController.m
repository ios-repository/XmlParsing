//
//  CharactersViewController.m
//  XmlParsing
//
//  Created by Surendra on 6/6/17.
//  Copyright © 2017 Surendra. All rights reserved.
//

#import "CharactersViewController.h"
#import "ViewController.h"

@interface CharactersViewController ()

@end

@implementation CharactersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnCharacterTypesTapped:(id)sender{
    ViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController pushViewController:controller animated:YES];
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
