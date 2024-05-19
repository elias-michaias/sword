const jsdom = require("jsdom");
const { JSDOM } = jsdom;

const options = {
    resources: 'usable',
    runScripts: 'dangerously',
}

JSDOM.fromFile("dist/index.html", options).then(dom => {
    console.log(dom.serialize());
});