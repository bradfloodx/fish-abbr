const fs = require('fs');

const abbrDump = fs.readFileSync('./abbr.txt', 'utf8');
const abbr = abbrDump.split('\n');

module.exports = abbr;
