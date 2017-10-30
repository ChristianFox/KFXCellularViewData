


#import <XCTest/XCTest.h>
// SUT
#import <KFXCellularViewData/KFXCellularViewData.h>

@interface KFXCellularViewDataDelegateTests : XCTestCase <KFXCellularViewDataDelegate>

@property (strong,nonatomic) KFXCellularViewData *sut;
@property (strong,nonatomic) XCTestExpectation *expectation;
@property (strong,nonatomic) NSString *sectionTitle;
@property (strong,nonatomic) NSString *cellTitle;
@property (nonatomic) void (^KFXUTSectionDataAndIndexBlock) (KFXSectionData *section, NSUInteger index);
@property (nonatomic) void (^KFXUTSectionDatasAndIndexSetBlock) (NSArray<KFXSectionData *> *sectionDatas, NSArray<NSIndexSet*> *indexSets);
@property (nonatomic) void (^KFXUTCellDataAndIndexPathBlock) (KFXCellData *cellData, NSIndexPath *indexPath);
@property (nonatomic) void (^KFXUTCellDatasAndIndexPathsBlock) (NSArray<KFXCellData *> *cellDatas, NSArray<NSIndexPath *> *indexPaths);

@end

@implementation KFXCellularViewDataDelegateTests


//======================================================
#pragma mark - ** Setup, Tear down **
//======================================================
- (void)setUp {
    [super setUp];
    self.sut = [KFXCellularViewData cellularViewData];
    self.sectionTitle = @"UT-SectionTitle";
    self.cellTitle = @"UT-CellTitle";
    
}

- (void)tearDown {
    self.sut = nil;
    self.sectionTitle = nil;
    self.cellTitle = nil;
    
    [super tearDown];
}

//======================================================
#pragma mark - ** Initilisation Tests **
//======================================================
-(void)testSUT{
    XCTAssertNotNil(self.sut);
}

//======================================================
#pragma mark - ** Dynamic Data with delegate Tests **
//======================================================
-(void)testCanSetDelegate{
    
    self.sut.delegate = self;
    XCTAssertNotNil(self.sut.delegate);
    XCTAssertEqualObjects(self.sut.delegate, self);
}

//--------------------------------------------------------
#pragma mark Dynamic SectionData
//--------------------------------------------------------
//-----------------------------------
// -addSection:
//-----------------------------------
-(void)testAddSection_ShouldCallDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have called the delegate"];
    
    // GIVEN
    KFXSectionData *section = [KFXSectionData sectionData];
    section.titleForHeader = self.sectionTitle;
    self.sut.delegate = self;
    
    // Define Then block before WHEN
    __weak typeof(self) weakSelf = self;
    self.KFXUTSectionDataAndIndexBlock = ^(KFXSectionData *section, NSUInteger index) {
        
        // THEN
        // This block called from delegate method implementation
        id self = weakSelf;
        XCTAssertEqualObjects(section.titleForHeader, weakSelf.sectionTitle);
        XCTAssertEqual(0, index);
        [weakSelf.expectation fulfill];
    };
    
    // WHEN
    [self.sut addSection:section];
    
    // Wait
    [self waitForExpectationsWithTimeout:5.0f handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"### ERROR ### : %@",error.localizedDescription);
        }
    }];
}

//-----------------------------------
// -addSections:
//-----------------------------------
-(void)testAddSections_ShouldCallDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have called the delegate"];
    
    // GIVEN
    NSMutableArray *mutArray = [NSMutableArray arrayWithCapacity:5];
    for (NSInteger idx = 0; idx < 5; idx++) {
        KFXSectionData *section = [KFXSectionData sectionData];
        section.titleForHeader = self.sectionTitle;
        [mutArray addObject:section];
    }
    self.sut.delegate = self;
    
    // Define Then block before WHEN
    __weak typeof(self) weakSelf = self;
    self.KFXUTSectionDatasAndIndexSetBlock = ^(NSArray<KFXSectionData *> *sectionDatas, NSArray<NSIndexSet*> *indexSets) {
        
        // THEN
        // This block called from delegate method implementation
        id self = weakSelf;
        for (KFXSectionData *sectionData in sectionDatas) {
            
            XCTAssertEqualObjects(sectionData.titleForHeader, weakSelf.sectionTitle);
        }
        
        [weakSelf.expectation fulfill];
    };
    
    // WHEN
    [self.sut addSections:mutArray];
    
    // Wait
    [self waitForExpectationsWithTimeout:5.0f handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"### ERROR ### : %@",error.localizedDescription);
        }
    }];
}

