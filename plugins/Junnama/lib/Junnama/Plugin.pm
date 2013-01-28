package Junnama::Plugin;
use strict;

sub _junnama {
    my $app = shift;
    if (! $app->user->is_superuser ) {
        return $app->trans_error( 'Permission denied.' );
    }
    my $plugin = MT->component( 'Junnama' );
    my $tmpl = File::Spec->catfile( $plugin->path, 'tmpl', 'junnama.tmpl' );
    my $param;
    $param->{ page_title } = $plugin->translate( 'Check Junnama' );
    return $app->build_page( $tmpl, $param );
}

1;