#!/bin/bash

read -r -d '' SETTINGS <<-'EOF'
var options = {};
chrome.extension.sendMessage({options: "get"}, function(opt){
    for (var option in opt) {
        options[option] = (opt[option] === 'true') ? true : false; 
        if (option == 'dev') ddgBox.debug = options[option];
    }
});
EOF

read -r -d '' SEARCH <<-'EOF'
    
        var request = {query: query};
        chrome.extension.sendMessage(request, function(response){
            ddgBox.renderZeroClick(response, query);
        });

EOF

./generate.sh "$SETTINGS" "$SEARCH"

