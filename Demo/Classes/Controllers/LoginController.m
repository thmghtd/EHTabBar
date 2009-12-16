//
//  LoginController.m
//  EHTabBarDemo
//
//  Created by Shayne Sweeney on 12/12/09.
//

#import "LoginController.h"

@implementation LoginController

- (id)init {
  return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)dealloc {
  [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style {
  if (self = [super initWithStyle:style]) {
    self.title = @"Login";
  }
  return self;
}

- (void)loadView {
  [super loadView];
  
  footerView_ = [[UIView alloc] init];
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  
  [button setFrame:CGRectMake(10, 3, 300, 44)];
  
  [button setTitle:@"Login" forState:UIControlStateNormal];
  
  [button.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
  
  [button addTarget:self
             action:@selector(loginClicked) 
   forControlEvents:UIControlEventTouchUpInside];
  
  [footerView_ addSubview:button];
}

- (void)loginClicked {
  [[[[UIAlertView alloc] initWithTitle:@"Login success!" 
                             message:@"You have successfully logged in!"
                            delegate:nil
                   cancelButtonTitle:@"Ok"
                   otherButtonTitles:nil] autorelease] show];
}

#pragma mark -
#pragma mark UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
  return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  UITableViewCell *cell = [[[UITableViewCell alloc]
                            initWithStyle:UITableViewCellStyleValue2
                            reuseIdentifier:nil] autorelease];
  
  UITextField *textField = [[[UITextField alloc] initWithFrame:
                             CGRectMake(110, 12, 185, 30)]
                            autorelease];
  
  textField.returnKeyType = UIReturnKeyNext;
  textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
  
  switch (indexPath.row) {
    case 0:
      cell.textLabel.text = @"Username";
      [textField becomeFirstResponder];
      break;
    case 1:
      cell.textLabel.text = @"Password";
      textField.secureTextEntry = YES;
      break;
    default:
      break;
  }
  
  [cell addSubview:textField];
  
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
    heightForFooterInSection:(NSInteger)section {
  return 50.0;
}

- (UIView *)tableView:(UITableView *)tableView 
    viewForFooterInSection:(NSInteger)section {
  return footerView_;
}

#pragma mark -
#pragma mark UITableViewDelegate methods

- (NSIndexPath *)tableView:(UITableView *)tableView 
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  return nil;
}

@end

