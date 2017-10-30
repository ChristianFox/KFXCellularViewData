


#import "DEMOTVC.h"
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

//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//}

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
    
    KFXDynamicTableViewData *tableData = [KFXDynamicTableViewData tableViewData];
    
    for (NSInteger idxA = 0; idxA < 3; idxA++) {
        
        KFXTableViewSectionData *sectionData = [KFXTableViewSectionData sectionData];
        sectionData.titleForHeader = [NSString stringWithFormat:@"Header Title %ld",(long)idxA];
        
        for (NSInteger idxB = 0; idxB < 3; idxB++) {
            
            KFXCellData *cellData = [KFXCellData cellData];
            cellData.title = [NSString stringWithFormat:@"Title %ld",(long)idxB];
            cellData.contents = [NSString stringWithFormat:@"Subtitle %ld",(long)idxB];
            cellData.reuseIdentifier =NSStringFromClass([DEMOTableViewCell class]);
            [sectionData addCellData:cellData];
        }
        [tableData addSection:sectionData];
    }
    
    self.tableData = tableData;

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
