// Generated by CoffeeScript 1.6.1
var Util, assert, vows;

vows = require("vows");

assert = require("assert");

require("seajs");

require("../../etc/env");

Util = require("../../util/0.1.2/src/util");

vows.describe("API of Util").addBatch({
  "API Base64": {
    topic: function() {
      return Util.base64;
    },
    "Util.base64": function(res) {
      assert.ok(res);
      return assert.strictEqual(typeof res, "object");
    }
  },
  "API StateMachine": {
    topic: function() {
      return Util.StateMachine;
    },
    "Util.StateMachine": function(res) {
      assert.ok(res);
      return assert.strictEqual(typeof res, "function");
    }
  }
})["export"](module);