//-----------------------------------
// -insertSection:atIndex:
//-----------------------------------
-(void)testInsertSectionAtIndex_ShouldCallDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have called the delegate"];
    
    // GIVEN
    KFXSectionData *section = [KFXSectionData sectionData];
    section.titleForHeader = self.sectionTitle;
    self.sut.delegate = self;
    
    // Define Then block before WHEN
    __weak typeof(self) weakSelf = self;
    self.KFXUTSectionDataAndIndexBlock = ^(KFXSectionData *section, NSUInteger index) {
        
        // THEN
        // This block called from delegate method implementation
        id self = weakSelf;
        XCTAssertEqualObjects(section.titleForHeader, weakSelf.sectionTitle);
        XCTAssertEqual(0, index);
        [weakSelf.expectation fulfill];
    };
    
    // WHEN
    [self.sut insertSection:section atIndex:0];

    // Wait
    [self waitForExpectationsWithTimeout:5.0f handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"### ERROR ### : %@",error.localizedDescription);
        }
    }];
}


//-----------------------------------
// -insertSections:atIndex:
//-----------------------------------
-(void)testInsertSectionsAtIndex_ShouldCallDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have called the delegate"];
    
    // GIVEN
    NSMutableArray *mutArray = [NSMutableArray arrayWithCapacity:5];
    for (NSInteger idx = 0; idx < 5; idx++) {
        KFXSectionData *section = [KFXSectionData sectionData];
        section.titleForHeader = self.sectionTitle;
        [mutArray addObject:section];
    }
    [self.sut addSection:[KFXSectionData sectionData]];
    [self.sut addSection:[KFXSectionData sectionData]];
    [self.sut addSection:[KFXSectionData sectionData]];
    NSUInteger index = 2;
    self.sut.delegate = self;
    
    // Define Then block before WHEN
    __weak typeof(self) weakSelf = self;
    self.KFXUTSectionDatasAndIndexSetBlock = ^(NSArray<KFXSectionData *> *sectionDatas, NSArray<NSIndexSet*> *indexSets) {
        
        // THEN
        // This block called from delegate method implementation
        id self = weakSelf;
        for (KFXSectionData *sectionData in sectionDatas) {
            
            XCTAssertEqualObjects(sectionData.titleForHeader, weakSelf.sectionTitle);
        }
        
        XCTAssertEqual(indexSets.firstObject.firstIndex, index);
        XCTAssertEqual(indexSets.firstObject.lastIndex, index+mutArray.count-1);
        [weakSelf.expectation fulfill];
    };
    
    // WHEN
    [self.sut insertSections:mutArray.copy atIndex:index];
    
    // Wait
    [self waitForExpectationsWithTimeout:5.0f handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"### ERROR ### : %@",error.localizedDescription);
        }
    }];
}



//-----------------------------------
// -deleteSection:
//-----------------------------------
-(void)testDeleteSection_ShouldCallDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have called the delegate"];
    
    // GIVEN
    KFXSectionData *section = [KFXSectionData sectionData];
    section.titleForHeader = self.sectionTitle;
    [self.sut addSection:section];
    
    self.sut.delegate = self;
    
    // Define Then block before WHEN
    __weak typeof(self) weakSelf = self;
    self.KFXUTSectionDataAndIndexBlock = ^(KFXSectionData *section, NSUInteger index) {
        
        // THEN
        // This block called from delegate method implementation
        id self = weakSelf;
        XCTAssertEqualObjects(section.titleForHeader, weakSelf.sectionTitle);
        XCTAssertEqual(0, index);
        [weakSelf.expectation fulfill];
    };
    
    // WHEN
    [self.sut deleteSection:section];
    
    // Wait
    [self waitForExpectationsWithTimeout:5.0f handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"### ERROR ### : %@",error.localizedDescription);
        }
    }];
}


//-----------------------------------
// -deleteSectionAtIndex:
//-----------------------------------
-(void)testDeleteSectionAtIndex_ShouldCallDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have called the delegate"];
    
    // GIVEN
    KFXSectionData *section = [KFXSectionData sectionData];
    section.titleForHeader = self.sectionTitle;
    [self.sut addSection:section];
    
    self.sut.delegate = self;
    
    // Define Then block before WHEN
    __weak typeof(self) weakSelf = self;
    self.KFXUTSectionDataAndIndexBlock = ^(KFXSectionData *section, NSUInteger index) {
        
        // THEN
        // This block called from delegate method implementation
        id self = weakSelf;
        XCTAssertEqualObjects(section.titleForHeader, weakSelf.sectionTitle);
        XCTAssertEqual(0, index);
        [weakSelf.expectation fulfill];
    };
    
    // WHEN
    [self.sut deleteSectionAtIndex:0];
    
    // Wait
    [self waitForExpectationsWithTimeout:5.0f handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"### ERROR ### : %@",error.localizedDescription);
        }
    }];
}



