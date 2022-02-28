function fn() {
var env = karate.env; // get system property 'karate.env' karate.log('karate.env system property was:', env);
if (!env) {
env = 'dev';
}

var config = {
env: env,
myVarName: 'hello karate',
baseUrl: 'https://gorest.co.in',
tokenID: '0995b1a23d0969e0e6c23bcee55c72e0daf0cc917e6ce8162ed65aabebbf2c72'
}

if (env == 'dev') {
// customize
// e.g. config.foo = 'bar';
} else if (env == 'e2e') {
// customize
}
return config;
}