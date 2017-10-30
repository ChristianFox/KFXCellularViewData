


#import <KFXAbstracts/KFXTableViewController.h>
#import <KFXCellularViewData/KFXTableViewData.h>

@interface KFXDynamicTableViewController : KFXTableViewController

// Data
@property (strong,nonatomic) KFXTableViewData *tableData;
// Animations
@property (nonatomic) UITableViewRowAnimation insertSectionAnimation;
@property (nonatomic) UITableViewRowAnimation deleteSectionAnimation;
@property (nonatomic) UITableViewRowAnimation reloadSectionAnimation;
@property (nonatomic) UITableViewRowAnimation insertRowAnimation;
@property (nonatomic) UITableViewRowAnimation deleteRowAnimation;
@property (nonatomic) UITableViewRowAnimation reloadRowAnimation;


@end

