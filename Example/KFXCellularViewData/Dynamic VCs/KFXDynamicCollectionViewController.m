

#import "KFXDynamicCollectionViewController.h"
//#import <KFXCellularViewData/KFXCollectionViewData.h>
#import "KFXDynamicCollectionViewData.h"

@interface KFXDynamicCollectionViewController () <KFXDynamicCollectionViewDataDelegate>

@end

@implementation KFXDynamicCollectionViewController

@synthesize collectionData = _collectionData;




//======================================================
#pragma mark - ** Public Methods **
//======================================================


//--------------------------------------------------------
#pragma mark - Inject Dependencies
//--------------------------------------------------------



//--------------------------------------------------------
#pragma mark - Actions
//--------------------------------------------------------

//--------------------------------------------------------
#pragma mark Accessors
//--------------------------------------------------------
-(void)setCollectionData:(KFXDynamicCollectionViewData *)collectionData{
    if (collectionData != _collectionData) {
        _collectionData = collectionData;
        _collectionData.delegate = self;
    }
}

-(KFXDynamicCollectionViewData *)collectionData{
    if (!_collectionData) {
        _collectionData = [KFXDynamicCollectionViewData collectionViewData];
        _collectionData.delegate = self;
    }
    return _collectionData;
}



//======================================================
#pragma mark - ** Inherited Methods **
//======================================================
//--------------------------------------------------------
#pragma mark - UIViewController
//--------------------------------------------------------
//- (void)viewDidLoad {
//    [super viewDidLoad];
//}
//
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//}



//======================================================
#pragma mark - ** Protocol Methods **
//======================================================
//--------------------------------------------------------
#pragma mark UICollectionViewDataSource
//--------------------------------------------------------
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.collectionData.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    KFXSectionData *sectionData = self.collectionData.sections[section];
    return sectionData.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    KFXCellData *cellData = [self.collectionData cellForIndexPath:indexPath];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellData.reuseIdentifier forIndexPath:indexPath];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    KFXCollectionViewSectionData *sectionData = [self.collectionData sectionForIndex:indexPath.section];
    NSString *reuseIdentifier;
    if (sectionData.headerViewReuseIdentifier != nil) {
        reuseIdentifier = sectionData.headerViewReuseIdentifier;
    }else if (sectionData.footerViewReuseIdentifier != nil){
        reuseIdentifier = sectionData.footerViewReuseIdentifier;
    }
    UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                                withReuseIdentifier:reuseIdentifier
                                                                                       forIndexPath:indexPath];
    return reusableView;
}

//--------------------------------------------------------
#pragma mark KFXCellularViewDataDelegate
//--------------------------------------------------------
-(void)collectionViewCanDo{
    
    [self.collectionView insertSections:[NSIndexSet indexSetWithIndex:0]];
    [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
    [self.collectionView deleteSections:[NSIndexSet indexSetWithIndex:0]];
    [self.collectionView insertItemsAtIndexPaths:@[]];
    [self.collectionView reloadItemsAtIndexPaths:@[]];
    [self.collectionView deleteItemsAtIndexPaths:@[]];
}
//-----------------------------------
// Sections
//-----------------------------------


//-----------------------------------
// Cells
//-----------------------------------











//======================================================
#pragma mark - ** Private Methods **
//======================================================

//--------------------------------------------------------
#pragma mark - Lazy Load
//--------------------------------------------------------



//======================================================
#pragma mark - ** Navigation **
//======================================================
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//
//
//}
//























@end