//-----------------------------------
// -deleteSections:
//-----------------------------------
-(void)testDeleteSections_ShouldCallDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have called the delegate"];
    
    // GIVEN
    NSMutableArray *mutArray = [NSMutableArray arrayWithCapacity:5];
    for (NSInteger idx = 0; idx < 5; idx++) {
        KFXSectionData *section = [KFXSectionData sectionData];
        section.titleForHeader = self.sectionTitle;
        [mutArray addObject:section];
    }
    [self.sut addSections:mutArray];
    XCTAssertEqual(self.sut.count, mutArray.count);
    self.sut.delegate = self;
    
    // Define Then block before WHEN
    __weak typeof(self) weakSelf = self;
    self.KFXUTSectionDatasAndIndexSetBlock = ^(NSArray<KFXSectionData *> *sectionDatas, NSArray<NSIndexSet *> *indexSets) {
        
        // THEN
        // This block called from delegate method implementation
        id self = weakSelf;
        for (KFXSectionData *sectionData in sectionDatas) {
            
            XCTAssertEqualObjects(sectionData.titleForHeader, weakSelf.sectionTitle);
        }
        XCTAssertEqual(weakSelf.sut.count, 0);
        
        [weakSelf.expectation fulfill];
    };
    
    // WHEN
    [self.sut deleteSections:mutArray];
    
    // Wait
    [self waitForExpectationsWithTimeout:5.0f handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"### ERROR ### : %@",error.localizedDescription);
        }
    }];
}



//--------------------------------------------------------
#pragma mark Dynamic CellDatas
//--------------------------------------------------------
//-----------------------------------
// -addCellData:toSectionAtIndex:
//-----------------------------------
-(void)testAddCellData_ShouldCellDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have called the delegate"];

    // GIVEN
    KFXSectionData *section = [KFXSectionData sectionData];
    [self.sut addSection:section];
    [section addCellData:[KFXCellData cellData]];
    [section addCellData:[KFXCellData cellData]];
    KFXCellData *cellData = [KFXCellData cellData];
    cellData.title = self.cellTitle;
    self.sut.delegate = self;
    
    // Define Then block before WHEN
    __weak typeof(self) weakSelf = self;
    self.KFXUTCellDataAndIndexPathBlock = ^(KFXCellData *cellData, NSIndexPath *indexPath) {
    
        // THEN
        // This block called from delegate method implementation
        id self = weakSelf;
        XCTAssertEqualObjects(cellData.title, weakSelf.cellTitle);
        XCTAssertEqual(0, indexPath.section);
        XCTAssertEqual(2, indexPath.row);
        [weakSelf.expectation fulfill];
    };
    
    // WHEN
    [self.sut addCellData:cellData toSectionAtIndex:0];
    
    // Wait
    [self waitForExpectationsWithTimeout:5.0f handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"### ERROR ### : %@",error.localizedDescription);
        }
    }];
}

//-----------------------------------
// -addCellDatas:toSectionAtIndex:
//-----------------------------------
-(void)testAddCellDatasToSectionAtIndex_ShouldCellDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have called the delegate"];
    
    // GIVEN
    KFXSectionData *section = [KFXSectionData sectionData];
    [self.sut addSection:section];
    [section addCellData:[KFXCellData cellData]];
    [section addCellData:[KFXCellData cellData]];
    KFXCellData *cellData0 = [KFXCellData cellData];
    cellData0.title = self.cellTitle;
    KFXCellData *cellData1 = [KFXCellData cellData];
    cellData1.title = self.cellTitle;
    self.sut.delegate = self;
    
    // Define Then block before WHEN
    __weak typeof(self) weakSelf = self;
    self.KFXUTCellDatasAndIndexPathsBlock = ^(NSArray<KFXCellData *> *cellDatas, NSArray<NSIndexPath *> *indexPaths) {
    
        // THEN
        // This block called from delegate method implementation
        id self = weakSelf;
        XCTAssertEqualObjects(cellDatas.firstObject.title, weakSelf.cellTitle);
        XCTAssertEqual(0, indexPaths.firstObject.section);
        XCTAssertEqual(2, indexPaths.firstObject.row);
        [weakSelf.expectation fulfill];
    };
    
    // WHEN
    [self.sut addCellDatas:@[cellData0,cellData1] toSectionAtIndex:0];
    
    // Wait
    [self waitForExpectationsWithTimeout:5.0f handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"### ERROR ### : %@",error.localizedDescription);
        }
    }];
}


