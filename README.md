# bestSize
We have a table of bid prices and sizes of two buyers. Bid price _p_ with size _s_ means that the buyer is open to buy _s_ number of product at price _p_. We have a table of four columns:

   * bid prices offered by the two buyers, _pA_ and _pB_.
   * bid sizes, _sA_ and _sB_.
   
Our job is to add a new best size column (_bS_) to the table, that returns the size at the best price. If the two buyers have the same price then _bS_ is equal to _sA + sB_, otherwise, we need to take the bid size of the buyer that offers the higher price.

An example table with the desired extra column is below. The best prices are in bold.

![Sample table](/example.png)
