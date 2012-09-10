#!/bin/bash

read -r -d '' SETTINGS <<-'EOF'
var options = {};
chrome.extension.sendRequest({options: "get"}, function(opt){
    for (var option in opt) {
        options[option] = (opt[option] === 'true') ? true : false; 
    }
});
EOF

read -r -d '' SEARCH <<-'EOF'
    
    ddgBox.search = function(query) {
        var request = {query: query};
        chrome.extension.sendRequest(request, function(response){
            ddgBox.renderZeroClick(response, query);
        });

EOF

./generate.sh "$SETTINGS" "$SEARCH"

