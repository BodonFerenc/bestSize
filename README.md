# bestSize
We have a table of bid prices and sizes of two buyers. Bid price p with size s means that the buyer is open to buy s number of product at price p. We have a table of four columns:

   * bid prices offered by the two buyers, pA and pB.
   * bid sizes, sA and sB.
   
Our job is to add a new best size column (bS) to the table, that returns the size at the best price. If the two buyers have the same price then bS is equal to sA + sB, otherwise, we need to take the bid size of the buyer that offers the higher price.
