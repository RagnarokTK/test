//
//  ViewController.m
//  Calendar
//
//  Created by tk on 16/10/9.
//  Copyright © 2016年 tk. All rights reserved.
//

#import "ViewController.h"
#import "DayViewCell.h"
#import "HeadView.h"
#import "DetailViewCell.h"
#import "DayButton.h"
#define SCREENT_WIDTH   CGRectGetWidth([[UIScreen mainScreen] bounds])
#define SCREENT_HEIGHT  CGRectGetHeight([[UIScreen mainScreen] bounds])


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dayArray;
@property (strong, nonatomic) NSMutableArray *weekArray;
@property (strong, nonatomic) NSMutableArray *array0;
@property (strong, nonatomic) NSMutableArray *array1;
@property (strong, nonatomic) NSMutableArray *array2;
@property (strong, nonatomic) NSMutableArray *array3;
@property (strong, nonatomic) NSMutableArray *array4;
@property (strong, nonatomic) NSMutableArray *array5;
@property (strong, nonatomic) NSString *year;
@property (strong, nonatomic) NSString *month;
@property (strong, nonatomic) NSString *yearAndMonth;
@property (strong, nonatomic) NSString *day;
@property (strong, nonatomic) DayButton *oldButton;
@property (strong, nonatomic)NSMutableArray *thingArray;
@property (strong, nonatomic) DayViewCell *dayViewCell;
@property (strong, nonatomic) DetailViewCell *detailViewCell;
@property (strong, nonatomic) NSString *selectDay;
@property (nonatomic) int lastMonthDayNum;
@property (nonatomic) int monthDayNum;
@property (nonatomic) int count;

@property (strong, nonatomic) HeadView *HeadView;

@end

static NSString *DayViewCellIdentify=@"DayViewCell";
static NSString *DetailViewCellIdentify=@"DetailViewCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initData];

    [self initView];

    
}

-(void)initView{
    
 
    self.HeadView = [HeadView headViewFromNib];
    self.HeadView.frame = CGRectMake(0, 0, SCREENT_WIDTH, 102);
       [self.HeadView setDateLabelText:[NSString stringWithFormat:@"%@年%@月",self.year,self.month]];
    //创建block匿名函数之前一般需要对self进行weak化，否则造成循环引用无法释放controller
    __weak typeof(self) weakSelf = self;
    self.HeadView.lastMonthBlock=^(){
        if (weakSelf.month.intValue==1) {
            weakSelf.year=[NSString stringWithFormat:@"%d",weakSelf.year.intValue-1];
        }
        
       weakSelf.month=[NSString stringWithFormat:@"%d",weakSelf.month.intValue-1];
        if (weakSelf.month.intValue==0) {
            weakSelf.month=[NSString stringWithFormat:@"%d",12];
        }
        [weakSelf.array0 removeAllObjects];
        [weakSelf.array1 removeAllObjects];
        [weakSelf.array2 removeAllObjects];
        [weakSelf.array3 removeAllObjects];
        [weakSelf.array4 removeAllObjects];
        [weakSelf.array5 removeAllObjects];
        [weakSelf.weekArray removeAllObjects];
        [weakSelf getArray];
        [weakSelf.HeadView setDateLabelText:[NSString stringWithFormat:@"%@年%@月",weakSelf.year,weakSelf.month]];
        weakSelf.oldButton.selected = NO;
        weakSelf.oldButton.backgroundColor = [UIColor whiteColor];
       
        [weakSelf.tableView reloadData];



    };
    
    self.HeadView.nextMonthBlock=^(){
        
        if (weakSelf.month.intValue==12) {
            weakSelf.year=[NSString stringWithFormat:@"%d",weakSelf.year.intValue+1];
        }
        weakSelf.month=[NSString stringWithFormat:@"%d",weakSelf.month.intValue+1];
        if (weakSelf.month.intValue==13) {
            weakSelf.month=[NSString stringWithFormat:@"%d",1];
        }
        [weakSelf.array0 removeAllObjects];
        [weakSelf.array1 removeAllObjects];
        [weakSelf.array2 removeAllObjects];
        [weakSelf.array3 removeAllObjects];
        [weakSelf.array4 removeAllObjects];
        [weakSelf.array5 removeAllObjects];
        [weakSelf.weekArray removeAllObjects];
        [weakSelf getArray];
        [weakSelf.HeadView setDateLabelText:[NSString stringWithFormat:@"%@年%@月",weakSelf.year,weakSelf.month]];
        weakSelf.oldButton.selected = NO;
        weakSelf.oldButton.backgroundColor = [UIColor whiteColor];
     
        [weakSelf.tableView reloadData];

    };
}

