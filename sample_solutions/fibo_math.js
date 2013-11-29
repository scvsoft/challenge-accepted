var args = require('system').args;

fibo = function(element) {
  phi = 0.5 + Math.sqrt(5) / 2 ;
  return parseInt(0.5 + Math.pow(phi, element) / Math.sqrt(5));
}

console.log(fibo(args[1]));