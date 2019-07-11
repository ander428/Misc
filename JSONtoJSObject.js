// Removes the quotes on JSON keys to make JS Object

var json = {}
var a =`{"Table" : [${json}]}`;
a=a.replace(/"(\w+)"\s*:/g, '$1:');
console.log(a);
