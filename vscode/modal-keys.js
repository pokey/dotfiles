function selectTarget(target) {
  return {
    "cursorless.command": {
      version: 2,
      action: {
        name: "setSelection",
        args: [],
      },
      targets: [target],
      usePrePhraseSnapshot: false,
    },
  };
}

function selectContainingScope(scopeType) {
  return selectTarget({
    type: "primitive",
    modifiers: [
      {
        type: "containingScope",
        scopeType: {
          type: scopeType,
        },
      },
    ],
  });
}

function selectDecoratedMarkWithColor(color) {
  return {
    "modalkeys.captureChar": {
      acceptAfter: 1,
      executeAfter: selectTarget({
        type: "primitive",
        mark: {
          type: "decoratedSymbol",
          symbolColor: color,
          character: "__captured",
        },
      }),
    },
  };
}

module.exports = {
  keybindings: {
    d: selectDecoratedMarkWithColor("default"),
    i: "modalkeys.enterInsert",
    f: selectContainingScope("namedFunction"),
    l: selectContainingScope("line"),
  },
};
