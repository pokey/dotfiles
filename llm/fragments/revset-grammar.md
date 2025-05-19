<!--ts-->


<!-- Added by: runner, at: (timestamp removed) -->

<!--te-->

## Recipes

See [Revset recipes](https://github.com/arxanas/git-branchless/discussions/496) for some ideas and examples on how to use revsets.

## Grammar

The latest grammar is [in grammar.lalrpop](https://github.com/arxanas/git-branchless/blob/master/git-branchless-revset/src/grammar.lalrpop).

Names are resolved using the same logic as `git rev-parse`. Additionally, `.` is a synonym for `HEAD`.

## Built-in functions

The following functions are defined:

- `all()`: all [visible commits](https://github.com/arxanas/git-branchless/wiki/Command:-git-smartlog#which-commits-are-visible).
- `none()`: the empty set of commits.
- `union(x, y)`: all commits that are in either `x` or `y`.
- `intersection(x, y)`: all commits that are in both `x` and `y`.
- `difference(x, y)`: all commits that are in `x` but not in `y`.
- `only(x, y)`: all commits which are ancestors of `x`, but not ancestors of `y`.
- `range(x, y)`: all commits which are both descendants of `x` and ancestors of `y`.
- `ancestors(x)`: all commits which are ancestors of commits in `x`.
  - A commit is an "ancestor" of `x` if it is `x` or it is a parent of an ancestor of `x`. Note that this definition includes `x` itself in the set of ancestors of `x`.
- `ancestors.nth(x, n)`: the `n`th generation ancestor of `x`, following only the first parents.  Equivalent to `~n`.
- `descendants(x)`: all commits which are descendants of commits in `x`.
  - A commit is a "descendant" of `x` if it is `x` or it is a child of a descendant of `x`. Note that this definition includes `x` itself in the set of descendants of `x`.
- `parents(x)`: all commits which are an immediate parent of a commit in `x`.
- `parents.nth(x, n)`: the `n`th parent of `x`.  Equivalent to `^n`
- `children(x)`: all commits which are an immediate child of a commit in `x`.
- `roots(x)`: all commits in `x` which have no immediate ancestors also in `x`.
- `heads(x)`: all commits in `x` which have no immediate descendants also in `x`.
- `merges()`: all merge commits. *(Available since v0.9.0)*
- `main()`: the main branch commit. *(Available since v0.6.0.)*
- `public()`: all public commits, which is to say, all commits on the main branch. This is the same as `ancestors(main())`. *(Available since v0.6.0.)*
- `draft()`: all [draft commits](https://github.com/arxanas/git-branchless/wiki/Command:-git-smartlog#public-commits).
- `stack([x])`: all draft commits in the [commit stack](https://github.com/arxanas/git-branchless/wiki/Concepts#commit-stacks) containing `x`.  Without arguments, refers to the current commit stack (i.e. the one containing `HEAD`).
- `branches([text-pattern])`: all commits with branches pointing to them. If a pattern is provided, the result is restricted to commits whose branches match that pattern. *(Available since v0.9.0.)*
- `message(text-pattern)`: all commits whose messages match the specified pattern.
- `paths.changed(text-pattern)`: all commits with a changed file path matching the specified pattern.
- `author.name(text-pattern)`: all commits whose author name matches the specified pattern.
- `author.email(text-pattern)`: all commits whose author email matches the specified pattern.
- `author.date(date-pattern)`: all commits whose author date matches the specified pattern.
- `committer.name(text-pattern)`: all commits whose committer name matches the specified pattern.
- `committer.email(text-pattern)`: all commits whose committer email matches the specified pattern.
- `committer.date(date-pattern)`: all commits whose committer date matches the specified pattern.
- `exactly(x, n)`: all commits in `x`, but only if `x` contains exactly `n` commits. *(Available since v0.5.0.)*
- `current(x)`: the current version of all commits in `x`. *(Available since v0.6.0.)*
  - Commits in `x` that have been rewritten (for example, by being moved, reworded, amended, restacked, etc) will be resolved to their current version. Commits in `x` that have *not* been rewritten will be included as is.
- `tests.passed([test-command-pattern])`: all commits whose most recent test run for the specified test command passed. If no test command is specified, refers to the most-recently-run test command. *(Available since v0.7.0.)*
- `tests.failed([test-command-pattern])`: all commits whose most recent test run for the specified test command failed. If no test command is specified, refers to the most-recently-run test command. *(Available since v0.7.0.)*
- `tests.fixable([test-command-pattern])`: all commits whose most recent test run for the specified test command wrote output to the working copy, which could be used with `git test fix` to apply the changes. If no test command is specified, refers to the most-recently-run test command. *(Available since v0.7.0.)*

## Operators

The following unary operations are defined:

- `:x`: same as `ancestors(x)`.
  - `::x` is also accepted to be familiar for Mercurial users.
- `x:`: same as `descendants(x)`.
  - `x::` is also accepted to be familiar for Mercurial users.

The following binary operations are defined:

- `+`, `|`, `or`: same as `union`.
- `&`, `and`: same as `intersection`.
- `-`: same as `difference`.
  - Note that `foo-bar` is parsed as a branch name. To force the binary operation parsing, write `foo - bar` instead.
- `%`: same as `only`.
- `:`: same as `range`.
  - `::` is also accepted to be familiar for Mercurial users.
- `..`: same as `only`.

## Patterns

Text patterns:

- `foo`, `substr:foo`, `substring:foo`: matches if the text contains `foo` anywhere.
- `exact:foo`: matches if the entire text content is exactly `foo`.
- `glob:foo/*`: matches if the text content matches the glob pattern `foo/*` anywhere.
- `regex:foo.*`: matches if the text content matches the glob pattern `foo.*` anywhere.

Dates can be either absolute (`2022-01-01`) or relative (`1 month ago`). Date patterns:

- `before:date`: matches if the date is before `date`.
- `after:date`: matches if the date is after `date`.

Test command patterns: these are the same as text patterns and match against the full test command as run by [`git test`](https://github.com/arxanas/git-branchless/wiki/Command:-git-test). In particular, test command aliases are not stored in historical test run data, so test command matching is always performed against the fully-expanded test command.

## Aliases

Aliases may be defined via git config to provide easy access to oft used revset constructs. Parameters are supported, too: `$1` will be replaced with the first parameter, `$2` with the second, etc.

They can be defined from the command line:  

```
$ git config --global \
    branchless.revsets.alias.d \
    "draft()"`
```

Or directly in the git config file:

```
[branchless "revsets.alias"]
    grandChildren = children(children($1))
    sole = exactly($1, 1)
    onlyChild = sole(children($1))
    onlyParent = sole(parents($1))
    siblings = children(onlyParent($1)) - $1
```

Then, they can be used anywhere that `git branchless` accepts `revsets`:

```
$ git query 'd()'
...

$ git reword 'sole(siblings(abc123))'
...
```


