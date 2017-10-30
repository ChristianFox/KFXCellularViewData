

#import "DEMOCVC.h"
// Pods
#import <KFXUtilities/KFXMaths.h>
#import <KFXAdditions/NSObject+KFXAdditions.h>
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


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self kfx_performBlock:^{
        [self randomlyChangeCells];
    } afterDelay:0.5];
    
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
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)theCell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    KFXCellData *cellData = [self.collectionData cellForIndexPath:indexPath];
    DEMOCollectionViewCell *cell = (DEMOCollectionViewCell*)theCell;
    cell.titleLabel.text = cellData.title;
    cell.subtitleLabel.text = cellData.contents;
}

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
    
    KFXCollectionViewData *collectionData = [KFXCollectionViewData collectionViewData];
    collectionData.cellReuseIdentifier = NSStringFromClass([DEMOCollectionViewCell class]);

    for (NSInteger idxA = 0; idxA < 3; idxA++) {
        
        KFXCollectionViewSectionData *sectionData = [KFXCollectionViewSectionData sectionData];
        sectionData.titleForHeader = [NSString stringWithFormat:@"Header Title %ld",(long)idxA];
        sectionData.headerViewReuseIdentifier = [DEMOCollectionViewSectionHeader reuseIdentifier];
        
        for (NSInteger idxB = 0; idxB < 3; idxB++) {
            
            KFXCellData *cellData = [KFXCellData cellData];
            cellData.title = [NSString stringWithFormat:@"Title %ld",(long)idxB];
            cellData.contents = [NSString stringWithFormat:@"Subtitle %ld",(long)idxB];
            [sectionData addCellData:cellData];
        }
        [collectionData addSection:sectionData];
    }
    self.collectionData = collectionData;
}


//--------------------------------------------------------
#pragma mark Dynamic
//--------------------------------------------------------
-(void)randomlyChangeCells{
    
    NSInteger sectionIndex;
    NSInteger rowIndex;
    if (self.collectionData.count == 0) {
        sectionIndex = 0;
        rowIndex = 0;
        [self kfx_performBlock:^{
            [self insertSectionDataAtIndex:[NSIndexPath indexPathForRow:rowIndex inSection:sectionIndex]];
        } afterDelay:1.0];
        return;
    }
    sectionIndex = (NSInteger)randomIntWithMinAndMax(0,(int)self.collectionData.count-1);
    if (self.collectionData.sections[sectionIndex].count == 0) {
        rowIndex = 0;
        [self kfx_performBlock:^{
            [self insertSectionDataAtIndex:[NSIndexPath indexPathForRow:rowIndex inSection:sectionIndex]];
        } afterDelay:1.0];
        return;
    }
    rowIndex = (NSInteger)randomIntWithMinAndMax(0, (int)self.collectionData.sections[sectionIndex].count-1);
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:rowIndex inSection:sectionIndex];
    int randomActionInt = randomIntWithMinAndMax(0, 4);
    //    randomActionInt = 0;
    [self kfx_performBlock:^{
        
        switch (randomActionInt) {
            case 0:{
                [self removeCellDataWithIndexPath:indexPath];
                break;
            }
            case 1:{
                [self insertSectionDataAtIndex:indexPath];
                break;
            }
            case 2:{
                [self updateCellDataAtIndex:indexPath];
                break;
            }
            case 3:{
                [self removeSectionDataAtIndex:indexPath];
                break;
            }
            case 4:{
                [self insertCellDataAtIndexPath:indexPath];
                break;
            }
            default:
                NSAssert(NO,@"Hit default case of a switch statement. %s. Value is : %ld",__PRETTY_FUNCTION__, (long)randomActionInt);
                
                break;
        }
    } afterDelay:1.0];
}

-(void)removeCellDataWithIndexPath:(NSIndexPath*)indexPath{
    
    if (self.collectionData.count == 0) {
        return;
    }
    
    KFXCollectionViewSectionData *sectionData = self.collectionData.sections[indexPath.section];
    if (sectionData.cells.count > indexPath.row) {
        NSLog(@"Will remove cellData at row: %ld; section: %lu",(long)indexPath.row,(long)indexPath.section);
        [self.collectionData deleteCellDataAtIndexPath:indexPath];
    }
    
    [self randomlyChangeCells];
}

-(void)insertCellDataAtIndexPath:(NSIndexPath*)indexPath{
    
    if (self.collectionData.count == 0) {
        return;
    }
    
    NSLog(@"Will insert cellData at row: %ld; section: %lu",(long)indexPath.row,(long)indexPath.section);
    
    KFXCollectionViewSectionData *sectionData = self.collectionData.sections[indexPath.section];
    if (sectionData.cells.count >= indexPath.row) {
        KFXCellData *cellData = [KFXCellData cellData];
        cellData.title = [NSString stringWithFormat:@"Inserted"];
        cellData.contents = [NSString stringWithFormat:@"Section: %ld; Row: %ld",(long)indexPath.section,(long)indexPath.row];
        [self.collectionData insertCellData:cellData atIndexPath:indexPath];
    }
    [self randomlyChangeCells];
}

-(void)updateCellDataAtIndex:(NSIndexPath*)indexPath{
    
    if (self.collectionData.count == 0) {
        return;
    }
    
    NSLog(@"Will update cellData at row: %ld; section: %lu",(long)indexPath.row,(long)indexPath.section);
    
    KFXCollectionViewSectionData *sectionData = self.collectionData.sections[indexPath.section];
    if (sectionData.cells.count > indexPath.row) {
        KFXCellData *cellData = [self.collectionData cellForIndexPath:indexPath];
        cellData.title = @"Updated";
        cellData.contents = [NSString stringWithFormat:@"Section: %ld; Row: %ld",(long)indexPath.section,(long)indexPath.row];
    }
    
    [self randomlyChangeCells];
}

-(void)insertSectionDataAtIndex:(NSIndexPath*)indexPath{
    
    NSLog(@"Will insert sectionData at section: %lu",(long)indexPath.section);
    
    KFXCollectionViewSectionData *sectionData = [KFXCollectionViewSectionData sectionData];
    sectionData.titleForHeader = [NSString stringWithFormat:@"Inserted Section: %ld",indexPath.section];
    sectionData.headerViewReuseIdentifier = [DEMOCollectionViewSectionHeader reuseIdentifier];
    KFXCellData *cellData = [KFXCellData cellData];
    cellData.title = [NSString stringWithFormat:@"Inserted"];
    cellData.contents = [NSString stringWithFormat:@"Inserted with Section: %ld;",(long)indexPath.section];
    [sectionData addCellData:cellData];
    [self.collectionData insertSection:sectionData atIndex:indexPath.section];
    [self randomlyChangeCells];
    
}

-(void)removeSectionDataAtIndex:(NSIndexPath*)indexPath{
    
    if (self.collectionData.count == 0) {
        return;
    }
    
    if (self.collectionData.count > indexPath.section) {
        NSLog(@"Will remove sectionData section: %lu",(long)indexPath.section);
        [self.collectionData deleteSectionAtIndex:indexPath.section];
    }
    [self randomlyChangeCells];
    
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
