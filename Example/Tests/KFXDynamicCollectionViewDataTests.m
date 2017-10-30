


#import <XCTest/XCTest.h>
// SUT
#import "KFXDynamicCollectionViewData.h"

@interface KFXDynamicCollectionViewDataTests : XCTestCase
@property (strong,nonatomic) KFXDynamicCollectionViewData *sut;
@end

@implementation KFXDynamicCollectionViewDataTests


//======================================================
#pragma mark - ** Setup, Tear down **
//======================================================
- (void)setUp {
    [super setUp];
    self.sut = [[KFXDynamicCollectionViewData alloc]init];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

//======================================================
#pragma mark - ** Initilisation Tests **
//======================================================
-(void)testSUT{
    XCTAssertNotNil(self.sut);
}


//======================================================
#pragma mark - ** Primary Function Tests **
//======================================================














@end



























