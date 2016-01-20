//
//  MusicGroupTableViewController.m
//  MYMMusic01
//
//  Created by apple on 16/1/18.
//  Copyright © 2016年 EvilCompassion. All rights reserved.
//

#import "MusicGroupTableViewController.h"
#import "TRMusic.h"
#import "TRMusicGroup.h"
#import "TRMusicCell.h"
#import "MusicListViewController.h"
@interface MusicGroupTableViewController ()
@property (nonatomic,strong)TRMusicGroup *group;
@end

@implementation MusicGroupTableViewController

- (TRMusicGroup *)group
{
    if (!_group) {
        _group = [TRMusicGroup fakeData][0];
        
    }
    return _group;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return self.group.musics.count+2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
         UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MusicCell"];
               cell.textLabel.text = @"自动下载";
        UISwitch *switch1 = [[UISwitch alloc]init];
        switch1.frame = CGRectMake(250, 10, 51, 31);
        [cell addSubview:switch1];
        return cell;
    }else if (indexPath.row == 1)
    {
         UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MusicCell"];
       
        cell.textLabel.text = @"随机播放";
        return cell;

    }else{
        TRMusicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MusicCell" forIndexPath:indexPath];
    
    TRMusic *music = self.group.musics[indexPath.row-2];
    
        cell.music  = music;
        return cell;
    }
    
    
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MusicListViewController *mvc = segue.destinationViewController;
    TRMusicCell *cell = (TRMusicCell *)sender;
    //mvc.music = self.group.musics[cell.indexPath.row-2];
    //[self.navigationController pushViewController:mvc animated:YES];
    mvc.music = cell.music;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
