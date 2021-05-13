---
layout: central
---

# Retype App's GitHub Actions (RAGHA) - Tests project.

This project is a client to the RAGHA repositories created here, to check whether they correctly implement logic to use retype.

## Tests directory

### 1. First batch, on `test1/`

#### 1.0: `config: test1`

- [Test result](test1.0/)

Tests building retype docs by specifying config as simply `test1`. It should find the retype.json file therein.

There should only be the "Test 1.x" article.

#### 1.1: `config: test1/retype,json`

- [Test result](test1.1/)

Tests building retype docs by specifying config as `test1/retype.json`. It should find the retype.json file therein.

There should only be the "Test 1.x" article.

#### 1.2: `config: ./test1`

- [Test result](test1.2/)

Same as 1.0 above, but prepends a `./` to the path.

There should only be the "Test 1.x" article.

#### 1.3: `./test1/retype.json`

- [Test result](test1.3/)

Same as 1.1 above, but prepends a `./` to the path.

There should only be the "Test 1.x" article.

#### 1.4: `config: test1/`

- [Test result](test1.4/)

Same as 1.0 above, but appends a `/` to the path.

There should only be the "Test 1.x" article.

#### 1.5: `config: ./test1/`

- [Test result](test1.5/)

Same as 1.0 above, but wraps the path between `./` and `/`. A combination of 1.2 and 1.4.

There should only be the "Test 1.x" article.

### 2. Second batch, on `test2/` and `test2/test21`

#### 2.0.0: `config: test2`

- [Test result](test2.0.0/)

Equivalent to 1.0 for the `test2` directory.

There should be the "Test 2.x" and "Test 2.1.x" articles.

#### 2.0.1: `config: test2/retype.json`

- [Test result](test2.0.1/)

Equivalent to 1.1 for the `test2/retype.json` file.

There should be the "Test 2.x" and "...2.1.x" articles.

#### 2.1.0: `config: test2/test21`

- [Test result](test2.1.0/)

Equivalent to 1.0 for the `test2/test21` directory. It should skip docs in `test2/` dir and elsewhere in the repo!

There should only be the "Test 2.1.x" article.

#### 2.1.1: `config: test2/test21/retype.json`

- [Test result](test2.1.1/)

Equivalent to 1.1 for the `test2/test21/retype.json` file. It should skip docs in `test2/` dir and elsewhere in the repo!

There should only be the "Test 2.1.x" article.

#### 2.1.2: `config: ./test2/test21`

- [Test result](test2.1.2/)

Same as 2.1.0 above, but prepends a `./` to the path.

There should only be the "Test 2.1.x" article.

#### 2.1.3: `config: ./test2/test21/retype.json`

- [Test result](test2.1.3/)

Same as 2.1.1 above, but prepends a `./` to the path.

There should only be the "Test 2.1.x" article.

#### 2.1.4: `config: ./test2/test21/`

- [Test result](test2.1.4/)

Same as 2.1.0 above, but wraps the path between `./` and `/`. Notice we didn't make a test which just appends slash to the path in this batch.

There should only be the "Test 2.1.x" article.

#### 2.1.5: `config: ./test1/../test2/test21/`

- [Test result](test2.1.5/)

Uses "upper-level" pathing to the directory containing the project.

There should only be the "Test 2.1.x" article.

### 3. Third batch, on `test3/`

#### 3.0: `config: test3/retype-custom.json`

- [Test result](test3.0/)

Builds retype reading settings off the `retype-custom.json` file.

There should be the "Test 3.x" and "not-a-doc" articles. The latter is just retype.json file renamed to a markdown extension.

#### 3.1: `config: test3/unrelated.txt`

- [Test result](test3.1/)

Builds retype reading settings off the `unrelated.txt` file.

There should be the "Test 3.x" and "not-a-doc" articles. The latter is just retype.json file renamed to a markdown extension.

#### 3.2: `config: test3/extensionless`

- [Test result](test3.2/)

Builds retype reading settings off the `extensionless` file.

There should be the "Test 3.x" and "not-a-doc" articles. The latter is just retype.json file renamed to a markdown extension.

#### 3.3: `config: test3/not-a-doc.md`

- [Test result](test3.3/)

Builds retype reading settings off the `not-a-doc.md` file.

There should be the "Test 3.x" and "not-a-doc" articles. The latter is just retype.json file renamed to a markdown extension.

### 4. Fourth batch, on `test4/`

#### 4.0: `config: test1/../test2/test21/../../test4`

- [Test result](test4.0/)

Uses a bit unusal relative path combination (that still, is valid). The config file, in turn, will build docs from its inner `test41/` dir.

There should only be the "Test 4.1.x" article.

#### 4.1: `config: ./test4/test41/..`

- [Test result](test4.1/)

Uses a bit unusal relative path combination (that still, is valid). The config file, in turn, will build docs from its inner `test41/` dir.

There should only be the "Test 4.1.x" article.

#### 4.2: `config: ./test4/test41/../`

- [Test result](test4.2/)

Uses a bit unusal relative path combination (that still, is valid). The config file, in turn, will build docs from its inner `test41/` dir.

There should only be the "Test 4.1.x" article.

#### 4.3: `config: ./test4/test41/../retype.json`

- [Test result](test4.3/)

Uses a bit unusal relative path combination (that still, is valid) to the actual file. The config file, in turn, will build docs from its inner `test41/` dir.

There should only be the "Test 4.1.x" article.

#### 4.4: `config: test4/test41/../retype.json`

- [Test result](test4.4/)

Uses a bit unusal relative path combination (that still, is valid) to the actual file. The config file, in turn, will build docs from its inner `test41/` dir.

There should only be the "Test 4.1.x" article.