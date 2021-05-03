# Retype App's GitHub Actions (RAGHA) - Tests project.

This project is a client to the RAGHA repositories created here, to check whether they correctly implement logic to use retype.

## Tests directory

### 1. Test 1.0: test retype.json in a subdirectory (wd)

- [Test result](test1.0/)

Tests building retype docs by changing working directory into `test1/`.

There should only be the "README for test 1.x" article.

### 1. Test 1.1: test retype.json in a subdirectory (retypejson-path)

- [Test result](test1.1/)

Tests building retype docs by specifying the path of `test1/retype.json`.

There should only be the "README for test 1.x" article.

### 1. Test 2.0.0: test retype.json in a subdirectory (wd)

- [Test result](test2.0.0/)

Tests building retype docs by changing working directory into `test2/`.

There should be the "README for test 2.x" and "...2.1.x" articles.

### 1. Test 2.0.1: test retype.json in a subdirectory (path)

- [Test result](test2.0.1/)

Tests building retype docs by specifying the path of `test2/retype.json`.

There should be the "README for test 2.x" and "...2.1.x" articles.

### 1. Test 2.1.0: test retype.json in a subdirectory (wd)

- [Test result](test2.1.0/)

Tests building retype docs by changing working directory into `test2/test21`.

There should only be the "README for test 2.1.x" article.

### 1. Test 2.1.1: test retype.json in a subdirectory (path)

- [Test result](test2.1.1/)

Tests building retype docs by specifying the path of `test2/test21/retype.json`.

There should only be the "README for test 2.1.x" article.

### 1. Test 3.0: test retype.json in a subdirectory (wd)

- [Test result](test3.0/)

Tests building retype docs by changing working directory into `test3/`.

There should be the "README for test 2.x" and "...2.1.x" articles here, test3 points to test2.

### 1. Test 3.1: test retype.json in a subdirectory (path)

- [Test result](test3.1/)

Tests building retype docs by specifying the path of `test3/retype.json`.

There should be the "README for test 2.x" and "...2.1.x" articles here, test3 points to test2.