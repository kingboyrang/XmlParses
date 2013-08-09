//
//  ViewController.m
//  XmlParses
//
//  Created by rang on 13-8-9.
//  Copyright (c) 2013年 rang. All rights reserved.
//

#import "ViewController.h"
#import "XmlParseHelper.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //对于soap xml的解析
    NSString *path=[[NSBundle mainBundle] pathForResource:@"soapXml" ofType:@"xml"];
    NSString *xml=[[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    XmlParseHelper *_helper=[[[XmlParseHelper alloc] initWithData:xml] autorelease];
    NSArray *soapArr=[_helper soapXmlSelectNodes:@"//ForexRmbRate"];
    NSLog(@"soap xml的解析结果为=%@\n",soapArr);
    //带有命名空间的xml解析
    NSString *path1=[[NSBundle mainBundle] pathForResource:@"namespaceXml" ofType:@"xml"];
    NSString *xml1=[[NSString alloc] initWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:nil];
    XmlParseHelper *_helper1=[[[XmlParseHelper alloc] initWithData:xml1] autorelease];
    NSDictionary *ns=[NSDictionary dictionaryWithObjectsAndKeys:@"http://schemas.microsoft.com/exchange/autodiscover/responseschema/2006",@"ns", nil];
    XmlNode *node=[_helper1 selectSingleNode:@"//ns:EwsUrl" nameSpaces:ns];
    NSLog(@"节点名=%@\n",node.Name);
    NSLog(@"节点值=%@\n",node.Value);

	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
