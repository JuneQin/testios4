//
//  CustomPickerViewController.m
//  Pickers
//
//  Created by guo gloria on 11-7-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CustomPickerViewController.h"


@implementation CustomPickerViewController
@synthesize picker;
@synthesize winLabel;
@synthesize colum1;
@synthesize colum2;
@synthesize colum3;
@synthesize colum4;
@synthesize colum5;
@synthesize button;
@synthesize crunchSoundID;
@synthesize winSoundID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [colum3 release];
    [colum2 release];
    [colum1 release];
    [colum4 release];
    [colum5 release];
    [picker release];
    [winLabel release];
    
    if (winSoundID) {
        AudioServicesDisposeSystemSoundID(winSoundID),winSoundID = 0;
    }
    
    if (crunchSoundID) {
        AudioServicesDisposeSystemSoundID(crunchSoundID),crunchSoundID =0;
    }
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    UIImage *seven = [UIImage imageNamed:@"seven.png"];
    UIImage *bar = [UIImage imageNamed:@"bar.png"];
    UIImage *crown = [UIImage imageNamed:@"crown.png"];
    UIImage *cherry = [UIImage imageNamed:@"cherry.png"];
    UIImage *lemon = [UIImage imageNamed:@"lemon.png"];
    UIImage *apple = [UIImage imageNamed:@"apple.png"];
    
    for (int i=1; i<=5; i++) {
        UIImageView *sevenView = [[UIImageView alloc] initWithImage:seven];
        UIImageView *barView = [[UIImageView alloc] initWithImage:bar];
        UIImageView *crownView = [[UIImageView alloc] initWithImage:crown];
        UIImageView *lemonView = [[UIImageView alloc] initWithImage:lemon];
        UIImageView *appleView = [[UIImageView alloc] initWithImage:apple];
        UIImageView *cherryView = [[UIImageView alloc] initWithImage:cherry];
        
        
        NSArray *imageViewArray = [[NSArray alloc] initWithObjects:sevenView,barView,crownView,cherryView,lemonView,appleView, nil];
        
        NSString *fieldName = [[NSString alloc] initWithFormat:@"colum%d",i];
        
        //This method lets you set a property based on its name. So, if we call this with a value of "colum1", it is exactly the same as calling the mutator method setColumn1:
        [self setValue:imageViewArray forKey:fieldName];
        [fieldName release];
        [imageViewArray release];
        [sevenView release];
        [barView release];
        [cherryView release];
        [lemonView release];
        [appleView release];
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"win" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:path], &winSoundID);
    
    path = [[NSBundle mainBundle] pathForResource:@"crunch" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:path], &crunchSoundID);
    
    
    srandom(time(NULL));
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    self.colum1 = nil;
    self.colum2 = nil;
    self.colum3 = nil;
    self.colum4 = nil;
    self.colum5 =nil;
    
    [self setPicker:nil];
    [self setWinLabel:nil];
    
    
    self.button = nil;
    
    if (winSoundID) {
        AudioServicesDisposeSystemSoundID(winSoundID),winSoundID = 0;
    }
    
    if (crunchSoundID) {
        AudioServicesDisposeSystemSoundID(crunchSoundID),crunchSoundID =0;
    }
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonPressed {
    
    BOOL win = NO;
    int numInRow = 1;
    int lastVal = -1;
    for(int i=0;i<5;i++)
    {
        int newValue = random()%[self.colum1 count];
        
        if (newValue == lastVal) {
            numInRow++;
        }else
        {
            numInRow = 1;
        }
        
        lastVal = newValue;
        [picker selectRow:newValue inComponent:i animated:YES];
        [picker reloadComponent:i];
        if (numInRow>=3) {
            win=YES;
        }
    }
    
    button.hidden = YES;
    AudioServicesPlaySystemSound(crunchSoundID);
    
    if(win)
    {
        [self performSelector:@selector(playWinSound) withObject:nil afterDelay:1.5];
    }else
    {
        [self performSelector:@selector(showButton) withObject:nil afterDelay:.5];
    }
//    
//    if (win) {
//        winLabel.text = @"WIN";
//    }else
//    {
//        winLabel.text = @"";
//    }
}

- (void)showButton
{
    button.hidden = NO;
}

- (void)playWinSound
{
    AudioServicesPlaySystemSound(winSoundID);
    winLabel.text = @"WIN";
    
    //This is a very handy method available to all objects. It lets you call the method some time in the future—in this case, one and a half seconds in the future—which will give the dials time to spin to their final locations before telling the user the result.
    [self performSelector:@selector(showButton) withObject:nil afterDelay:1.5];
    
}

#pragma mark -
#pragma mark Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.colum1 count];
}

#pragma mark Picker Delegate Methods

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    NSString *arrayName = [[NSString alloc] initWithFormat:@"colum%d",component+1];
    NSArray *array = [self valueForKey:arrayName];
    [arrayName release];
    return [array objectAtIndex:row];
}

@end
