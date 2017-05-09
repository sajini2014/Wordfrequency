#!usr/bin/perl ;  


#********************************************************************************************
# File ID				:	wordfrequency.pl
# Version				:	1.1
# Project Name				:	ILTTS
# Author Name				:	Sajini 
# Date of Last Updation			:	07/10/2009
# Description				:	list the unique words and frequency occurrence
#********************************************************************************************


use utf8;

open (out,">:utf8", "wordlist.txt") or die " THE FILE not found $!"; # output file 
my %wordfreq;

print"\n Input the name of the folder containing the input files \n as  foldername/ ="; 
$folder_path=<STDIN>;#takes the input from the keyboard
chomp($folder_path);#removing the '\n' character


opendir(IMD, $folder_path) || die("Cannot open directory");#open the directory containing files
@files=grep /\.txt|.dat$/, readdir(IMD);


foreach $file (@files) 
{	
	$outstr="";
#open(IN,"<:utf8","ConjunctsList.txt")|| die("Cannot open file".$folder_path.$file);
open(IN,"<:utf8",$folder_path.$file)|| die("Cannot open file".$folder_path.$file);

while ($line=<IN>)
	{

		$line=~s/\.//gi;
		$line=~s/\,//gi;
		@w=split (/\s+/, $line);
		foreach $word (@w)
			{ 
			$wordfreq{$word}++;
			}
	}

} # end of for each 

sub hashvaluedescedingorder{
$wordfreq{$b} <=> $wordfreq{$a} ;
}


#foreach $key (sort hashvaluedescedingorder (keys(%wordfreq) ) ) {
#print out "\t $key \t\t $wordfreq{$key}  \n";
#print out "$key \n";
#}

print "\t\t\t###############################################################\n
       \t\t\t##########   Enter option 1 to get word list    ###############\n
       \t\t\t#########               and 		        ############\n
       \t\t\t########     Enter option 2 to get word frequency    ##########\n
       \t\t\t###############################################################\n";
my $option=<STDIN>;
chomp($option);
print $option."\n";
if ($option==1){
	print " Entering 1\n";
	foreach $key (sort hashvaluedescedingorder (keys(%wordfreq) ) ) {
			print out "$key \n";
	}
}
elsif ($option==2){
	print " Entering 2\n";
	foreach $key (sort hashvaluedescedingorder (keys(%wordfreq) ) ) {
		print out "\t $key \t\t $wordfreq{$key}  \n";
	}
}
else {
print "\n  wrong option \n ";
}