//-----------------------------------
// -insertCellData:atIndexPath:
//-----------------------------------
-(void)testInsertCellDataAtIndexPath_ShouldCellDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have called the delegate"];
    
    // GIVEN
    KFXSectionData *section = [KFXSectionData sectionData];
    [self.sut addSection:section];
    [section addCellData:[KFXCellData cellData]];
    [section addCellData:[KFXCellData cellData]];
    KFXCellData *cellData = [KFXCellData cellData];
    cellData.title = self.cellTitle;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    self.sut.delegate = self;
    
    // Define Then block before WHEN
    __weak typeof(self) weakSelf = self;
    self.KFXUTCellDataAndIndexPathBlock = ^(KFXCellData *cellData, NSIndexPath *indexPath) {
        
        // THEN
        // This block called from delegate method implementation
        id self = weakSelf;
        XCTAssertEqualObjects(cellData.title, weakSelf.cellTitle);
        XCTAssertEqual(0, indexPath.section);
        XCTAssertEqual(1, indexPath.row);
        [weakSelf.expectation fulfill];
    };
    
    // WHEN
    [self.sut insertCellData:cellData atIndexPath:indexPath];
    
    // Wait
    [self waitForExpectationsWithTimeout:5.0f handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"### ERROR ### : %@",error.localizedDescription);
        }
    }];
}


//-----------------------------------
// -insertCellDatas:atIndexPaths:
//-----------------------------------
-(void)testInsertCellDatasAtIndexPaths_ShouldCellDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have called the delegate"];
    
    // GIVEN
    KFXSectionData *section = [KFXSectionData sectionData];
    [self.sut addSection:section];
    [section addCellData:[KFXCellData cellData]];
    [section addCellData:[KFXCellData cellData]];
    [section addCellData:[KFXCellData cellData]];
    [section addCellData:[KFXCellData cellData]];
    [section addCellData:[KFXCellData cellData]];
    [section addCellData:[KFXCellData cellData]];
    KFXCellData *cellData0 = [KFXCellData cellData];
    cellData0.title = self.cellTitle;
    KFXCellData *cellData1 = [KFXCellData cellData];
    cellData1.title = self.cellTitle;
    NSIndexPath *indexPath0 = [NSIndexPath indexPathForRow:1 inSection:0];
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:3 inSection:0];
    self.sut.delegate = self;
    
    // Define Then block before WHEN
    __weak typeof(self) weakSelf = self;
    self.KFXUTCellDatasAndIndexPathsBlock = ^(NSArray<KFXCellData *> *cellDatas, NSArray<NSIndexPath *> *indexPaths) {
        
        // THEN
        // This block called from delegate method implementation
        id self = weakSelf;
        XCTAssertEqualObjects(cellDatas.firstObject.title, weakSelf.cellTitle);
        XCTAssertEqual(0, indexPaths.firstObject.section);
        XCTAssertEqual(1, indexPaths.firstObject.row);
        XCTAssertEqual(3, indexPaths.lastObject.row);
        [weakSelf.expectation fulfill];
    };
    
    // WHEN
    [self.sut insertCellDatas:@[cellData0,cellData1] atIndexPaths:@[indexPath0,indexPath1]];
    
    // Wait
    [self waitForExpectationsWithTimeout:5.0f handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"### ERROR ### : %@",error.localizedDescription);
        }
    }];
}




//-----------------------------------
// -deleteCellData:
//-----------------------------------
-(void)testDeleteCellData_ShouldCallDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have called the delegate"];
    
    // GIVEN
    KFXSectionData *section = [KFXSectionData sectionData];
    [self.sut addSection:section];
    [self.sut addCellData:[KFXCellData cellData] toSectionAtIndex:0];
    [self.sut addCellData:[KFXCellData cellData] toSectionAtIndex:0];
    KFXCellData *cellData0 = [KFXCellData cellData];
    [self.sut addCellData:cellData0 toSectionAtIndex:0];
    [self.sut addCellData:[KFXCellData cellData] toSectionAtIndex:0];
    self.sut.delegate = self;
    
    // Define Then block before WHEN
    __weak typeof(self) weakSelf = self;
    self.KFXUTCellDataAndIndexPathBlock = ^(KFXCellData *cellData, NSIndexPath *indexPath) {
        
        // THEN
        // This block called from delegate method implementation
        id self = weakSelf;
        XCTAssertEqual(3, section.count);
        XCTAssertEqual(0, indexPath.section);
        XCTAssertEqual(2, indexPath.row);
        XCTAssertNil(cellData.sectionData);
        [weakSelf.expectation fulfill];
    };
    
    // WHEN
    [self.sut deleteCellData:cellData0];
    
    // Wait
    [self waitForExpectationsWithTimeout:5.0f handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"### ERROR ### : %@",error.localizedDescription);
        }
    }];
}



