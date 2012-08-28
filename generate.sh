#!/bin/bash

escape () {
    echo $(echo "$1" | sed -e "s#\n#\\n#g" -e "s#\t#\\t#g" -e "s#'#\\'#g")
}



SETTINGS=${1:-}
SEARCH=${2:-}
BUILDDIR=${3:-_build}


perl -pe "s#%%SEARCH%%#$SEARCH#g or s#%%SETTINGS%%#$SETTINGS#g" js/template/google.js >\
    $BUILDDIR/js/google.js

perl -pe "s#%%SEARCH%%#$SEARCH#g or s#%%SETTINGS%%#$SETTINGS#g" js/template/bing.js >\
    $BUILDDIR/js/bing.js

