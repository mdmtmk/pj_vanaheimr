#!/usr/bin/perl
use strict;
use Web::Scraper;
use URI;
use Data::Dumper;
use Encode;

my $uri = URI->new("http://ja.wikipedia.org/wiki/%E6%97%A5%E6%9C%AC%E3%81%AE%E8%A6%B3%E5%85%89%E5%9C%B0%E4%B8%80%E8%A6%A7");
my $scraper = scraper {
    process '//*[@id="mw-content-text"]/ul/li/a', 'list[]' => { 'title' => 'TEXT', 'link' => '@href' };
#    process '//*[@id="mw-content-text"]/ul/li/a', 'result[]' => { 'title' => 'TEXT', 'link' => '@href' };
};
my $result = $scraper->scrape($uri);
my $a = ref $result;
  print "$a へのリファレンス\n" if ($a) ;
  print "scaler\n" unless ($a) ;
my $b = ref %$result;
  print "$b へのリファレンス\n" if ($b) ;
  print "scaler\n" unless ($b) ;

my @key=keys(%$result);
print "key:@key\n";
my $num=keys(%$result);
print "num:$num\n";
my @val=values(%$result);
print "val:@val\n";
while (my @pair = each(%$result)) {
	print "pair: @pair\n";
}
my $c = ref $result->{list};
  print "$c へのリファレンス\n" if ($c) ;
  print "scaler\n" unless ($c) ;
#while (my @arrpair = each($result->{list})) {
#	print "arrpair: @arrpair\n";
#}
#my @value=values($result->{list}->[0]);
#print "value:@value\n";
print "title:", $result->{list}->[0]->{title} ;
print ", ";
print "link:", $result->{list}->[0]->{link};
print "\n";
print scalar(@{$result->{list}});

#foreach my $i(0 .. scalar({$result->{list}}) - 1) { print $result->{list}->[$i]->{title}, "\n"; }
foreach my $i(0 .. scalar(@{$result->{list}}) - 1) {
	print "no.", $i;
	print ": ";
	print encode_utf8($result->{list}->[$i]->{title});
	print ", ";
	print $result->{list}->[$i]->{link}, "\n"; 
}


#foreach my $elem (@$result) {
#foreach ($result) {
	#print "$result->{title} $result->{link}";
#	print "$result->{title}";
#	print "$result->{link}";
	#print "$result[0]{title}";
	#print "$result->result[0]->{title}";
#	print "\n", %$result, "aaa\n";
#	print "%$result->list[0]->{title}";
	#print "$elem->{title}";
#	print Dumper($result);
#	print Dumper(\%result);
	#print "$_ $result{$_}\n" for (keys $result);
	#print "@{[%$result]}->list[0]->{title}";
#	print "@{[%$result]->list[0]-{title}}";
#	print "%$result";
#}
#foreach my $line (keys %$result) {
#	print "$line: \n";
#}
