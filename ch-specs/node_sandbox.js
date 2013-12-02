var fs = require('fs'),
    util = require('util'),
    vm = require('vm'),
    codePath = process.argv.pop(),
    sandbox = {
      console: {
        log: console.log
      },
      process: {
        argv: process.argv
      }
    };

fs.readFile(codePath, function (err, data) {
  if (err) throw err;
  var code = vm.createScript(data);
  code.runInNewContext(sandbox);
});