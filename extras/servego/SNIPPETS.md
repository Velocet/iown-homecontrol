# Snippets from Serv-E-Go

## Code Snippets

```JAVASCRIPT
checkQRCodeString (str: string): boolean {
  const REMOTE_QR_CODE_LENGHT_SITUO = 56;
  const REMOTE_QR_CODE_LENGHT_KEYGO = 40;
  const regExp = new RegExp(/^[0-9A-F\r\n]+$/);
  return (regExp.test(str) && (str.length === REMOTE_QR_CODE_LENGHT_KEYGO || REMOTE_QR_CODE_LENGHT_SITUO));}
```

```C#
ParseResponse (byte[] response){
  if (2 == response.Length || 16 == response.Length){
    byte num               = response[0];
    byte DeviceTypeAndLock = response[1]; //int
    byte VersionMain       = response[2];
    byte VersionSub        = response[3];
    uint Revision          = (uint)((int)response[4]  +256* (int)response[5]  +65536* (int)response[6]  +16777216* (int)response[7]);
    uint RelayUp           = (uint)((int)response[8]  +256* (int)response[9]  +65536* (int)response[10] +16777216* (int)response[11]);
    uint RelayDown         = (uint)((int)response[12] +256* (int)response[13] +65536* (int)response[14] +16777216* (int)response[15]);
    if      (0 == num) mPluggedDeviceType   = DeviceTypeAndLock;
    else if (1 == num) mMustLoadStorageData = true;
  }
  if (6 == response.Length){
    SetSetAndGoVersion(
      response[0], //num
      response[1], //DeviceTypeAndLock
      (ushort)((uint)response[2] + 256U * (uint)response[3]) //VersionMain + VersionSub
    );
  }
}
```

## LocalStorage

TODO Make example code for copy pasting into dev console

- Set this to true enabled the DevTool:
    serv-e-go-devtool-enabled
    serv-e-go-devtool-collapsed
    serv-e-go-bypassonboarding
    serv-e-go-bypass-sso
    serv-e-go-bypass-bullet-hq
    serv-e-go-installer-override
    serv-e-go-get-devices-synch-override
    serv-e-go-devtool-bypass-salesforce

```JSON serv-e-go JWT decoded
{ "roles": ["ROLE_USER"],
  "username": "mail@example.org",
  "exp": 1662653889,
  "iat": 1662653589,
  "jti": "631a149532520" }
```

```JSON serv-e-go LocalStorage
serv-e-go-oauth2accesstoken: "Y2U1YzhmMzEzZjM1MWJiYzA2ODE4ODg3NzgyYTgwZmM2N2UzZjNhNDY0ZGQ1OTllYTkxODlhMzY1OWU4MTliYw"
serv-e-go-oauth2refreshtoken: "ZTkyNWEzZWQzZDAyNzM5NjFiZDY0ZjZlNmU0NTA2NmE1YWZmMzEyZTdhN2Q3NzE3NjI3M2ZlZjE4ZjlmZGI1MA"
serv-e-go-jsonwebtoken: "eyJhbGciOiJSUzI1NiJ9.eyJyb2xlcyI6WyJST0xFX1VTRVIiXSwidXNlcm5hbWUiOiJ2ZWx1eEBtYWlsLnZlbG9jZXQuZGUiLCJleHAiOjE2NjI2NTM4ODksImlhdCI6MTY2MjY1MzU4OSwianRpIjoiNjMxYTE0OTUzMjUyMCJ9.mIAUyphF1AvOeazlusSrgMb_uDX1Znr-g5RZfG1dGlqWgEo3XD4FN62Wy4MsFGpmwu6B-vTE6YRPi0TJ4eGMSS6o05ewkZhqzdansNlUQDjVvFunaICLPqMNTToFUwsfjW8tvFOjH5hVrQosSZHpBxFWAfOFwS5kg9odxsoR2_CCePbUbohfg0iAausp57aN2wCjxBebCmbSUKr7nYdYRZwHWFKdhqP5K4fKM-pPQXEZ7MElXxUMlzx13gumWjiOmEVCmnZo4wHdZLrV_SLRT0uZXWp4X6Ajo-PuDSsy5hwCVDjRNEmq-roz-JOsvJ1p8-RAngRyl4pNn53rqozTH0JH1FrzzwuBapDau067IX0dNd6WZqQzzH-PRR1V2KSf5O1i0KUpjv2Q8K0jv_Z81vnhx-fBRnkcY6Vv8q0prQdhCvvop4LWAP2Eo6MvucG1QGoBuD7WGszSTcU7WK_GyaClqNt827EzEKuTQoYCtRLOqZj058CbcrkYNd-tpngQvyHz87QIfTppgPqz25NEgDmIWipogVGojCvKO96hW3TdSjVrQwFn4ZLOldp5H2Feao23OG-3zvHaGzybcZN9gOHB8X3_tEeY6Y47s0glcCXtZ6IK4j9_iks71VhXI92Doo6HZLjlZbwF3HLMpZZ33DwG5HpFi6JK7N0bMlLFj24"
serv-e-go-locale: "en"
serv-e-go-oauth2expirein: 1662657190961
serv-e-go-installer-override: "{\"installer\":true,\"user_id\":\"\",\"user_name\":\"\",\"email\":\"\",\"servegoAccess\":true}"
serv-e-go-oauth2scope: "user.basic api.full oa.site oa.user oa.device oa.devicedefinition oa.subscription level.2 api.myfox myfox.api oa.site.priv hkp.full pro.app oa.subscription"
BULLET_TRAIN_DB: {
  "api": "https://api.flagsmith.com/api/v1/","environmentID": "QJrk6ryLG7pEbXTioUBUFg",
  "flags": {
    "sso_migration":{"id":2871,"enabled":true,"value": null},
    "custom_intervention_expiration_in_minutes":{"id":3548,"enabled":false,"value":null},
    "new_registration_process":{"id":6143,"enabled":true,"value": null},
    "detach_box_from_installation":{"id":6158,"enabled":true,"value": null}},
  "identity": "mail@example.org","traits": {"businessunit": "BU250"},
  "evaluationEvent": {}}
```

