require('dotenv').config();
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const dns = require('dns');
const urlparser = require('url');
const app = express();
app.use(bodyParser.json());
let count = 1;
const urlDB = {};

// Basic Configuration
const port = process.env.PORT || 3000;

app.use(cors());

app.use('/public', express.static(`${process.cwd()}/public`));

app.get('/', function(req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

// Your first API endpoint
app.get('/api/hello', function(req, res) {
  res.json({ greeting: 'hello API' });
});

app.get('/api/shorturl/:short_url', (req, res) => {
  const shortUrl = req.params.short_url;
  if (!urlDB.hasOwnProperty(shortUrl)) {
    return res.status(404).json({ error: 'short url not found' });
  }
  const originalUrl = urlDB[shortUrl];
  res.redirect(originalUrl);
});

app.use(bodyParser.urlencoded({extended: false}), (req, res) => {
  const originalUrl = req.body.url;
  dns.lookup(urlparser.parse(originalUrl).hostname, (err, address) => {
    if (!address) {
      res.json({ error: 'Invalid URL' });
    } else {
      res.json({ original_url : originalUrl, short_url : count});
      urlDB[count] = originalUrl;
      count = count + 1
    }
  });
})

app.listen(port, function() {
  console.log(`Listening on port ${port}`);
});
