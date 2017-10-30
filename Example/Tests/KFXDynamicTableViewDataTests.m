


#import <XCTest/XCTest.h>
// SUT
#import "KFXDynamicTableViewData.h"

@interface KFXDynamicTableViewDataTests : XCTestCase <KFXDynamicTableViewDataDelegate>

@property (strong,nonatomic) KFXDynamicTableViewData *sut;

@property (strong,nonatomic) XCTestExpectation *expectation;
@property (strong,nonatomic) NSString *sectionTitle;
@property (strong,nonatomic) NSString *cellTitle;
@property (nonatomic) void (^KFXUTSectionDataAndIndexBlock) (KFXSectionData *section, NSUInteger index);
@property (nonatomic) void (^KFXUTSectionDatasAndIndexSetBlock) (NSArray<KFXSectionData *> *sectionDatas, NSArray<NSIndexSet*> *indexSets);
@property (nonatomic) void (^KFXUTCellDataAndIndexPathBlock) (KFXCellData *cellData, NSIndexPath *indexPath);
@property (nonatomic) void (^KFXUTCellDatasAndIndexPathsBlock) (NSArray<KFXCellData *> *cellDatas, NSArray<NSIndexPath *> *indexPaths);



@end

@implementation KFXDynamicTableViewDataTests


//======================================================
#pragma mark - ** Setup, Tear down **
//======================================================
- (void)setUp {
    [super setUp];
    self.sut = [KFXDynamicTableViewData tableViewData];
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
-(void)testAddSection_ShouldCallDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have completed successfully"];
    
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

-(void)testAddSections_ShouldCallDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have completed successfully"];
    
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
    self.KFXUTSectionDatasAndIndexSetBlock = ^(NSArray<KFXSectionData *> *sectionDatas, NSArray<NSIndexSet*> *indexSet) {
        
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

-(void)testDeleteSection_ShouldCallDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have completed successfully"];
    
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

-(void)testDeleteSections_ShouldCallDelegate{
    
    // Expect
    self.expectation = [self expectationWithDescription:@"Should have completed successfully"];
    
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



//======================================================
#pragma mark - ** Protocol Methods **
//======================================================
//--------------------------------------------------------
#pragma mark KFXCellularViewDataDelegate
//--------------------------------------------------------
-(void)dynamicTableViewData:(KFXDynamicTableViewData*)tableViewData
             didInsertSections:(NSArray<KFXSectionData*>*)sectionDatas
                  atIndexes:(NSArray<NSIndexSet *> *)indexSets{

    if (self.KFXUTSectionDataAndIndexBlock) {
        self.KFXUTSectionDataAndIndexBlock(sectionDatas.firstObject, indexSets.firstObject.firstIndex);
    }else if (self.KFXUTSectionDatasAndIndexSetBlock){
        self.KFXUTSectionDatasAndIndexSetBlock(sectionDatas, indexSets);
    }
}


-(void)dynamicTableViewData:(KFXDynamicTableViewData*)tableViewData
          didDeleteSections:(NSArray<KFXSectionData*>*)sectionDatas
                  atIndexes:(NSArray<NSIndexSet *> *)indexSets{
    
    if (self.KFXUTSectionDataAndIndexBlock) {
        self.KFXUTSectionDataAndIndexBlock(sectionDatas.firstObject, indexSets.firstObject.firstIndex);
    }else if (self.KFXUTSectionDatasAndIndexSetBlock){
        self.KFXUTSectionDatasAndIndexSetBlock(sectionDatas, indexSets);
    }
}

@end


























