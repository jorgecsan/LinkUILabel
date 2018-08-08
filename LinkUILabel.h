//
//  UILabelWithLink.h
//
//  Created by Jorge Cordero Sanchez on 8/8/18.
//  Copyright © 2018. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface LinkUILabel : UILabel{
    
}
/*
 * Change the error display text.
 */
@property (nonatomic,strong) IBInspectable  NSString  *urlString;

-(void) openUrl: (NSString *)urlString;
-(void) onLabelClic: (UITapGestureRecognizer *)sender;

@end;
