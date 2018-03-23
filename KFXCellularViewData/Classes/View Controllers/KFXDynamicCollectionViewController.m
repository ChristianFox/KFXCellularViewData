/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXCellularViewData
 *
 ************************************/

#import "KFXDynamicCollectionViewController.h"

@interface KFXDynamicCollectionViewController () <KFXCellularViewDataDelegate>

@end

@implementation KFXDynamicCollectionViewController

@synthesize collectionData = _collectionData;


//======================================================
#pragma mark - ** Public Methods **
//======================================================
//--------------------------------------------------------
#pragma mark Accessors
//--------------------------------------------------------
-(void)setCollectionData:(KFXCollectionViewData *)collectionData{
    if (collectionData != _collectionData) {
        _collectionData = collectionData;
        _collectionData.delegate = self;
    }
}

-(KFXCollectionViewData *)collectionData{
    if (!_collectionData) {
        _collectionData = [KFXCollectionViewData collectionViewData];
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
    //    if (sectionData == nil) {
    //        return nil;
    //    }
    NSString *reuseIdentifier;
    if (sectionData.headerViewReuseIdentifier != nil) {
        reuseIdentifier = sectionData.headerViewReuseIdentifier;
    }else if (sectionData.footerViewReuseIdentifier != nil){
        reuseIdentifier = sectionData.footerViewReuseIdentifier;
    }
    //    if (reuseIdentifier == nil) {
    //        return nil;
    //    }
    UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                                withReuseIdentifier:reuseIdentifier
                                                                                       forIndexPath:indexPath];
    return reusableView;
}

//--------------------------------------------------------
#pragma mark KFXCellularViewDataDelegate
//--------------------------------------------------------
//-----------------------------------
// Sections
//-----------------------------------
-(void)cellularViewData:(KFXCellularViewData *)cellularViewData didInsertSections:(NSArray<KFXSectionData *> *)sectionDatas atIndexes:(NSArray<NSIndexSet *> *)indexSets{
    
    if (sectionDatas.count >= 1
        && indexSets.count >= 1) {
        dispatch_async(dispatch_get_main_queue(), ^{
            for (NSIndexSet *indexSet in indexSets) {
                [self.collectionView insertSections:indexSet];
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
                [self.collectionView deleteSections:indexSet];
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
                [self.collectionView reloadSections:indexSet];
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
            [self.collectionView insertItemsAtIndexPaths:indexPaths];
        });
    }
}


-(void)cellularViewData:(KFXCellularViewData *)cellularViewData
         didDeleteCells:(NSArray<KFXCellData *> *)cellDatas
           atIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    
    if (cellDatas.count >= 1
        && indexPaths.count >= 1) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView deleteItemsAtIndexPaths:indexPaths];
        });
    }
}

-(void)cellularViewData:(KFXCellularViewData*)cellularViewData
         didUpdateCells:(NSArray<KFXCellData*>*)cellDatas
           atIndexPaths:(NSArray<NSIndexPath*>*)indexPaths{
    
    if (cellDatas.count >= 1
        && indexPaths.count >= 1) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadItemsAtIndexPaths:indexPaths];
        });
    }
}










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