-(void)initData{
    
    [self.tableView registerNib:[UINib nibWithNibName:DayViewCellIdentify bundle:nil] forCellReuseIdentifier:DayViewCellIdentify];
    [self.tableView registerNib:[UINib nibWithNibName:DetailViewCellIdentify bundle:nil] forCellReuseIdentifier:DetailViewCellIdentify];
    self.array0=[NSMutableArray array];
    self.array1=[NSMutableArray array];
    self.array2=[NSMutableArray array];
    self.array3=[NSMutableArray array];
    self.array4=[NSMutableArray array];
    self.array5=[NSMutableArray array];
    self.dayArray=[NSArray array];
    self.thingArray=[NSMutableArray array];
    self.weekArray=[NSMutableArray array];
    
    NSDate *dayDate=[NSDate date];
    NSString *dayStr=[NSString stringWithFormat:@"%@",dayDate];
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];


    self.year=[dayStr substringWithRange:NSMakeRange(0, 4)];
    self.month=[dayStr substringWithRange:NSMakeRange(5, 2)];
    self.day=[dayStr substringWithRange:NSMakeRange(8, 2)];
    self.selectDay=self.day;
    [self getArray];

    self.count=0;
  
    int j=0;
    for (int i=0; i<self.weekArray.count; i++) {
        NSArray *array=[NSArray arrayWithArray:self.weekArray[i]];
        for (NSString *str in array) {
            if (str.intValue==self.day.intValue) {
                self.count=j;
                break;
            }
            j++;
            
           
            
        }

        
        
    }
    
    
  
    
    
    
    
    
    


}
-(void)getArray{

    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *formatterDate = [inputFormatter dateFromString:[NSString stringWithFormat:@"%@-%@-01",self.year,self.month]];
    NSLog(@"%@年%@月",self.year,self.month);
    NSString *week=[self WeekDay:formatterDate];
    switch (self.month.intValue) {
        case 1:
            self.lastMonthDayNum=31;
            self.monthDayNum=31;
            break;
        case 2:
            if ((self.year.intValue%4==0&&self.year.intValue%100!=0)||self.year.intValue%400==0) {
                self.lastMonthDayNum=31;
                self.monthDayNum=29;
                
            }
            else{
                self.lastMonthDayNum=31;
                self.monthDayNum=28;
            }
            break;
        case 3:
            if ((self.year.intValue%4==0&&self.year.intValue%100!=0)||self.year.intValue%400==0) {
                self.lastMonthDayNum=29;
                self.monthDayNum=31;
                
            }
            else{
                self.lastMonthDayNum=28;
                self.monthDayNum=31;
            }
            
            break;
        case 4:
            self.lastMonthDayNum=31;
            self.monthDayNum=30;
            break;
        case 5:
            self.lastMonthDayNum=30;
            self.monthDayNum=31;
            break;
        case 6:
            self.lastMonthDayNum=31;
            self.monthDayNum=30;
            break;
        case 7:
            self.lastMonthDayNum=30;
            self.monthDayNum=31;
            break;
        case 8:
            self.lastMonthDayNum=31;
            self.monthDayNum=31;
            break;
        case 9:
            self.lastMonthDayNum=31;
            self.monthDayNum=30;
            break;
        case 10:
            self.lastMonthDayNum=30;
            self.monthDayNum=31;
            break;
        case 11:
            self.lastMonthDayNum=31;
            self.monthDayNum=30;
            break;
        case 12:
            self.lastMonthDayNum=30;
            self.monthDayNum=31;
            break;
        default:
            break;
    }
    if ([week isEqualToString:@"Saturday"]) {
        self.array0=[NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-6],[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-5],[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-4],[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-3],[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-2],[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-1],[NSString stringWithFormat:@"%d",1], nil];
    }
    if ([week isEqualToString:@"Sunday"]) {
        self.array0=[NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%d",1],[NSString stringWithFormat:@"%d",2],[NSString stringWithFormat:@"%d",3],[NSString stringWithFormat:@"%d",4],[NSString stringWithFormat:@"%d",5],[NSString stringWithFormat:@"%d",6],[NSString stringWithFormat:@"%d",7], nil];
    }
    if ([week isEqualToString:@"Monday"]) {
        self.array0=[NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-1],[NSString stringWithFormat:@"%d",1],[NSString stringWithFormat:@"%d",2],[NSString stringWithFormat:@"%d",3],[NSString stringWithFormat:@"%d",4],[NSString stringWithFormat:@"%d",5],[NSString stringWithFormat:@"%d",6], nil];
    }
    if ([week isEqualToString:@"Tuesday"]) {
        self.array0=[NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-2],[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-1],[NSString stringWithFormat:@"%d",1],[NSString stringWithFormat:@"%d",2],[NSString stringWithFormat:@"%d",3],[NSString stringWithFormat:@"%d",4],[NSString stringWithFormat:@"%d",5], nil];
    }
    if ([week isEqualToString:@"Wednesday"]) {
        self.array0=[NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-3],[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-2],[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-1],[NSString stringWithFormat:@"%d",1],[NSString stringWithFormat:@"%d",2],[NSString stringWithFormat:@"%d",3],[NSString stringWithFormat:@"%d",4], nil];
    }
    if ([week isEqualToString:@"Thursday"]) {
        self.array0=[NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-4],[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-3],[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-2],[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-1],[NSString stringWithFormat:@"%d",1],[NSString stringWithFormat:@"%d",2],[NSString stringWithFormat:@"%d",3], nil];
    }
    if ([week isEqualToString:@"Friday"]) {
        self.array0=[NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-5],[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-4],[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-3],[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-2],[NSString stringWithFormat:@"%d",1+self.lastMonthDayNum-1],[NSString stringWithFormat:@"%d",1],[NSString stringWithFormat:@"%d",2], nil];
    }
    
    for (NSString *str in self.array0) {
        NSString *str1=str;
        if (str.intValue<=7) {
            str1=[NSString stringWithFormat:@"%d",(str.intValue+self.lastMonthDayNum)];
        }
        
        int strInt1=str1.intValue+7;
        strInt1=[self getLastMonthCorrectDay:strInt1];
        [self.array1 addObject:[NSString stringWithFormat:@"%d",strInt1]];
        
        int strInt2=str1.intValue+14;
        strInt2=[self getLastMonthCorrectDay:strInt2];
        [self.array2 addObject:[NSString stringWithFormat:@"%d",strInt2]];
        
        int strInt3=str1.intValue+21;
        strInt3=[self getLastMonthCorrectDay:strInt3];
        [self.array3 addObject:[NSString stringWithFormat:@"%d",strInt3]];

        int strInt4=str1.intValue+28;
        strInt4=[self getMonthCorrectDay:strInt4];
        [self.array4 addObject:[NSString stringWithFormat:@"%d",strInt4]];
        
        int strInt5=str1.intValue+35;
        strInt5=[self getMonthCorrectDay:strInt5];
        [self.array5 addObject:[NSString stringWithFormat:@"%d",strInt5]];
        
        
    }
    NSString *array5num0=self.array5[0];
    if (array5num0.intValue<=7) {
        [self.array5 removeAllObjects];
        self.weekArray=[NSMutableArray arrayWithObjects:self.array0,self.array1,self.array2,self.array3,self.array4, nil];
    }
    else{
    self.weekArray=[NSMutableArray arrayWithObjects:self.array0,self.array1,self.array2,self.array3,self.array4,self.array5, nil];
    }
   

    [self.tableView reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-TableView Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
    

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        if(self.array5.count==0)
            return 5;
        else
            return 6;
    }
    else
        return 1;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
      self.detailViewCell=[tableView dequeueReusableCellWithIdentifier:DetailViewCellIdentify];
   
    self.detailViewCell.selectionStyle =UITableViewCellSelectionStyleNone;
    if (indexPath.section==0) {
    
      self.dayViewCell=[tableView dequeueReusableCellWithIdentifier:DayViewCellIdentify];
       
        NSMutableArray *array=self.weekArray[indexPath.row];
       
        
        __weak typeof(self) weakSelf = self;
        
        self.dayViewCell.setSelectButtonBlock=^(DayButton *btn){
            if (indexPath.row==0&&btn.titleLabel.text.intValue>7) {
                
                [weakSelf lastMonthButtonClick];
                weakSelf.oldButton.selected = NO;
                weakSelf.oldButton.backgroundColor = [UIColor whiteColor];
            }
            else if(indexPath.row==self.weekArray.count-1&&btn.titleLabel.text.intValue<7){
                [weakSelf nextMonthButtonClick];
                weakSelf.oldButton.selected = NO;
                weakSelf.oldButton.backgroundColor = [UIColor whiteColor];
                
            }
            else{
                weakSelf.oldButton.selected = NO;
                weakSelf.oldButton.backgroundColor = [UIColor whiteColor];
                btn.selected = YES;
                btn.backgroundColor = [UIColor redColor];
                weakSelf.oldButton = btn;
            
            }
            weakSelf.selectDay=btn.titleLabel.text;
            [weakSelf.tableView reloadData];
           
            
        };
        
              NSDate *dayDate=[NSDate date];
        NSString *dayStr=[NSString stringWithFormat:@"%@",dayDate];
        NSString *year=[dayStr substringWithRange:NSMakeRange(0, 4)];
        NSString *month=[dayStr substringWithRange:NSMakeRange(5, 2)];
        //NSString *day=[dayStr substringWithRange:NSMakeRange(8, 2)];
      
       
               if ([self.year isEqualToString:year]&&[self.month isEqualToString:month]&&(indexPath.row==self.count/7)) {
            [self.dayViewCell setButtonColor:self.count%7];
            
        }
        else{
            
            [self.dayViewCell clearColor];
        }
        
        if (indexPath.row==0) {
            for (NSString *str in array) {
                if (str.intValue>7) {
                    [self.dayViewCell grayOtherDay:[array indexOfObject:str]];
                }
            }
        }
            
        
       else if(indexPath.row==self.weekArray.count-1)
       {
            for (NSString *str in array) {
                if (str.intValue<=7) {
                    [self.dayViewCell grayOtherDay:[array indexOfObject:str]];
                                 }
                    
                        }
            }

        [self.dayViewCell setButtonDay7:array[0] Day1:array[1] Day2:array[2] Day3:array[3] Day4:array[4] Day5:array[5] Day6:array[6]];
        
        [self.dayViewCell clearThing];
        for (NSDate *thingDate in self.thingArray) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            
            [formatter setDateFormat:@"yyyy"];
            NSString *currentYear=[formatter stringFromDate:thingDate];
            [formatter setDateFormat:@"MM"];
            NSString *currentMonth=[formatter stringFromDate:thingDate];
            [formatter setDateFormat:@"dd"];
            NSString *currentDay=[formatter stringFromDate:thingDate];
            for (NSString *str in array) {
                if (currentYear.intValue == self.year.intValue && currentMonth.intValue ==  self.month.intValue && currentDay.intValue == str.intValue) {
                    [self.dayViewCell setThingSign:str];
                    
                }
                
            }
        }

    self.dayViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return  self.dayViewCell;
        
    }
    self.detailViewCell.detailLabel.text=[NSString stringWithFormat:@"%@%@日",self.HeadView.dateLabel.text,self.selectDay];
    

    
    __weak typeof(self) weakSelf = self;
    
    self.detailViewCell.setAddButtonBlock=^(){
        weakSelf.oldButton.haveThing=YES;
        [weakSelf.oldButton setThingViewByBool:weakSelf.oldButton.haveThing];
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM-dd"];
        
        NSString *string=[NSString stringWithFormat:@"%@-%@-%@",weakSelf.year,weakSelf.month,weakSelf.oldButton.titleLabel.text];
        NSDate *date = [format dateFromString:string];
        [weakSelf.thingArray addObject:date];
        [weakSelf.tableView reloadData];
    
    };
    
    
    return self.detailViewCell;
}






-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return self.HeadView;
    }

    else return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 102;

    }
    return 0.1;

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 10.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return SCREENT_WIDTH/7;
    
    }
    return 35;
}
#pragma mark - date Action
-(NSString *)WeekDay:(NSDate *) day{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"EEEE"];
    
    NSString *newDateString = [outputFormatter stringFromDate:day];
    

    return newDateString;
}
-(int)getLastMonthCorrectDay:(int) day{
    if (day>self.lastMonthDayNum) {
        
        return day-self.lastMonthDayNum;
    
    }

    else return day;
}
-(int)getMonthCorrectDay:(int) day{

    if ((day-self.lastMonthDayNum)>self.monthDayNum) {
        return day-self.lastMonthDayNum-self.monthDayNum;
        }
    
    else return day-self.lastMonthDayNum;
}
-(void)lastMonthButtonClick{
    [self.HeadView LastMonth:self];

}
-(void)nextMonthButtonClick{
    [self.HeadView NextMonth:self];

}

@end
