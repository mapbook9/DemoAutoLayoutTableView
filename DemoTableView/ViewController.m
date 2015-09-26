//
//  ViewController.m
//  DemoTableView
//
//  Created by Hien Tran on 8/11/15.
//  Copyright (c) 2015 Hien Tran. All rights reserved.
//

#import "ViewController.h"
#import "ItemListGuideCell.h"
#import "WesayTableViewCell.h"

#define SYSTEM_VERSION                              ([[UIDevice currentDevice] systemVersion])
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([SYSTEM_VERSION compare:v options:NSNumericSearch] != NSOrderedAscending)
#define IS_IOS8_OR_ABOVE                            (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))

//typedef NS_ENUM(NSInteger, UITableViewType){
//    TOP_INFOR_LOGO = 0,
//    DESCRIPTION_WE_SAY,
//    CONTAINER_BUTTONS
//};

@interface ViewController ()<WesayTableCellDelegate> {

    //Button seemore status
    BOOL isShowAll;
    
}
/*! @Hien This property knows talbleviewcell for list. */
@property (nonatomic, strong) ItemListGuideCell *prototypeCell;
/*! @Hien This property knows table show list data input.*/
@property (weak, nonatomic) IBOutlet UITableView *tableViewList;
/*! @Hien This property knows Current index for row table. */
@property (nonatomic) NSInteger currentIndexRows;
@property (nonatomic) NSInteger isTypeOfCell;
@property (nonatomic, strong) NSString *descriptionString;
@property (nonatomic, strong) NSString *sortDescription;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Set config to run on ios 8
    //self.tableViewList.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Do any additional setup after loading the view, typically from a nib.
    self.descriptionString = @"Professor Sandel introduces Immanuel Kant, a challenging but influential philosopher. Kant rejects utilitarianism. He argues that each of us has certain fundamental duties and rights that take precedence over maximizing utility. Kant rejects the notion that morality is about calculating consequences. When we act out of duty—doing something simply because it is right—only then do our actions have moral worth. Kant gives the example of a shopkeeper who passes up the chance to shortchange a customer only because his business might suffer if other customers found out. According to Kant, the shopkeepers action has no moral worth, because he did the right thing for the wrong reason.PART TWO: THE SUPREME PRINCIPLE OF MORALITY Immanuel Kant says that insofar as our actions have moral worth, what confers moral worth is our capacity to rise above self-interest and inclination and to act out of duty. Sandel tells the true story of a thirteen-year old boy who won a spelling bee contest, but then admitted to the judges that he had, in fact, misspelled the final word. Using this story and others, Sandel explains Kants test for determining whether an action is morally right: to identify the principle expressed in our action and then ask whether that principle could ever become a universal law that every other human being could act on.";
    //Set data for sort description
    self.sortDescription = @"Professor Sandel introduces Immanuel Kant, a challenging but influential philosopher. Kant rejects utilitarianism...";
}

#pragma mark - Configure data for each cell in list explore
#pragma mark - UITableViewDataSouce
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Return number of rows in section.
    return 2;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //http://stg.getgoru.com/static/coupon/assets/images/upload/761ed49691be2d52c80d9fba20871688.jpg
    if ([cell class] == [ItemListGuideCell class]) {
        /// fill data for top cell of tour detail
        ItemListGuideCell *infoCell = (ItemListGuideCell *)cell;
        [infoCell.lblTitle setText: self.descriptionString];
    } else if ([cell class] == [WesayTableViewCell class]) {
        /// fill data for top cell of tour detail
        WesayTableViewCell *infoCell = (WesayTableViewCell *)cell;
        infoCell.delegate = self;
        if (isShowAll == YES) {
                [infoCell.lblInfo setText:self.descriptionString];
        } else {
            [infoCell.lblInfo setText:self.sortDescription];
        }
    }
}

/*! Delegate get cell of row at index */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell;
    [self.prototypeCell setBackgroundColor:[UIColor clearColor]];
    if (indexPath.row == 0) {
        //Get itemListGuideCell
        _prototypeCell = [self.tableViewList dequeueReusableCellWithIdentifier:NSStringFromClass([ItemListGuideCell class])];
    } else if(indexPath.row == 1) {
        //Get Description we say
        _prototypeCell = [self.tableViewList dequeueReusableCellWithIdentifier:NSStringFromClass([WesayTableViewCell class])];
    }
    [self configureCell:self.prototypeCell forRowAtIndexPath:indexPath];
    if (!IS_IOS8_OR_ABOVE) {
        [self.prototypeCell setNeedsUpdateConstraints];
        [self.prototypeCell updateConstraintsIfNeeded];
        [self.prototypeCell setNeedsLayout];
        [self.prototypeCell layoutIfNeeded];
    }
    return self.prototypeCell;
}

/*! Delegate get height of row at index */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.currentIndexRows = indexPath.row;
    if (IS_IOS8_OR_ABOVE) {
        
        return UITableViewAutomaticDimension;
    }
    if (indexPath.row == 0) {
        //Get itemListGuideCell
        _prototypeCell = [self.tableViewList dequeueReusableCellWithIdentifier:NSStringFromClass([ItemListGuideCell class])];
    } else if(indexPath.row == 1) {
        //Get Description we say
        _prototypeCell = [self.tableViewList dequeueReusableCellWithIdentifier:NSStringFromClass([WesayTableViewCell class])];
    }
    [self configureCell:self.prototypeCell forRowAtIndexPath:indexPath];
    [self.prototypeCell setNeedsUpdateConstraints];
    [self.prototypeCell updateConstraintsIfNeeded];
    self.prototypeCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(self.prototypeCell.bounds));
    [self.prototypeCell setNeedsLayout];
    [self.prototypeCell layoutIfNeeded];
    return [self.prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
}
#pragma mark - UITableViewDelegate
/*! Delegate get estimage height of row at index */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

#pragma mark - WesayTableViewCell delegate
-(void)buttonSeeMoreTouchUpInside:(NSIndexPath *)rowIndex {
    //Switch value for flag isShowAll
    isShowAll = !isShowAll;
    //Reload table at row 1
    NSMutableArray *arrayIndex = [NSMutableArray array];
    [arrayIndex addObject:rowIndex];
    [self.tableViewList beginUpdates];
    [self.tableViewList reloadRowsAtIndexPaths:arrayIndex withRowAnimation:UITableViewRowAnimationFade];
    [self.tableViewList endUpdates];
}
@end
