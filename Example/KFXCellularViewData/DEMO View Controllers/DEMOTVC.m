


#import "DEMOTVC.h"
// Pods
#import <KFXUtilities/KFXMaths.h>
#import <KFXAdditions/NSObject+KFXAdditions.h>
// Cells
#import "DEMOTableViewCell.h"

@interface DEMOTVC ()

@end

@implementation DEMOTVC


//======================================================
#pragma mark - ** Public Methods **
//======================================================


//--------------------------------------------------------
#pragma mark Inject Dependencies
//--------------------------------------------------------


//--------------------------------------------------------
#pragma mark Actions
//--------------------------------------------------------




//======================================================
#pragma mark - ** Inherited Methods **
//======================================================
//--------------------------------------------------------
#pragma mark UIViewController
//--------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTableView];
    [self loadInitialTableData];
    
}

//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self kfx_performBlock:^{
        [self randomlyChangeCells];
    } afterDelay:0.5];
    
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//}





//======================================================
#pragma mark - ** Protocol Methods **
//======================================================
//--------------------------------------------------------
#pragma mark UITableViewDataSource
//--------------------------------------------------------
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 34.0;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    KFXSectionData *sectionData = self.tableData.sections[section];
    return sectionData.titleForHeader;
}

//--------------------------------------------------------
#pragma mark UITableViewDelegate
//--------------------------------------------------------
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KFXCellData *cellData = [self.tableData cellForIndexPath:indexPath];
    cell.textLabel.text = cellData.title;
    cell.detailTextLabel.text = cellData.contents;
}



//======================================================
#pragma mark - ** Private Methods **
//======================================================
//--------------------------------------------------------
#pragma mark Configure
//--------------------------------------------------------
-(void)configureTableView{
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 70.0f;
    
}

-(void)loadInitialTableData{
    
    KFXTableViewData *tableData = [KFXTableViewData tableViewData];
    tableData.cellReuseIdentifier = NSStringFromClass([DEMOTableViewCell class]);

    for (NSInteger idxA = 0; idxA < 3; idxA++) {
        
        KFXTableViewSectionData *sectionData = [KFXTableViewSectionData sectionData];
        sectionData.titleForHeader = [NSString stringWithFormat:@"Header Title %ld",(long)idxA];

        for (NSInteger idxB = 0; idxB < 3; idxB++) {
            
            KFXCellData *cellData = [KFXCellData cellData];
            cellData.title = [NSString stringWithFormat:@"Title %ld",(long)idxB];
            cellData.contents = [NSString stringWithFormat:@"Subtitle %ld",(long)idxB];
            [sectionData addCellData:cellData];
        }
        [tableData addSection:sectionData];
    }
    self.tableData = tableData;
}


//--------------------------------------------------------
#pragma mark Dynamic
//--------------------------------------------------------
-(void)randomlyChangeCells{
    
    NSInteger sectionIndex;
    NSInteger rowIndex;
    if (self.tableData.count == 0) {
        sectionIndex = 0;
        rowIndex = 0;
        [self kfx_performBlock:^{
            [self insertSectionDataAtIndex:[NSIndexPath indexPathForRow:rowIndex inSection:sectionIndex]];
        } afterDelay:1.0];
        return;
    }
    sectionIndex = (NSInteger)randomIntWithMinAndMax(0,(int)self.tableData.count-1);
    if (self.tableData.sections[sectionIndex].count == 0) {
        rowIndex = 0;
        [self kfx_performBlock:^{
            [self insertSectionDataAtIndex:[NSIndexPath indexPathForRow:rowIndex inSection:sectionIndex]];
        } afterDelay:1.0];
        return;
    }
    rowIndex = (NSInteger)randomIntWithMinAndMax(0, (int)self.tableData.sections[sectionIndex].count-1);
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
    
    if (self.tableData.count == 0) {
        return;
    }
    
    KFXSectionData *sectionData = self.tableData.sections[indexPath.section];
    if (sectionData.cells.count > indexPath.row) {
        NSLog(@"Will remove cellData at row: %ld; section: %lu",(long)indexPath.row,(long)indexPath.section);
        [self.tableData deleteCellDataAtIndexPath:indexPath];
    }
    
    [self randomlyChangeCells];
}

-(void)insertCellDataAtIndexPath:(NSIndexPath*)indexPath{
    
    if (self.tableData.count == 0) {
        return;
    }
    
    NSLog(@"Will insert cellData at row: %ld; section: %lu",(long)indexPath.row,(long)indexPath.section);
    
    KFXSectionData *sectionData = self.tableData.sections[indexPath.section];
    if (sectionData.cells.count >= indexPath.row) {
        KFXCellData *cellData = [KFXCellData cellData];
        cellData.title = [NSString stringWithFormat:@"Inserted"];
        cellData.contents = [NSString stringWithFormat:@"Section: %ld; Row: %ld",(long)indexPath.section,(long)indexPath.row];
        [self.tableData insertCellData:cellData atIndexPath:indexPath];
    }
    [self randomlyChangeCells];
}

-(void)updateCellDataAtIndex:(NSIndexPath*)indexPath{
    
    if (self.tableData.count == 0) {
        return;
    }
    
    NSLog(@"Will update cellData at row: %ld; section: %lu",(long)indexPath.row,(long)indexPath.section);
    
    KFXSectionData *sectionData = self.tableData.sections[indexPath.section];
    if (sectionData.cells.count > indexPath.row) {
        KFXCellData *cellData = [self.tableData cellForIndexPath:indexPath];
        cellData.title = @"Updated";
        cellData.contents = [NSString stringWithFormat:@"Section: %ld; Row: %ld",(long)indexPath.section,(long)indexPath.row];
    }
    
    [self randomlyChangeCells];
}

-(void)insertSectionDataAtIndex:(NSIndexPath*)indexPath{
    
    NSLog(@"Will insert sectionData at section: %lu",(long)indexPath.section);
    
    KFXSectionData *sectionData = [KFXSectionData sectionData];
    sectionData.titleForHeader = [NSString stringWithFormat:@"Inserted Section: %ld",indexPath.section];
    KFXCellData *cellData = [KFXCellData cellData];
    cellData.title = [NSString stringWithFormat:@"Inserted"];
    cellData.contents = [NSString stringWithFormat:@"Inserted with Section: %ld;",(long)indexPath.section];
    [sectionData addCellData:cellData];
    [self.tableData insertSection:sectionData atIndex:indexPath.section];
    [self randomlyChangeCells];
    
}

-(void)removeSectionDataAtIndex:(NSIndexPath*)indexPath{
    
    if (self.tableData.count == 0) {
        return;
    }
    
    if (self.tableData.count > indexPath.section) {
        NSLog(@"Will remove sectionData section: %lu",(long)indexPath.section);
        [self.tableData deleteSectionAtIndex:indexPath.section];
    }
    [self randomlyChangeCells];
    
}


//--------------------------------------------------------
#pragma mark Lazy Load
//--------------------------------------------------------




//======================================================
#pragma mark - ** Navigation **
//======================================================
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

//}













@end
