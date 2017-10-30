


#import <UIKit/UIKit.h>
#import "KFXDynamicTableViewData.h"
//@class KFXDynamicTableViewData;
@interface KFXDynamicTableViewController : UITableViewController

// Data
@property (strong,nonatomic) KFXDynamicTableViewData *tableData;
// Animations
@property (nonatomic) UITableViewRowAnimation addRowAnimation;
@property (nonatomic) UITableViewRowAnimation removeRowAnimation;
@property (nonatomic) UITableViewRowAnimation updateRowAnimation;
@property (nonatomic) UITableViewRowAnimation addSectionAnimation;
@property (nonatomic) UITableViewRowAnimation removeSectionAnimation;
@property (nonatomic) UITableViewRowAnimation updateSectionAnimation;

@end