//-----------------------------------
// -deleteCellDataAtIndexPath:
//-----------------------------------
-(void)testDeleteCellDataAtIndexPath_ShouldCallDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have called the delegate"];
    
    // GIVEN
    KFXSectionData *section = [KFXSectionData sectionData];
    [self.sut addSection:section];
    [self.sut addCellData:[KFXCellData cellData] toSectionAtIndex:0];
    [self.sut addCellData:[KFXCellData cellData] toSectionAtIndex:0];
    KFXCellData *cellData0 = [KFXCellData cellData];
    [self.sut addCellData:cellData0 toSectionAtIndex:0];
    [self.sut addCellData:[KFXCellData cellData] toSectionAtIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
    self.sut.delegate = self;
    
    // Define Then block before WHEN
    __weak typeof(self) weakSelf = self;
    self.KFXUTCellDataAndIndexPathBlock = ^(KFXCellData *cellData, NSIndexPath *indexPath) {
        
        // THEN
        // This block called from delegate method implementation
        id self = weakSelf;
        XCTAssertEqual(3, section.count);
        XCTAssertEqual(0, indexPath.section);
        XCTAssertEqual(3, indexPath.row);
        XCTAssertNil(cellData.sectionData);
        [weakSelf.expectation fulfill];
    };
    
    // WHEN
    [self.sut deleteCellDataAtIndexPath:indexPath];
    
    // Wait
    [self waitForExpectationsWithTimeout:5.0f handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"### ERROR ### : %@",error.localizedDescription);
        }
    }];
}




//======================================================
#pragma mark - ** Protocol Methods **
//======================================================
//--------------------------------------------------------
#pragma mark KFXCellularViewDataDelegate
//--------------------------------------------------------
-(void)cellularViewData:(KFXCellularViewData*)cellularViewData
   didInsertSections:(NSArray<KFXSectionData*>*)sectionDatas
           atIndexes:(NSArray<NSIndexSet *> *)indexSets{
    
    if (self.KFXUTSectionDataAndIndexBlock) {
        self.KFXUTSectionDataAndIndexBlock(sectionDatas.firstObject, indexSets.firstObject.firstIndex);
    }else if (self.KFXUTSectionDatasAndIndexSetBlock){
        self.KFXUTSectionDatasAndIndexSetBlock(sectionDatas, indexSets);
    }
}


-(void)cellularViewData:(KFXCellularViewData*)cellularViewData
   didDeleteSections:(NSArray<KFXSectionData*>*)sectionDatas
           atIndexes:(NSArray<NSIndexSet *> *)indexSets{
    
    if (self.KFXUTSectionDataAndIndexBlock) {
        self.KFXUTSectionDataAndIndexBlock(sectionDatas.firstObject, indexSets.firstObject.firstIndex);
    }else if (self.KFXUTSectionDatasAndIndexSetBlock){
        self.KFXUTSectionDatasAndIndexSetBlock(sectionDatas, indexSets);
    }
}

-(void)cellularViewData:(KFXCellularViewData *)cellularViewData
         didInsertCells:(NSArray<KFXCellData *> *)cellDatas
           atIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    
    if (self.KFXUTCellDataAndIndexPathBlock) {
        self.KFXUTCellDataAndIndexPathBlock(cellDatas.firstObject, indexPaths.firstObject);
    }else if (self.KFXUTCellDatasAndIndexPathsBlock){
        self.KFXUTCellDatasAndIndexPathsBlock(cellDatas,indexPaths);
    }
}

-(void)cellularViewData:(KFXCellularViewData *)cellularViewData
         didDeleteCells:(NSArray<KFXCellData *> *)cellDatas
           atIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{

    if (self.KFXUTCellDataAndIndexPathBlock) {
        self.KFXUTCellDataAndIndexPathBlock(cellDatas.firstObject, indexPaths.firstObject);
    }else if (self.KFXUTCellDatasAndIndexPathsBlock){
        self.KFXUTCellDatasAndIndexPathsBlock(cellDatas,indexPaths);
    }
}









@end













