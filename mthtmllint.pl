package MT::Plugin::mthtmllint;
;#	mthtmllint - HTML lint check for MovableType w/ BigPAPI
;#			Programmed by Piroli YUKARINOMIYA (MAGICVOX)
;#			Open MagicVox.net - http://www.magicvox.net/
;#			@see http://www.magicvox.net/archive/2006/03092330.php

use strict;
use htmllint;
;#use Data::Dumper;#DEBUG

use vars qw( $MYNAME $VERSION );
$MYNAME = 'mthtmllint';
$VERSION = '1.00';

use base qw( MT::Plugin );
my $plugin = new MT::Plugin ({
		name => $MYNAME,
		version => $VERSION,
		author_name => 'Piroli YUKARINOMIYA',
		author_link => 'http://www.magicvox.net/home.php',
		doc_link => 'http://www.magicvox.net/archive/2006/03092330.php',
		description => <<HTMLHEREDOC,
Easy checking the input text with
<a href="http://openlab.ring.gr.jp/k16/htmllint/">Another HTML-lint</a> ver.$htmllint::VERSION,<br />
which is the achieved work by ISHINO Keiichiro. Thanks!
HTMLHEREDOC
});
MT->add_plugin ($plugin);
add_plugin_action ();

sub instance { $plugin }



use constant TEMPLATE_NAME =>           'mthtmllint Entry Template';
use constant HTMLLINT_INPUT_PAGE =>     'mthtmllint_input.html';
use constant HTMLLINT_RESULT_PAGE =>    'mthtmllint_result.txt';
use constant CALLBACK_PRIORITY =>       1;


;### Add plugin actions onto the entry editing page
sub add_plugin_action {
	MT->add_plugin_action ('entry', HTMLLINT_INPUT_PAGE, <<HTMLHEREDOC);
$MYNAME $VERSION : See <b>INPUT</b> page used in the last htmllint checking.
HTMLHEREDOC

	MT->add_plugin_action ('entry', HTMLLINT_RESULT_PAGE, <<HTMLHEREDOC);
$MYNAME $VERSION : See <b>RESULT</b> page of the last htmllint checking.
HTMLHEREDOC
}


;### MT::Entry::pre_save Event Callback
MT::Entry->add_callback ("pre_save", CALLBACK_PRIORITY, $plugin, \&pre_save_callback);
sub pre_save_callback {
	my ($cb, $entry, $original_entry) = @_;
;#
	my $q = MT->instance->{query};
	return 1 unless defined $q->param("use_$MYNAME") && $q->param("use_$MYNAME") == 1;
;#
	;# Load a module template text for the container of input text.
	require MT::Template;
	my $tmpl = MT::Template->load({ blog_id => $entry->blog_id, name => TEMPLATE_NAME });
	return $cb->error ("Couldn't load the module template - ". TEMPLATE_NAME)
		unless $tmpl;

	;# Replace the virtual tags into the each data
	my $entry_title = $entry->title;
	my $text_body = $entry->text;
	my $text_more = $entry->text_more;
	my $entry_excerpt = $entry->excerpt;
	my $entry_keywords = $entry->keywords;
	if ($entry->convert_breaks) {
		$text_body =~ s/\n/<br \/>\n/ig;
		$text_more =~ s/\n/<br \/>\n/ig;
	}
	my $tmpl_text = $tmpl->text;
	$tmpl_text =~ s/<\$?MTEntryTitle\$?>/$entry_title/ig;
	$tmpl_text =~ s/<\$?MTEntryBody\$?>/$text_body/ig;
	$tmpl_text =~ s/<\$?MTEntryMore\$?>/$text_more/ig;
	$tmpl_text =~ s/<\$?MTEntryExcerpt\$?>/$entry_excerpt/ig;
	$tmpl_text =~ s/<\$?MTEntryKeywords\$?>/$entry_keywords/ig;

	;# Create a temporary file
	my $tmp = $cb->{plugin}->{full_path}. '/'. HTMLLINT_INPUT_PAGE;
	return $cb->error ("Couldn't create input file - $tmp")
		unless open FILE, ">$tmp";
	print FILE $tmpl_text;
	close FILE;

	;# Do htmllint
	my $htmllint = $cb->{plugin}->{full_path}. '/lib/htmllint';
	my $result = $cb->{plugin}->{full_path}. '/'. HTMLLINT_RESULT_PAGE;
	if (open FILE, ">$result") {
		;# my poor tech. orz
		my $ret = `perl $htmllint -w short $tmp`;
		print FILE $ret;
		close FILE;
	}
}


;### BigPAPI Modification Callback - edit_entry
MT->add_callback ('bigpapi::template::edit_entry', CALLBACK_PRIORITY, $plugin, \&edit_entry);
sub edit_entry {
	my ($cb, $app, $template) = @_;
;#
	;# hidden filed for flag of using mthtmllint
	my $old = quotemeta (<<HTMLHEREDOC);
<input type="hidden" name="action_name" value="" />
HTMLHEREDOC
	my $add = <<HTMLHEREDOC;
<input type="hidden" name="use_$MYNAME" value="0" />
HTMLHEREDOC
	$$template =~ s/($old)/$1$add/;

	;# Add "Save with mthtmllint" button 
	$old = quotemeta (<<HTMLHEREDOC);
<input accesskey="s" type="button" value="<MT_TRANS phrase="Save">" title="<MT_TRANS phrase="Save this entry (s)">" onclick="submitForm(this.form, 'save_entry')" />
HTMLHEREDOC
	$add = <<HTMLHEREDOC;
<input accesskey="l" type="button" value="<MT_TRANS phrase="Save">(+$MYNAME)" title="<MT_TRANS phrase="Save this entry (s)">" onclick="this.form.use_$MYNAME.value=1;submitForm(this.form, 'save_entry')" />
HTMLHEREDOC
	$$template =~ s/($old)/$1$add/g;
}


;### BigPAPI Modification Callback - preview_entry
MT->add_callback ('bigpapi::template::preview_entry', CALLBACK_PRIORITY, $plugin, \&preview_entry);
sub preview_entry {
	my ($cb, $app, $template) = @_;
;#
	;# Add "Save with mthtmllint" button 
	my $old = quotemeta (<<HTMLHEREDOC);
<input type="submit" name="save" accesskey="s" value="<MT_TRANS phrase="Save this entry">" />
HTMLHEREDOC
	my $add = <<HTMLHEREDOC;
<input type="hidden" name="use_$MYNAME" value="0" />
<input type="submit" name="save" accesskey="l" value="<MT_TRANS phrase="Save">(+$MYNAME)" onclick="return (this.form.use_$MYNAME.value=1)" />
HTMLHEREDOC
	$$template =~ s/($old)/$1$add/g;
}

1;