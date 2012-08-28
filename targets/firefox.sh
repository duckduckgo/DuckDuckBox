#!/bin/bash

read -r -d '' SETTINGS <<-'EOF'
self.port.emit('get-options');
var options = [];
self.port.on('set-options', function(opt){
    options = opt['options'];
});
EOF

read -r -d '' SEARCH <<-'EOF'
    
    self.port.emit('load-results', {'query': query});
    self.port.on('results-loaded', function(data) {
        ddgBox.renderZeroClick(data.response, query);
    });
EOF

./generate.sh "$SETTINGS" "$SEARCH"

