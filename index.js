const {exec} = require('child_process');
const list = require('./abbr.js');

// Setup
const config = {shell: '/usr/local/bin/fish'};
const logger = (error, stdout, stderr) => {
	if (error)
		return console.error(`EXEC ERROR: ${error}`);

	if (stdout)
		return console.log(`${stdout}`);

	if (stderr)
		return console.log(`STDERROR: ${stderr}`);
}

// Import
list.forEach((abbr) => {
	if (abbr.charAt(0) === '#' || abbr.length === 0) {
		console.log(abbr);
		return;
	}
	else {
		console.log(abbr);
		exec(abbr, config, logger);
		return;
	}
});

// Voila!
exec("echo '~~~ Done! ~~~'", config, logger);