## Exmplae Requests

### Token

- https://ms-servego-api-prod.somfy.cloud/v1/security/oauth/token
  RES
    access-control-allow-headers: Content-Type,Authorization,Origin,X-Requested-With,Accept,X-Access-Token,bypasssso,bypasssalesforce,timezone,sentry-trace
    access-control-allow-methods: GET,HEAD,OPTIONS,PUT,PATCH,POST,DELETE
  REQ GET
    authorization: Bearer eyJhbGciOiJSUzI1NiJ9.eyJyb2xlcyI6WyJST0xFX1VTRVIiXSwidXNlcm5hbWUiOiJ2ZWx1eEBtYWlsLnZlbG9jZXQuZGUiLCJleHAiOjE2NjI2NTM4ODksImlhdCI6MTY2MjY1MzU4OSwianRpIjoiNjMxYTE0OTUzMjUyMCJ9.mIAUyphF1AvOeazlusSrgMb_uDX1Znr-g5RZfG1dGlqWgEo3XD4FN62Wy4MsFGpmwu6B-vTE6YRPi0TJ4eGMSS6o05ewkZhqzdansNlUQDjVvFunaICLPqMNTToFUwsfjW8tvFOjH5hVrQosSZHpBxFWAfOFwS5kg9odxsoR2_CCePbUbohfg0iAausp57aN2wCjxBebCmbSUKr7nYdYRZwHWFKdhqP5K4fKM-pPQXEZ7MElXxUMlzx13gumWjiOmEVCmnZo4wHdZLrV_SLRT0uZXWp4X6Ajo-PuDSsy5hwCVDjRNEmq-roz-JOsvJ1p8-RAngRyl4pNn53rqozTH0JH1FrzzwuBapDau067IX0dNd6WZqQzzH-PRR1V2KSf5O1i0KUpjv2Q8K0jv_Z81vnhx-fBRnkcY6Vv8q0prQdhCvvop4LWAP2Eo6MvucG1QGoBuD7WGszSTcU7WK_GyaClqNt827EzEKuTQoYCtRLOqZj058CbcrkYNd-tpngQvyHz87QIfTppgPqz25NEgDmIWipogVGojCvKO96hW3TdSjVrQwFn4ZLOldp5H2Feao23OG-3zvHaGzybcZN9gOHB8X3_tEeY6Y47s0glcCXtZ6IK4j9_iks71VhXI92Doo6HZLjlZbwF3HLMpZZ33DwG5HpFi6JK7N0bMlLFj24
  ```JSON
  {
    "access_token": "Y2U1YzhmMzEzZjM1MWJiYzA2ODE4ODg3NzgyYTgwZmM2N2UzZjNhNDY0ZGQ1OTllYTkxODlhMzY1OWU4MTliYw",
    "refresh_token": "ZTkyNWEzZWQzZDAyNzM5NjFiZDY0ZjZlNmU0NTA2NmE1YWZmMzEyZTdhN2Q3NzE3NjI3M2ZlZjE4ZjlmZGI1MA",
    "jwt_token": "eyJhbGciOiJSUzI1NiJ9.eyJyb2xlcyI6WyJST0xFX1VTRVIiXSwidXNlcm5hbWUiOiJ2ZWx1eEBtYWlsLnZlbG9jZXQuZGUiLCJleHAiOjE2NjI2NTM4ODksImlhdCI6MTY2MjY1MzU4OSwianRpIjoiNjMxYTE0OTUzMjUyMCJ9.mIAUyphF1AvOeazlusSrgMb_uDX1Znr-g5RZfG1dGlqWgEo3XD4FN62Wy4MsFGpmwu6B-vTE6YRPi0TJ4eGMSS6o05ewkZhqzdansNlUQDjVvFunaICLPqMNTToFUwsfjW8tvFOjH5hVrQosSZHpBxFWAfOFwS5kg9odxsoR2_CCePbUbohfg0iAausp57aN2wCjxBebCmbSUKr7nYdYRZwHWFKdhqP5K4fKM-pPQXEZ7MElXxUMlzx13gumWjiOmEVCmnZo4wHdZLrV_SLRT0uZXWp4X6Ajo-PuDSsy5hwCVDjRNEmq-roz-JOsvJ1p8-RAngRyl4pNn53rqozTH0JH1FrzzwuBapDau067IX0dNd6WZqQzzH-PRR1V2KSf5O1i0KUpjv2Q8K0jv_Z81vnhx-fBRnkcY6Vv8q0prQdhCvvop4LWAP2Eo6MvucG1QGoBuD7WGszSTcU7WK_GyaClqNt827EzEKuTQoYCtRLOqZj058CbcrkYNd-tpngQvyHz87QIfTppgPqz25NEgDmIWipogVGojCvKO96hW3TdSjVrQwFn4ZLOldp5H2Feao23OG-3zvHaGzybcZN9gOHB8X3_tEeY6Y47s0glcCXtZ6IK4j9_iks71VhXI92Doo6HZLjlZbwF3HLMpZZ33DwG5HpFi6JK7N0bMlLFj24",
    "id": "b17d-6dbe-d008-8ce7",
    "modified_at": 1662653590962,
    "expires_at": 1662657190961,
    "scope": "user.basic api.full oa.site oa.user oa.device oa.devicedefinition oa.subscription level.2 api.myfox myfox.api oa.site.priv hkp.full pro.app oa.subscription",
    "user": "velux@mail.velocet.de",
    "userID": null,
    "salesforceId": null,
    "crmId": null,
    "bu": null,
    "country": null,
    "account_type": null
  }
  ```

- https://accounts.somfy.com/oauth/oauth/v2/token
  POST
    client_id: 77d6b25d-d78a-11e8-bd0c-02dd59bd3041_3pgvy4ax458gs04kgw0ssc0os84gowg08w88ko8o0cgccgssoc
    client_secret: 66qk5wx3ungok0kc0k4gss80so044cwgcwo4s88oowwsssk480
    grant_type: refresh_token
    refresh_token: NjAzOGYwNDJjYTg3ZWE2OTNmYzc4N2U0NzYwNjg5OGE5MzIwZDdmYzlhNjdmMmExZjFmZGVmM2E4MDQ5YmY1ZA

### TagCommander

- PROD:
  https://cdn.tagcommander.com/3887/tc_Somfy_20.js
  https://cdn.tagcommander.com/3887/tc_Somfy_21.js
  https://cdn.tagcommander.com/3887/tc_Somfy_34.js
- DEV:
  https://cdn.tagcommander.com/3887/uat/tc_Somfy_20.js
  https://cdn.tagcommander.com/3887/uat/tc_Somfy_21.js
  https://cdn.tagcommander.com/3887/uat/tc_Somfy_34.js
