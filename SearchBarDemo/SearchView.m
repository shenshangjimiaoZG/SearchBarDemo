#import "SearchView.h"
#import <Masonry/Masonry.h>

@interface SearchView()

@property (nonatomic,strong)UIImageView *leftIcon;

@end


@implementation SearchView

-(instancetype)initWithDelegate:(id)searchDelegate
{
    
    
    self=[super init];
    if(self)
    {
        
       
        
        self.leftIcon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_search"]];
        
        [self addSubview:self.leftIcon];
        
      
        
        
        //2. 设置圆角和边框颜色
        UITextField *searchField = [self valueForKey:@"searchField"];
        if (searchField) {
            [searchField setBackgroundColor:[UIColor whiteColor]];
            searchField.layer.cornerRadius = 14.0f;
            searchField.layer.borderColor = [UIColor colorWithRed:247/255.0 green:75/255.0 blue:31/255.0 alpha:1].CGColor;
            searchField.layer.borderWidth = 1;
            searchField.layer.masksToBounds = YES;
        }
        
        self.delegate=searchDelegate;
        self.barTintColor=[UIColor whiteColor];
        self.backgroundImage=[[UIImage alloc]init];
        self.barStyle=UISearchBarStyleDefault;
       
        
        
        
       
        
       
    }
    return self;
}
-(void)layoutSubviews
{
    [self.leftIcon mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self);
        make.left.equalTo(self.mas_left).offset(15);
        make.size.mas_equalTo(self.leftIcon.image.size);
    }];
    
    [super layoutSubviews];
}
@end
