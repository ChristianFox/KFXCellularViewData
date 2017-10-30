/********************************
 *
 * Copyright © 2017 Christian Fox
 * All Rights Reserved
 * Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXCellularViewData
 *
 ************************************/


#import "KFXCellularViewData.h"
#import "KFXSectionData_Private.h"
@import UIKit.UITableView;

@implementation KFXCellularViewData


//======================================================
#pragma mark - ** Public Methods **
//======================================================
//--------------------------------------------------------
#pragma mark - Initilisers
//--------------------------------------------------------
- (instancetype)init
{
	self = [super init];
	if (self) {
		self.sections = [NSMutableArray arrayWithCapacity:5];
	}
	return self;
}

+(instancetype)cellularViewData{
	return [[self alloc]init];
}

//--------------------------------------------------------
#pragma mark - Inject Dependencies
//--------------------------------------------------------


//======================================================
#pragma mark - ** Primary Public Functionality **
//======================================================
//--------------------------------------------------------
#pragma mark SectionData Setters
//--------------------------------------------------------
-(void)addSection:(KFXSectionData *)section{

    section.cellularViewData = self;
	[self.sections addObject:section];
}

-(void)addSections:(NSArray<KFXSectionData *> *)sections{
    
    if (sections.count == 0) {
        return;
    }
    
    for (KFXSectionData *section in sections) {
        section.cellularViewData = self;
        [self.sections addObject:section];
    }
}

-(void)insertSection:(KFXSectionData *)section atIndex:(NSUInteger)index{
    
    if (section == nil) {
        return;
    }else if (index > self.sections.count){
        return;
    }
    section.cellularViewData = self;
    [self.sections insertObject:section atIndex:index];
}

-(void)insertSections:(NSArray<KFXSectionData *> *)sections atIndex:(NSUInteger)index{
    
    if (sections.count == 0) {
        return;
    }else if (index > self.sections.count){
        return;
    }
    for (KFXSectionData *section in sections) {
        section.cellularViewData = self;
    }
    [self.sections insertObjects:sections
                       atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(index, sections.count)]];
}

-(void)deleteSection:(KFXSectionData *)sectionData{
    
    sectionData.cellularViewData = nil;
    [self.sections removeObject:sectionData];
}

-(void)deleteSectionAtIndex:(NSUInteger)index{
    
    if (index >= self.sections.count) {
        return;
    }
    
    KFXSectionData *sectionData = self.sections[index];
    sectionData.cellularViewData = nil;
    [self.sections removeObjectAtIndex:index];
}

-(void)deleteSections:(NSArray<KFXSectionData *> *)sections{
    
    for (KFXSectionData *section in sections) {
        
        NSAssert([self.sections containsObject:section], @"Can not delete section that is not present in receiver.sections array.");
        section.cellularViewData = nil;
        [self.sections removeObject:section];
    }
}


//--------------------------------------------------------
#pragma mark CellData Setters
//--------------------------------------------------------
-(void)addCellData:(KFXCellData *)cell toSectionAtIndex:(NSUInteger)sectionIndex{

    KFXSectionData *section = self.sections[sectionIndex];
	[section addCellData:cell];
}

-(void)addCellDatas:(NSArray<KFXCellData *> *)cellDatas
   toSectionAtIndex:(NSUInteger)sectionIndex{
    
    if (sectionIndex > self.sections.count) {
        return;
    }
    KFXSectionData *section = self.sections[sectionIndex];
    NSUInteger originalCount = section.count;
    [section addCellDataFromArray:cellDatas];
    
    NSMutableArray *mutArray = [NSMutableArray arrayWithCapacity:10];
    for (NSInteger idx = originalCount; idx < section.count; idx++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx
                                                    inSection:sectionIndex];
        [mutArray addObject:indexPath];
    }
}

-(void)insertCellData:(KFXCellData *)cell atIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section >= self.sections.count) {
        return;
    }
	KFXSectionData *section = self.sections[indexPath.section];
    if (indexPath.row > section.count) {
        return;
    }
	[section insertCellData:cell atIndex:indexPath.row];
}

-(void)insertCellDatas:(NSArray<KFXCellData *> *)cells
          atIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    
    NSAssert(cells.count == indexPaths.count, @"Array counts should be equal. Cells and IndexPaths should be equal");
    NSUInteger index = 0;
    for (NSIndexPath *indexPath in indexPaths) {
     
        NSAssert(indexPath.section < self.sections.count, @"section index of index path is out of bounds. %ld >= %lu",(long)indexPath.section,(unsigned long)self.sections.count);
        KFXSectionData *section = self.sections[indexPath.section];
        NSAssert(indexPath.row < section.cells.count, @"row/item index of index path is out of bounds. %ld >= %lu",(long)indexPath.row,(unsigned long)section.cells.count);
        [section insertCellData:cells[index] atIndex:indexPath.row];
    }
}


-(void)deleteCellDataAtIndexPath:(NSIndexPath *)indexPath{
    
	KFXSectionData *section = self.sections[indexPath.section];
    [section deleteCellDataAtIndex:indexPath.row];
}

-(void)deleteCellData:(KFXCellData *)cellData{
    
    [cellData.sectionData deleteCellData:cellData];
}

//--------------------------------------------------------
#pragma mark SectionData Getters
//--------------------------------------------------------
-(KFXSectionData*)sectionForTag:(NSInteger)tag{
	NSPredicate *pred = [NSPredicate predicateWithFormat:@"tag = %ld",(long)tag];
	NSArray *matching = [self.sections filteredArrayUsingPredicate:pred];
	return matching.firstObject;
}

