var fs = require('fs'),
    util = require('util'),
    vm = require('vm'),
    codePath = process.argv.pop(),
    sandbox = {
      console: {
        log: console.log
      },
      process: {
        argv: process.argv.slice(2)
      }
    };

vm.runInNewContext(fs.readFileSync(codePath), sandbox);