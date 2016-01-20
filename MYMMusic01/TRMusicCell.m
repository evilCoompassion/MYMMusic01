//
//  TRMusicCell.m
//  MYMMusic01
//
//  Created by apple on 16/1/18.
//  Copyright © 2016年 EvilCompassion. All rights reserved.
//

#import "TRMusicCell.h"

@interface TRMusicCell ()
@property (weak, nonatomic) IBOutlet UILabel *musicName;
@property (weak, nonatomic) IBOutlet UILabel *airstName;

@end

@implementation TRMusicCell

- (void)setMusic:(TRMusic *)music
{
    _music = music;
    self.musicName.text = music.name;
    self.airstName.text = music.artist;
}


@end
