var lin = process.env.USER_ID;
var titlee = process.env.FAKE_VAR;
const puppeteer = require('puppeteer');
const execFile = require('child_process').execFile;


function launchHeadlessChrome(url, callback) {
    // Assuming MacOSx.
    const CHROME = '/usr/bin/google-chrome-stable';
    execFile(CHROME, ['--headless', '--disable-gpu', '--remote-debugging-port=9222', "CONNECTION_TIMEOUT=60000","-incognito",url], callback);
  }
launchHeadlessChrome('', (err, stdout, stderr)=>{});

const f = (async() => {
    const browser = await puppeteer.launch({      
      dumpio: true,
      headless: false
    });
    const page = await browser.newPage();
    await page.goto(lin);
    await page._client.send("Page.setDownloadBehavior", {
      behavior: "allow",
      downloadPath: "./anime/" + titlee
    })
    await setTimeout(async() =>{
        const link = await page.evaluate(() => document.querySelector('*').outerHTML);
        await page.mouse.click(782, 354);
        await setTimeout(async() =>{
        await page.bringToFront();
        await page.mouse.click(782, 354);
      }, 10);
    }, 10000);
});
f();
