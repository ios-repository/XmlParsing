//
//  AllCategeriesViewController.m
//  XmlParsing
//
//  Created by Surendra on 6/6/17.
//  Copyright © 2017 Surendra. All rights reserved.
//

#import "AllCategeriesViewController.h"

@interface AllCategeriesViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tblView;
@end

@implementation AllCategeriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"CTCell";
    UITableViewCell *cell = [self.tblView dequeueReusableCellWithIdentifier:@"CTCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CTCell"];
    }
    UILabel *lbl = (UILabel *)[cell.contentView viewWithTag:25];
    lbl.text = [self.arrayData objectAtIndex:indexPath.row];
    return cell;
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
