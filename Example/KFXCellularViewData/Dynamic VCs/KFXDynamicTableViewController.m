

#import "KFXDynamicTableViewController.h"
//#import <KFXCellularViewData/KFXTableViewData.h>
//#import "KFXDynamicTableViewData.h"


@interface KFXDynamicTableViewController () <KFXDynamicTableViewDataDelegate>

@end

@implementation KFXDynamicTableViewController

@synthesize tableData = _tableData;

//======================================================
#pragma mark - ** Public Methods **
//======================================================
//--------------------------------------------------------
#pragma mark Accessors
//--------------------------------------------------------
-(void)setTableData:(KFXDynamicTableViewData *)tableData{
    if (tableData != _tableData) {
        _tableData = tableData;
        _tableData.delegate = self;
    }
}

-(KFXDynamicTableViewData *)tableData{
    if (!_tableData) {
        _tableData = [KFXDynamicTableViewData tableViewData];
        _tableData.delegate = self;
    }
    return _tableData;
}


//======================================================
#pragma mark - ** Protocol Methods **
//======================================================
//--------------------------------------------------------
#pragma mark UITableViewDataSource
//--------------------------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.tableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    KFXSectionData *sectionData = self.tableData.sections[section];
    return sectionData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    KFXCellData *cellData = [self.tableData cellForIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellData.reuseIdentifier forIndexPath:indexPath];
    return cell;
}


//--------------------------------------------------------
#pragma mark KFXCellularViewDataDelegate
//--------------------------------------------------------
-(void)tableViewCanDo{
    
    [self.tableView insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:0];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:0];
    [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:0];
    [self.tableView insertRowsAtIndexPaths:@[] withRowAnimation:0];
    [self.tableView reloadRowsAtIndexPaths:@[] withRowAnimation:0];
    [self.tableView deleteRowsAtIndexPaths:@[] withRowAnimation:0];
    
    
}

//-----------------------------------
// Sections
//-----------------------------------

//-----------------------------------
// Cells
//-----------------------------------








@end

















