function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    // apiUrl: 'http://localhost:8080/api/todos'
    baseUrl: 'https://restful-booker.herokuapp.com/',
    reqresBaseUrl: 'https://reqres.in/'
  }
  var createTokenResult = karate.callSingle('classpath:examples/restful-booker/createToken/createToken.feature@create_token_caller', config);
  config.generalToken = createTokenResult.response.token;
  karate.configure('headers', { 'Content-Type': 'application/json' });
  return config;
}