-(KFXSectionData*)sectionForIdentifier:(NSString*)identifier{
	NSPredicate *pred = [NSPredicate predicateWithFormat:@"identifier = %@",identifier];
	NSArray *matching = [self.sections filteredArrayUsingPredicate:pred];
	return matching.firstObject;
}

-(KFXSectionData *)sectionForIndex:(NSUInteger)index{
    if (index < self.sections.count) {
        return self.sections[index];
    }
    return nil;
}


//--------------------------------------------------------
#pragma mark CellData Getters
//--------------------------------------------------------
-(KFXCellData *)cellForTag:(NSInteger)tag{
	
	KFXCellData *cell;
	for (KFXSectionData *section in self.sections) {
		
		if ((cell = [section cellForTag:tag])) {
			break;
		}
	}
	return cell;
}

-(KFXCellData *)cellForIdentifier:(NSString *)identifier{
	
	KFXCellData *cell;
	for (KFXSectionData *section in self.sections) {
		
		if ((cell = [section cellForIdentifier:identifier])) {
			break;
		}
	}
	return cell;
}

-(KFXCellData *)cellForIndexPath:(NSIndexPath *)indexPath{
	KFXSectionData *section = [self sectionForIndex:indexPath.section];
    if (section == nil) {
        return nil;
    }
    KFXCellData *cell = [section cellForIndex:indexPath.row];
    return cell;
}

//--------------------------------------------------------
#pragma mark Queries
//--------------------------------------------------------
-(NSUInteger)count{
	return self.sections.count;
}

-(NSUInteger)countForSectionAtIndex:(NSUInteger)index{
    return self.sections[index].count;
}

-(NSUInteger)indexOfSectionData:(KFXSectionData*)sectionData{
    return [self.sections indexOfObject:sectionData];
}

-(NSIndexPath*)indexPathOfCellData:(KFXCellData*)cellData{
    KFXSectionData *sectionData = cellData.sectionData;
    NSUInteger section = [self indexOfSectionData:sectionData];
    NSUInteger row = [sectionData indexOfCellData:cellData];
    return [NSIndexPath indexPathForRow:row inSection:section];
}

-(NSArray<NSNumber *> *)indexesForSections:(NSArray<KFXSectionData *> *)sections{
    
    NSMutableArray *mutArray = [NSMutableArray arrayWithCapacity:sections.count];
    for (KFXSectionData *section in sections) {
        NSUInteger thisIdx = [self indexOfSectionData:section];
        [mutArray addObject:@(thisIdx)];
    }
    return mutArray.copy;
}

-(NSArray<NSIndexSet *> *)orderedIndexSetsForSections:(NSArray<KFXSectionData *> *)sections{
    
    NSMutableArray *mutArray = [NSMutableArray arrayWithCapacity:sections.count];
    // Sort by section index and make mutable
    NSMutableArray *mutSections =
    [sections sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
       
        NSUInteger idx1 = [self indexOfSectionData:obj1];
        NSUInteger idx2 = [self indexOfSectionData:obj2];
        if (idx1 < idx2) {
            return NSOrderedAscending;
        }else if (idx1 > idx2){
            return NSOrderedDescending;
        }else{
            return NSOrderedSame;
        }
    }].mutableCopy;
    
    // Need references to start and end of range
    NSUInteger firstIndex = NSUIntegerMax;
    NSUInteger lastIndex = NSUIntegerMax;
    do {
        
        KFXSectionData *thisSection = mutSections.firstObject;
        NSUInteger thisIdx = [self indexOfSectionData:thisSection];
        if (firstIndex == NSUIntegerMax) {
            firstIndex = thisIdx;
            lastIndex = thisIdx;
        }else if (thisIdx == lastIndex+1){
            lastIndex = thisIdx;
        }else if (thisIdx != lastIndex){
            // thisIdx does not fit existing range, complete range and start new
            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(firstIndex, lastIndex+1-firstIndex)];
            [mutArray addObject:indexSet];
            firstIndex = thisIdx;
            lastIndex = thisIdx;
        }
        [mutSections removeObject:thisSection];
        
    } while (mutSections.count >= 1);
    
    // complete final range
    if (firstIndex != NSUIntegerMax) {
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(firstIndex, lastIndex+1-firstIndex)];
        [mutArray addObject:indexSet];
    }
    
    return mutArray.copy;
}

-(NSArray<NSIndexPath *> *)indexPathsForCells:(NSArray<KFXCellData *> *)cells{
    
    NSMutableArray *mutArray = [NSMutableArray arrayWithCapacity:cells.count];
    for (KFXCellData *cellData in cells) {
        NSIndexPath *indexPath = [self indexPathOfCellData:cellData];
        [mutArray addObject:indexPath];
    }
    return mutArray.copy;
}

-(NSArray<NSIndexPath *> *)orderedIndexPathsForCells:(NSArray<KFXCellData *> *)cells{

    NSMutableArray *mutArray = [NSMutableArray arrayWithCapacity:cells.count];
    // Sort by index path and make mutable
    NSArray *sortedCells =
    [cells sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        NSIndexPath *idxP1 = [self indexPathOfCellData:obj1];
        NSIndexPath *idxP2 = [self indexPathOfCellData:obj2];
        return [idxP1 compare:idxP2];
    }];
   
    for (KFXCellData *cellData in sortedCells) {
        NSIndexPath *indexPath = [self indexPathOfCellData:cellData];
        [mutArray addObject:indexPath];
    }
    
    return mutArray.copy;
}

//======================================================
#pragma mark - ** Inherited Methods **
//======================================================




//======================================================
#pragma mark - ** Protocol Methods **
//======================================================




//======================================================
#pragma mark - ** Private Methods **
//======================================================
//--------------------------------------------------------
#pragma mark - Lazy Load
//--------------------------------------------------------



@end







