/*
 *  Copyright (C) 2009, 2010, 2011, 2012, 2013, 2014 Stephen F. Booth <me@sbooth.org>
 *  All Rights Reserved
 */

#import "InspectorPanelController.h"
#import "SFBInspectorView.h"

@implementation InspectorPanelController

- (id) init
{
	return [super initWithWindowNibName:@"InspectorPanel"];
}

- (void) windowDidLoad
{
	[[self window] setMovableByWindowBackground:YES];

	[self.inspectorView addInspectorPane:self.trackView title:NSLocalizedString(@"Track Information", @"The name of the track inspector panel")];
	[self.inspectorView addInspectorPane:self.discView title:NSLocalizedString(@"Disc Information", @"The name of the disc inspector panel")];
	[self.inspectorView addInspectorPane:self.driveView title:NSLocalizedString(@"Drive Information", @"The name of the drive inspector panel")];
	
	[super windowDidLoad];
}

- (NSString *) windowFrameAutosaveName
{
	return @"Inspector Panel";
}

- (IBAction) toggleInspectorPanel:(id)sender
{
    NSWindow *window = self.window;
	
	if(window.isVisible)
		[window orderOut:sender];
	else
		[window orderFront:sender];
}

- (BOOL) validateMenuItem:(NSMenuItem *)menuItem
{
	if([menuItem action] == @selector(toggleInspectorPanel:)) {
		NSString *menuTitle = nil;		
		if(!self.isWindowLoaded || !self.window.isVisible)
			menuTitle = NSLocalizedString(@"Show Inspector", @"Menu Item");
		else
			menuTitle = NSLocalizedString(@"Hide Inspector", @"Menu Item");
		
		[menuItem setTitle:menuTitle];
		
		return YES;
	}
	else	
		return NO;
}

@end
