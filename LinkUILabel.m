//
//  LinkUILabel.swift
//
//  Created by Jorge Cordero Sanchez on 18/5/17.
//  Copyright © 2018 Jorge Cordero Sanchez. All rights reserved.
//

#import "LinkUILabel.h"

/*@interface LinkUILabel ()
{
    
}
@end*/

@implementation LinkUILabel

-(void) openUrl: (NSString *)urlString{
    NSURL *url = [NSURL URLWithString: urlString];
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")){
        [[UIApplication sharedApplication] openURL: url options:@{} completionHandler:nil];
    }
    else{
        [[UIApplication sharedApplication] openURL: url];
    }
}

-(void) onLabelClic: (UITapGestureRecognizer *)sender{
    [self openUrl:_urlString];
}

-(void)drawTextInRect:(CGRect)rect{
    [super drawTextInRect:rect];
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onLabelClic:)];
    [self setUserInteractionEnabled: TRUE];
    [self addGestureRecognizer:tap];
    
    /*let tap = UITapGestureRecognizer(target: self, action: #selector(self.onLabelClic(sender:)))
    self.isUserInteractionEnabled = true
    self.addGestureRecognizer(tap)*/
}


@end
