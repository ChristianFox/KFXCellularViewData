/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXCellularViewData
 *
 ************************************/




#import "KFXSectionData.h"
#import "KFXSectionData_Private.h"
#import "KFXCellData_Private.h"
#import "KFXCellData.h"
#import "KFXCellularViewData.h"

@interface KFXSectionData ()


@end

@implementation KFXSectionData


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
		self.cells = [NSMutableArray arrayWithCapacity:5];

	}
	return self;
}

+(instancetype)sectionData{
	return [[self alloc]init];
}



//--------------------------------------------------------
#pragma mark - Inject Dependencies
//--------------------------------------------------------


//======================================================
#pragma mark - ** Primary Public Functionality **
//======================================================
//--------------------------------------------------------
#pragma mark Accessors
//--------------------------------------------------------
-(NSString *)cellReuseIdentifier{
    if (!_cellReuseIdentifier) {
        _cellReuseIdentifier = self.cellularViewData.cellReuseIdentifier;
    }
    return _cellReuseIdentifier;
}

//--------------------------------------------------------
#pragma mark CellData Setters
//--------------------------------------------------------
-(void)addCellData:(KFXCellData *)cellData{
    cellData.sectionData = self;
    [self.cells addObject:cellData];
}

-(void)addCellDataFromArray:(NSArray<KFXCellData *> *)cellData{
	for (KFXCellData *aCell in cellData) {
        [self addCellData:aCell];
	}
}

-(void)insertCellData:(KFXCellData *)cellData atIndex:(NSUInteger)index{
	
    cellData.sectionData = self;
	[self.cells insertObject:cellData atIndex:index];
}

-(void)deleteCellData:(KFXCellData *)cellData{
    cellData.sectionData = nil;
    [self.cells removeObject:cellData];
}

-(void)deleteCellDataAtIndex:(NSUInteger)index{
    KFXCellData *cellData = self.cells[index];
    [self deleteCellData:cellData];
}

//--------------------------------------------------------
#pragma mark CellData Getters
//--------------------------------------------------------
-(KFXCellData *)cellForTag:(NSInteger)tag{
	
	NSPredicate *pred = [NSPredicate predicateWithFormat:@"tag = %ld",(long)tag];
	NSArray *matching = [self.cells filteredArrayUsingPredicate:pred];
	return matching.firstObject;
}

-(KFXCellData *)cellForIdentifier:(NSString *)identifier{
	
	NSPredicate *pred = [NSPredicate predicateWithFormat:@"identifier = %@",identifier];
	NSArray *matching = [self.cells filteredArrayUsingPredicate:pred];
	return matching.firstObject;
}

-(KFXCellData *)cellForIndex:(NSUInteger)index{
    
    KFXCellData *cell;
    if (index < self.cells.count) {
        cell = self.cells[index];
    }
    return cell;
}


//--------------------------------------------------------
#pragma mark Queries
//--------------------------------------------------------
-(NSUInteger)count{
	return self.cells.count;
}

-(NSUInteger)sectionIndex{
    if (self.cellularViewData == nil) {
        return NSUIntegerMax;
    }
	return [self.cellularViewData indexOfSectionData:self];
}

-(NSUInteger)indexOfCellData:(KFXCellData *)cellData{
    if (cellData == nil) {
        return NSUIntegerMax;
    }else if (![self.cells containsObject:cellData]){
        return NSUIntegerMax;
    }
    return [self.cells indexOfObject:cellData];
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










































