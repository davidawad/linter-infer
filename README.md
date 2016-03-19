## linter-infer

### Under Construction!

This is a linter for Github Atom that takes advantage of the Facebook Infer static code analyzer. 

It will inform you of logical errors in your project!
Here's some sample `infer` output from the command line. The same thing is run on your project whenever you trigger the plugin. 


 
```sh
➜  test  infer -- javac ExampleClass.java
Starting analysis (Infer version v0.8.0)
F...
Analyzed 1 file

Found 1 issue

ExampleClass.java:12: error: NULL_DEREFERENCE
  object s last assigned on line 11 could be null and is dereferenced at line 12
  10.       int mayCauseNPE() {
  11.           String s = mayReturnNull(0);
  12. >         return s.length();
  13.       }
  14.
  15.

Summary of the reports

  NULL_DEREFERENCE: 1
```

## Support
    - Java
    - C
    - Objective C 
    - Android Java
    - iOS

## Contributors




