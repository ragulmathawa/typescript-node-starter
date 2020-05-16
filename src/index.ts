import { get } from 'http';
get({
    host: 'wttr.in',
    path: '/',
    // pretend to be a curl client to get plain text 
    headers: {
        'User-Agent': "curl/7.68.0"
    }
}, (res) => {
    const { statusCode } = res;
    const contentType = res.headers['content-type'];

    let error;
    if (statusCode !== 200) {
        error = new Error('Request Failed.\n' +
            `Status Code: ${statusCode}`);
    } else if (!/^text\/plain/.test(contentType || '')) {
        error = new Error('Invalid content-type.\n' +
            `Expected text/plain but received ${contentType}`);
        console.log()
    }
    if (error) {
        console.error(error.message);
        // Consume response data to free up memory
        res.resume();
        return;
    }

    res.setEncoding('utf8');
    let rawData = '';
    res.on('data', (chunk) => { rawData += chunk; });
    res.on('end', () => {
        console.log(rawData);
    });
}).on('error', (e) => {
    console.error(`Got error: ${e.message}`);
});