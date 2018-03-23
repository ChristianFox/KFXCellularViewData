/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXCellularViewData
 *
 ************************************/

#import "KFXDynamicTableViewController.h"


@interface KFXDynamicTableViewController () <KFXCellularViewDataDelegate>

@end

@implementation KFXDynamicTableViewController

@synthesize tableData = _tableData;


//======================================================
#pragma mark - ** Public Methods **
//======================================================
//--------------------------------------------------------
#pragma mark Accessors
//--------------------------------------------------------
-(void)setTableData:(KFXTableViewData *)tableData{
    if (tableData != _tableData) {
        _tableData = tableData;
        _tableData.delegate = self;
    }
}

-(KFXTableViewData *)tableData{
    if (!_tableData) {
        _tableData = [KFXTableViewData tableViewData];
        _tableData.delegate = self;
    }
    return _tableData;
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
//-----------------------------------
// Sections
//-----------------------------------
-(void)cellularViewData:(KFXCellularViewData *)cellularViewData
      didInsertSections:(NSArray<KFXSectionData *> *)sectionDatas
              atIndexes:(NSArray<NSIndexSet *> *)indexSets{
    
    if (sectionDatas.count >= 1
        && indexSets.count >= 1) {
        dispatch_async(dispatch_get_main_queue(), ^{
            for (NSIndexSet *indexSet in indexSets) {
                [self.tableView insertSections:indexSet
                              withRowAnimation:self.insertSectionAnimation];
            }
            
        });
    }
}

-(void)cellularViewData:(KFXCellularViewData *)cellularViewData
      didDeleteSections:(NSArray<KFXSectionData *> *)sectionDatas
              atIndexes:(NSArray<NSIndexSet *> *)indexSets{
    
    if (sectionDatas.count >= 1
        && indexSets.count >= 1) {
        dispatch_async(dispatch_get_main_queue(), ^{
            for (NSIndexSet *indexSet in indexSets) {
                [self.tableView deleteSections:indexSet
                              withRowAnimation:self.deleteSectionAnimation];
            }
        });
    }
}

-(void)cellularViewData:(KFXCellularViewData*)cellularViewData
      didUpdateSections:(NSArray<KFXSectionData*>*)sectionDatas
              atIndexes:(NSArray<NSIndexSet*>*)indexSets{
    
    if (sectionDatas.count >= 1
        && indexSets.count >= 1) {
        dispatch_async(dispatch_get_main_queue(), ^{
            for (NSIndexSet *indexSet in indexSets) {
                [self.tableView reloadSections:indexSet
                              withRowAnimation:self.reloadSectionAnimation];
            }
        });
    }
}


//-----------------------------------
// Cells
//-----------------------------------
-(void)cellularViewData:(KFXCellularViewData*)cellularViewData
         didInsertCells:(NSArray<KFXCellData*>*)cellDatas
           atIndexPaths:(NSArray<NSIndexPath*>*)indexPaths{
    
    if (cellDatas.count >= 1
        && indexPaths.count >= 1) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView insertRowsAtIndexPaths:indexPaths
                                  withRowAnimation:self.insertRowAnimation];
        });
    }
}


-(void)cellularViewData:(KFXCellularViewData *)cellularViewData
         didDeleteCells:(NSArray<KFXCellData *> *)cellDatas
           atIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    
    if (cellDatas.count >= 1
        && indexPaths.count >= 1) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView deleteRowsAtIndexPaths:indexPaths
                                  withRowAnimation:self.deleteRowAnimation];
        });
    }
}

-(void)cellularViewData:(KFXCellularViewData*)cellularViewData
         didUpdateCells:(NSArray<KFXCellData*>*)cellDatas
           atIndexPaths:(NSArray<NSIndexPath*>*)indexPaths{
    
    if (cellDatas.count >= 1
        && indexPaths.count >= 1) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadRowsAtIndexPaths:indexPaths
                                  withRowAnimation:self.reloadRowAnimation];
        });
    }
}




@end

















