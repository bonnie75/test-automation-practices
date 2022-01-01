## Best Practices For Writing Test Cases in Cypress

I have just created my first cypress test case file and I believe there are some things test engineers could be mindful of when writing test cases in cypress. 
I decided to document the tasks that we can all be aware of in writing good test cases so that others that share your tests can also understand what the test is doing.
So let's not waste another minute, and check out some best practices below that I think will be useful for collaboration.

1.  always include a `describe` or `context` function at the beginning of each test suite to describe what the entire suite of tests are intended to do.
2.  likewise, always make sure `it` or `specify` also describes clearly what the individual test is testing.
3.  
