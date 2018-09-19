#import "InfoCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface InfoCollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lblTop;
@property (weak, nonatomic) IBOutlet UILabel *lblBottom;
@end


@implementation InfoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.lblTop mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.centerX.equalTo(self.contentView);
        make.height.equalTo(@30);
        
    }];
    
    [self.lblBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.lblTop.mas_bottom).offset(10);
        make.centerX.equalTo(self.contentView);
        make.width.height.equalTo(self.lblTop);
    }];
}

@end
