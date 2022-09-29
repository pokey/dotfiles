function targetContainingScope(scopeType) {
  return {
    "cursorless.modal.targetScopeType": {
      scopeType,
    },
  };
}

function targetDecoratedMarkWithColor(color) {
  return {
    "modalkeys.captureChar": {
      acceptAfter: 1,
      executeAfter: {
        "cursorless.modal.targetDecoratedMarkWithColor": {
          color,
          character: "__captured",
        },
      },
    },
  };
}

module.exports = {
  keybindings: {
    c: { "cursorless.modal.performActionOnTarget": "remove" },
    f: targetContainingScope("namedFunction"),
    d: targetDecoratedMarkWithColor("default"),
    i: "modalkeys.enterInsert",
    l: targetContainingScope("line"),
    r: targetDecoratedMarkWithColor("red"),
  },
};
