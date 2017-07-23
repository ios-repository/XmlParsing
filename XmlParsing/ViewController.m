//
//  ViewController.m
//  XmlParsing
//
//  Created by Surendra on 6/6/17.
//  Copyright © 2017 Surendra. All rights reserved.
//

#import "ViewController.h"
#import "AllCategeriesViewController.h"

@interface ViewController ()<NSXMLParserDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) NSMutableArray *arrayCharacterTypes;
@property (nonatomic, strong) NSMutableDictionary *dictCharacters;
@property (nonatomic, strong) NSMutableString *charactersString;
@property (nonatomic, strong) NSMutableArray *resultArray;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *file = [[NSBundle mainBundle] pathForResource:@"characters" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:file];
    NSXMLParser *xmlParser = [[NSXMLParser alloc]initWithData:xmlData];
    xmlParser.delegate = self;
    [xmlParser parse];
}



-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    
    if ([elementName isEqualToString:@"Characters"]) {
        self.arrayCharacterTypes = [[NSMutableArray alloc]init];
    }
    if ([elementName isEqualToString:@"Load"]) {
        self.dictCharacters = [NSMutableDictionary dictionaryWithDictionary:attributeDict];
    }
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(nonnull NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName{
    
    if ([elementName isEqualToString:@"Load"]) {
        [self.arrayCharacterTypes addObject:self.dictCharacters];
    }
    if ([elementName isEqualToString:@"Characters"]) {
        NSLog(@"%@",self.arrayCharacterTypes);
        
        self.resultArray = [NSMutableArray new];
        NSArray *arrayKeys = [self.arrayCharacterTypes valueForKeyPath:@"@distinctUnionOfObjects.Type"];
        for (NSString *keyVal in arrayKeys)
        {
            NSMutableDictionary *entry = [NSMutableDictionary new];
            NSArray *images = [self.arrayCharacterTypes filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"Type = %@", keyVal]];
            NSArray *imageArray = [images valueForKeyPath:@"Path"];
            [entry setObject:imageArray forKey:keyVal];
            [self.resultArray addObject:entry];
        }
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.collectionView reloadData];
        
    }
    self.charactersString = nil;
}

# pragma CollectionView

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.resultArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Ccell";
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    UILabel *lbl = (UILabel *)[cell.contentView viewWithTag:50];
    lbl.text = [[self.resultArray objectAtIndex:indexPath.row]allKeys][0];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    AllCategeriesViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"AllCategeriesViewController"];
    NSString *key = [[self.resultArray objectAtIndex:indexPath.row]allKeys][0];
    controller.arrayData = [[self.resultArray objectAtIndex:indexPath.row] objectForKey:key];
    [self.navigationController pushViewController:controller animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
