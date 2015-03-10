//
//  ViewController.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "iTunesManager.h"
#import "Entidades/Filme.h"
#import "SearchFieldViewCell.h"

@interface TableViewController () {
    NSArray *midias;
}

@end

@implementation TableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"celulaPadrao"];
    
    
    //iTunesManager *itunes = [iTunesManager sharedInstance];
    //midias = [itunes buscarMidias:@"Apple"];
    
#warning Necessario para que a table view tenha um espaco em relacao ao topo, pois caso contrario o texto ficara atras da barra superior
    //self.tableview.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, self.tableview.bounds.size.width, 52.f)];
    
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    SearchFieldViewCell *searchView = (SearchFieldViewCell *)self.tableview.tableHeaderView;
    [searchView.searchField resignFirstResponder];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    //SearchFieldViewCell *searchView = (SearchFieldViewCell *)self.tableview.tableHeaderView;
    iTunesManager *itunes = [iTunesManager sharedInstance];
    midias = [itunes buscarMidias: searchBar.text];
    [searchBar resignFirstResponder];
    [self.tableview reloadData];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    SearchFieldViewCell *headerView = [[[NSBundle mainBundle] loadNibNamed:@"SearchFieldViewCell" owner:self options:nil] firstObject];

    return headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Metodos do UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [midias count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *celula = [self.tableview dequeueReusableCellWithIdentifier:@"celulaPadrao"];
    
    Filme *filme = [midias objectAtIndex:indexPath.row];
    
    [celula.nome setText:filme.nome];
    [celula.tipo setText:[NSString stringWithFormat:@"%@ %@ (%@)", NSLocalizedString(@"filme", nil), filme.artista, filme.pais]];
    
    return celula;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 62;
}



@end
