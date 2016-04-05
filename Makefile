.SILENT: all clean
all: 
	which wget  >/dev/null || { echo "ERROR: wget not found. Please install wget" && exit 1 ; }
	which patch >/dev/null || { echo "ERROR: patch not found. Please install patch" && exit 1 ; }
	rm -f check_lsi_raid
	wget -q https://raw.githubusercontent.com/thomas-krenn/check_lsi_raid/master/check_lsi_raid
	patch -p0 <check_lsi_raid.patch
	rm -f Which.pm
	wget -q http://cpansearch.perl.org/src/PEREINAR/File-Which-0.05/Which.pm
	chmod a+rx check_lsi_raid
	echo 
	echo "******************************************************************"
	echo "*                       				         *"
	echo "*                     Patching Complete 		         *"
	echo "*                       				         *"
	echo "******************************************************************"
	echo
	echo "Now please copy the files to your server: "
	echo
	echo "SERVER=yourserver.domain.tld"
	echo rsync check_lsi_raid '$$'SERVER:/usr/lib/check_mk_agent/local
	echo rsync Which.pm '$$'SERVER:/usr/lib/perl5/*/File/
	echo ""
	echo "Hints: "
	echo
	echo " - Your local perl library path may be different."
	echo " - Every modern linux distribution provides the Perl Module"
	echo "   File::Which via package repository - Citrix XenServer does not,"
	echo "   so use the downloaded file Which.pm"
	echo
	
clean:
	rm -f check_lsi_raid
	rm -f Which.pm
