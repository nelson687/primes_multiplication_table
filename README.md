## Phoenix project that takes a numeric input (N) from user and outputs a multiplication table of (N) prime numbers.
The multiplication table will be displayed in the browser

### Stack
  - Erlang/OTP 20
  - Elixir 1.5.1
  - Phoenix 1.3.0

### Run:
  - Go to application directory and run ```mix phx.server```
  - Go to browser and enter http://localhost:4000
  - Insert a number and click on Submit.
  - For small amount of primes expected browser is going to be fine, for big numbers, for example n > 50000 I suggest testing using the unit tests, as the browser might freeze.
  - For large numbers, if trying in the browser (recommend using chrome), after a while, the matrix will start showing progressively.

### Tests:
  - Run ```mix test``` on application directory.

Very interesting project where I could learn about Elixir and had to think about performance.
