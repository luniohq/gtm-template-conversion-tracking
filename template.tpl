___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Lunio Conversion Tracking",
  "categories": ["CONVERSIONS", "ANALYTICS"],
  "brand": {
    "id": "brand_dummy",
    "displayName": "Lunio"
  },
  "description": "Installs the Lunio conversion tracking script and fires a conversion event.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "scriptUrl",
    "displayName": "Script URL",
    "simpleValueType": true,
    "alwaysInSummary": true
  },
  {
    "type": "TEXT",
    "name": "conversionId",
    "displayName": "Conversion ID",
    "simpleValueType": true,
    "alwaysInSummary": true
  },
  {
    "type": "TEXT",
    "name": "orderId",
    "displayName": "Order ID (optional)",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const callInWindow = require('callInWindow');
const logToConsole = require('logToConsole');

const scriptUrl = data.scriptUrl;
const conversionId = data.conversionId;
const orderId = data.orderId;

const onSuccess = function() {
  if (orderId) {
    callInWindow('LunioTrackConversion', conversionId, { order_id: orderId });
  } else {
    callInWindow('LunioTrackConversion', conversionId);
  }
  data.gtmOnSuccess();
};

const onFailure = function() {
  logToConsole('Lunio - Script failed to load');
  data.gtmOnFailure();
};

injectScript(scriptUrl, onSuccess, onFailure, 'lunioConversionScript');


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://client-conversions.lunio.ai/**"
              }
            ]
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "call_in_window",
        "versionId": "1"
      },
      "param": [
        {
          "key": "functionName",
          "value": {
            "type": 1,
            "string": "LunioTrackConversion"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 19/03/2026
