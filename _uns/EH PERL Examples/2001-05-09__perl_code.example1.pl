<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=windows-1252"></HEAD>
<BODY><XMP>#!/usr/local/bin/perl
#print "@ARGV";
$filename=@ARGV[0];
$count=4;

if ($filename =~ /\.tei/) {
	print "here";
	&tei;
} elsif ($filename =~ /\.dc/) {
	&sgml;
} elsif ($filename =~ /\.marc/) {
	print "marc";
	&marc;
} elsif ($filename =~ /\.out/) {
	&NRC;
} elsif ($filename =~ /\.x/) {
	&DC;


} else {

	while (<>) {
		if (/^\n/) {
			next;
		} elsif (/[tT][eE][iI]/) {
#			print;
			$sub_choice="tei";
			close(<>);
		} elsif (/\.000\./) {
			$sub_choice="marc";
			close(<>);
		} elsif (/[Sc][Cc][Hh][eE][Mm][Aa]\.[Dd][Cc]/) {
			$sub_choice="DC";
			close(<>);
		}}
}


if ($sub_choice =~ /tei/) { 
		&tei; 
	} elsif ($sub_choice =~ /marc/) {
		&marc;
	} elsif ($sub_choice =~ /DC/) {
		&DC;
	}


sub tei {
	$quit=0;
	open(URL, "$filename\.\_d\_");
	while(<URL>) {
		if (/<UR/) {
			$url = $_;
			$url =~ s/URL>/mURL>/g;
		} else { next; }
	}
	close(URL);

	open(IN,"$filename");
	while (<IN>) {
#			s/\"/\&quot\;/g;
		if (/\/ABSTRACT/ || /[Dd][Ii][Vv]0/) {
			$quit = 1;
		}
		if (/<([Hh][Ee][Aa][Dd])>/ || /<\/\1/) { next; }
		if (/<([Bb][Oo][Dd][Yy])/ || /<\/\/\1/) { next; }
		if (/<[Tt][Aa][Bb][Ll][Ee]/) { s/<[Tt][Aa][Bb].*>//g; }
		if (/<[Tt][Dd]/) { s/<[Tt][Dd].*>//g; }
		if (/\/head>/) {next; }
		if (/^-->/) { next; }
		if (/<html>/) { next; }
		if (/back\.gif/) { next; }
		if (/conlogor\.gif/) { next; }
		if (/title level/) { next; }
		s/<[Pp]>//g;
		s/original\s*file<\/a>/original file<\/a><BR>/g;
		s/<!--//g;
		s/<\/[Pp]>//g;
		s/<keywords/<mSubject><keywords/g;
		s/<\/keywords>/<\/mSubject><\/keywords>/g;
		s/<title>/<mTitle>/g;
		s/<\/title>/<\/mTitle>/g;
		s/<author>/<author><mAuthor>/g;
		s/<\/author>/<\/mAuthor><\/author>/g;
		s/<notesStmt>/<notesStmt><mDescription>/g;
		s/<\/notesStmt>/<\/mDescription><\/notesStmt>/g;
		s/<publicationStmt>/<publicationStmt><mPublisher>/g;
		s/<\/publicationStmt>/<\/mPublisher><\/publicationStmt>/g;
		s/<sourceDesc>/<sourceDesc><mSource>/g;
		s/<\/sourceDesc>/<\/mSource><\/sourceDesc>/g;
		s/<date>/<date><mDate>/g;
		s/<\/date>/<\/mDate><\/date>/g;
		s/<langUsage>/<langUsage><mLanguage>/g;
		s/<\/langUsage>/<\/mLanguage><\/langUsage>/g;
		s/<ABSTRACT>/<mSubject>/g;
		s/<\/ABSTRACT>/<\/mSubject>/g;
		s/<lb>/<BR>/;
	print;
		if ($quit == 1) {
			print "<mType>Text</mType><mFormat>text\/sgml</mFormat><mSubject></mSubject>\n";
			print "<mType></mType>$url\n\n\n\n\n\n"; 
		close(IN);
		}
	}
}


sub NRC {
	open(URL, "$filename\.\_d\_");
	while(<URL>) {
		if (/<UR/) {
			$url = $_;
		} else { next; }
	}
	close(URL);

	$r=0;
	open(IN,"$filename");
	while (<IN>) {
		s/\"/\&quot\;/g;
		if (/\<Pubdate\>/) {
			$start1 = $_;
			$start = index("$start1","1");
				if ($start eq -1) {
						$start = index($start1,"2");
				}

			$year = substr($start1,$start,$count);
#			print "year:$year\n$start";

#			print "<mDate>" . $year . "</mDate>";
		}

		if (/REFERENCE/ && $r==0) { 
			s/REFERENCE/mReference/;
			$r=1;
		} elsif (/REFERENCE/) {
			s/<REFERENCE>//g;
			}
		if (/ABSTRACT/) { $p = 1; }
		if (/\/ABSTRACT/) { $p = ""; }

		unless ($p) {
			s/<[Pp]>//g;
		}
		s/<!--//g;
		s/<\/[Pp]>//g;
		s/<TITLE>/<mTitle>/g;
		s/<\/TITLE>/<\/mTitle>/g;
		s/<AUTHOR>/<author><mAuthor>/g;
		s/<\/AUTHOR>/<\/mAuthor><\/author>/g;

		s/<Language>/<Language><mLanguage>/g;
		s/<\/Language>/<\/mLanguage><\/Language>/g;
		s/<ABSTRACT>/\1<mSubject>/g;
		s/<\/ABSTRACT>/<\/mSubject>\1/g;

		print;
		if ($year && /Issue2/) {
			print "<mDate>" . $year . "</mDate>\n";
			$year = "";
		}

	}
		print "$url\n";
}



sub marc {
	open(URL, "$filename\.\_d\_");
	while(<URL>) {
		if (/<UR/) {
			$url = $_;
		} else { next; }
	}
	close(URL);

	open(IN,"$filename");
		while (<IN>) {
			s/\"/\&quot\;/g;
			s/\|\w/ /g;
			$end="";
			if (/^\s*\.00\d\./) {
				next;
			} elsif (/^\s*\.090/) {
				s/\.090\./<mLocation>/;
				$end="</mLocation>";
			} elsif (/^\s*\.1\d\d/) {
				s/\.1\d\d\./<mAuthor>/;
				$end="</mAuthor>";
				$authorCheck=0;
			} elsif (/^\s*\.2\d\d/) {
				s/\.2\d\d\./<mTitle>/;
				$end="</mTitle>";
			} elsif (/^\s*\.5\d\d/) {
				s/\.5\d\d\./<mDescription>/;
				$end="</mDescription>";
			} elsif (/^\s*\.[67]\d\d/) {
				s/\.[67]\d\d\./<mSubject>/;
				$end="</mSubject>";
			} elsif (/^\s*\.3\d\d/) {
				s/\.3\d\d\./<mFormat>/;
				$end="</mFormat>";

			}
			
			if (/^</) {
				
				print "$last\n$_";
				$last = $end;
				$end = "";
			} else {
				print;
			}
		}
		print "$last\n";
		unless ($authorCheck) { print "<mAuthor></mAuthor>"; }
		print "$url";
}


sub DC {
	open(URL, "$filename\.\_d\_");
	while(<URL>) {
		if (/<UR/) {
			$url = $_;
		} else { next; }
	}
	close(URL);
	$pub=0; $auth=0;$source=0;$date=0;$title=0;$right=0;$mURL=0;
	$type=0;$form=0;$contrib=0;$note=0;
	open(IN,"$filename");
		while (<IN>) {
			if (/^\s*<LINK/) { next; }
			if (/\"\"/) {
				s/\"\"/\"/g;
				s/(.*CONTENT=\".*)\"/\1/;
			}
			($tag,$value) = /(\".*\").*(\".*\")/;
			if ($tag =~ /publisher/) {
				$begin = "<mPublisher>";$end="</mPublisher>";
				$pub=1;
			} elsif ($tag =~ /creator/ || $tag =~ /author/) {
				$begin = "<mAuthor>";$end="</mAuthor>";	
				$auth=1;
			} elsif ($tag =~ /relation/) {
				$begin = "<mSource>";$end="</mSource>";
				$source=1;
			} elsif ($tag =~ /date/) {
				$begin = "<mDate>";$end="</mDate>";	
				$date=1;		
			} elsif ($tag =~ /title/) {
				$begin = "<mTitle>";$end="</mTitle>";
				$title=1;
			} elsif ($tag =~ /right/) {
				$begin = "<mRight>";$end="</mRight>";
				$right=1;
			} elsif ($tag =~ /ident/) {
				$begin = "<mURL>";$end="</mURL>";
				$mURL=1;
			} elsif ($tag =~ /type/) {
				$begin = "<mType>";$end="</mType>";
				$type=1;
			} elsif ($tag =~ /format/) {
				$begin = "<mFormat>";$end="</mFormat>";
				$form=1;
			} elsif ($tag =~ /contributor/) {
				$begin = "<mContributor>";$end="</mContributor>";
				$contrib=1;
			} elsif ($tag =~ /subject/) {
				$begin = "<mSubject>";$end="</mSubject>";
			} elsif ($tag =~ /notes/) {
				$begin = "<mNotes>";$end="</mNotes>";
				$note=1;	
			} elsif ($tag =~ /description/) {
				$begin = "<mSubject>";$end="</mSubject>";			
			}

			$value =~ s/\"//g;
#			print "$begin\n$value\n$end\n";
			$begin =~ s/<//;
			$begin =~ s/>//;
			$tag{"$begin"} = $value;

	}
			print "<mTitle>$tag{\"mTitle\"}</mTitle>\n";
			print "<mAuthor>$tag{\"mAuthor\"}</mAuthor>\n";
			print "<mPublisher>$tag{\"mPublisher\"}</mPublisher>\n";
			print "<mDate>$tag{\"mDate\"}</mDate>\n";
			print "<mRight>$tag{\"mRight\"}</mRight>\n";

			print "<mSource>$tag{\"mSource\"}</mSource>\n";
			print "<mType>$tag{\"mType\"}</mType>\n";
			print "<mFormat>$tag{\"mFormat\"}</mFormat>\n";
			print "<mContributor>$tag{\"mContributor\"}</mContributor>\n";
			print "<mNotes>$tag{\"mNotes\"}</mNotes>\n";
			print "<mURL>$tag{\"mURL\"}</mURL>\n";

			print "$url";


	print "<mSubject></mSubject>\n<mSubject></mSubject>\n<mSubject></mSubject>\n<mSubject></mSubject>\n<mSubject></mSubject>\n<mSubject></mSubject>\n<mSubject></mSubject>\n";

}
</XMP></BODY></HTML>
