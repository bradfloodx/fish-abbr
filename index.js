const {exec} = require('child_process');
const list = require('./abbr.js');

const config = {shell: '/usr/local/bin/fish'};

const logger = (error, stdout, stderr) => {
	if (error)
		return console.error(`exec error: ${error}`);

	if (stdout)
		return console.log(`stdout: ${stdout}`);

	if (stderr)
		return console.log(`stderr: ${stderr}`);
}

list.forEach((abbr) => {
	if (abbr.length && abbr.charAt(0) !== '#') {
		console.log(`Adding: ${abbr}`);
		exec(abbr, config, logger);
	}
});

exec("echo 'Abbreviations Imported!'", config ,logger);
