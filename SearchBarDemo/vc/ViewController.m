#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "SearchView.h"
#import "InfoCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchBarDelegate>
@property (nonatomic,strong)UICollectionView *listView;
@property (nonatomic,strong)SearchView *searchView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchView=[[SearchView alloc]initWithDelegate:self];
    
    [self.view addSubview:self.searchView];
    
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    self.listView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.listView.dataSource=self;
    self.listView.delegate=self;
    [self.listView registerNib:[UINib nibWithNibName:kInfoCollectionViewCell bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:kInfoCollectionViewCell];
    [self.view addSubview:self.listView];
    
    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.width.equalTo(@300);
        make.height.equalTo(@50);
        make.centerX.equalTo(self.view);
    
    }];
    [self.listView mas_makeConstraints:^(MASConstraintMaker *make) {
        
    make.top.equalTo(self.searchView.mas_safeAreaLayoutGuideBottom);
        make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
        make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
    }];
    
}
#pragma mark collectionview delegate
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(86, 86);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 35;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 35;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    InfoCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:kInfoCollectionViewCell forIndexPath:indexPath];
    if(cell==nil)
    {
        cell=[[NSBundle mainBundle]loadNibNamed:kInfoCollectionViewCell owner:self options:nil].lastObject;
        
    }
    return cell;
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"searchstr %@",searchText);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
