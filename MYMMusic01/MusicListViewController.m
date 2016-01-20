//
//  MusicListViewController.m
//  MYMMusic01
//
//  Created by apple on 16/1/19.
//  Copyright © 2016年 EvilCompassion. All rights reserved.
//

#import "MusicListViewController.h"
#import "TRMusic.h"
#import "TRMusicGroup.h"
#import "TRMusicCell.h"
#import "MusicGroupTableViewController.h"
@interface MusicListViewController ()
@property (weak, nonatomic) IBOutlet UILabel *aristName;

@property (weak, nonatomic) IBOutlet UILabel *musicName;

@property (weak, nonatomic) IBOutlet UILabel *time;

@end

@implementation MusicListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.music.artist;
    self.aristName.text = self.music.artist;
    self.musicName.text = self.music.name;
    self.time.text = [NSString stringWithFormat:@"%ld:%02ld",(NSInteger)self.music.duration/60,(NSInteger)self.music.duration%60];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    


}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
