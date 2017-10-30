

#import "DEMOCVC.h"
// Cells
#import "DEMOCollectionViewCell.h"
// Reuse Views
#import "DEMOCollectionViewSectionHeader.h"

@interface DEMOCVC ()

@end

@implementation DEMOCVC




//======================================================
#pragma mark - ** Public Methods **
//======================================================


//--------------------------------------------------------
#pragma mark - Inject Dependencies
//--------------------------------------------------------



//--------------------------------------------------------
#pragma mark - Actions
//--------------------------------------------------------




//======================================================
#pragma mark - ** Inherited Methods **
//======================================================
//--------------------------------------------------------
#pragma mark - UIViewController
//--------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureCollectionView];
    [self loadInitialCollectionData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



//======================================================
#pragma mark - ** Protocol Methods **
//======================================================
//--------------------------------------------------------
#pragma mark - UICollectionViewDataSource
//--------------------------------------------------------




//--------------------------------------------------------
#pragma mark - UICollectionViewDelegate
//--------------------------------------------------------
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //    id item = self.collectionData[indexPath.row];
    
}



//--------------------------------------------------------
#pragma mark - UICollectionViewDelegateFlowLayout
//--------------------------------------------------------


//======================================================
#pragma mark - ** Private Methods **
//======================================================
-(void)configureCollectionView{

//    self.collectionView.backgroundColor = [UIColor yellowColor];
    [self.collectionView registerNib:[DEMOCollectionViewSectionHeader nib]
          forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                 withReuseIdentifier:[DEMOCollectionViewSectionHeader reuseIdentifier]];

}

-(void)loadInitialCollectionData{
    
    KFXDynamicCollectionViewData *collectionData = [KFXDynamicCollectionViewData collectionViewData];
    for (NSInteger idxA = 0; idxA < 3; idxA++) {
        
        KFXCollectionViewSectionData *sectionData = [KFXCollectionViewSectionData sectionData];
        sectionData.titleForHeader = [NSString stringWithFormat:@"Header Title %ld",(long)idxA];
        sectionData.headerViewReuseIdentifier = [DEMOCollectionViewSectionHeader reuseIdentifier];
        
        for (NSInteger idxB = 0; idxB < 3; idxB++) {
            
            KFXCellData *cellData = [KFXCellData cellData];
            cellData.title = [NSString stringWithFormat:@"Title %ld",(long)idxB];
            cellData.contents = [NSString stringWithFormat:@"Subtitle %ld",(long)idxB];
            cellData.reuseIdentifier = NSStringFromClass([DEMOCollectionViewCell class]);
            [sectionData addCellData:cellData];
        }
        [collectionData addSection:sectionData];
    }
    
    self.collectionData = collectionData;
}

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
