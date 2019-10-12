system "d .bestSize";
// @fileOverview
// Return bestSize value using vector IF
//
// @param pA {long[]} price of buyer A
// @param pB {long[]} price of buyer B
// @param sA {long[]} size of buyer A
// @param sB {long[]} size of buyer B
//
// @returns {long[]} bestSize value that is sA or sB or sA + sB if pA equals to pB
.bestSize.bestSizeIF_V:{[pA; pB; sA; sB] 
   ?[pA = pB;
       sA + sB;
       ?[pA > pB; sA; sB]]};    
.bestSize.bestSizeDotsch:{[pA; pB; sA; sB] 
   (sA * pA >= pB) + sB * pA <= pB};
.bestSize.bestSizeWSUM:{[pA; pB; sA; sB] 
  p: pA, pB;
  :(sA, sB) wsum 
     p = max p};
.bestSize.bestSizeMULT_V_N2_ver2:{[pA; pB; sA; sB]
      p: pA ,' pB;
      :sum each (sA ,' sB) * 
         p = max each p};
// @fileOverview
// Creates a random table of array price and size columns
//
// @param N {long} The number of rows
// @param M {long} The number of element each price/size column should contain
//
// @returns {table} Returns a table of two long array columns
.bestSize.createArrayTable:{[N; M]
   rowLength: 1 + N?M;
   :([] price: rowLength ?\: PRICEDOMSIZE; 
         size: rowLength ?\: SIZEDOMSIZE)};

.bestSize.bestSizeWHERE:{[pA; pB; sA; sB] 
  p: pA, pB;
  :sum (sA, sB) 
     where p = max p};
.bestSize.bestSizeWSUM_G_N2:{[p; s]
   :s wsum' p = max each p};
// @fileOverview
// Creates a random table
//
// @param N {long} The number of rows
//
// @returns {table} table of colums pA, pB, sA, sB of type long
.bestSize.createTable:{[N]
    :([] pA: N?PRICEDOMSIZE; pB: N?PRICEDOMSIZE; 
         sA: N?SIZEDOMSIZE;  sB: N?SIZEDOMSIZE)
    }

.bestSize.bestSizeMULT_V:{[pA; pB; sA; sB]
      p: (pA; pB);        // 2 x N
      :sum (sA; sB) * 
         p =\: max p};         
.bestSize.bestSizeWSUM_V_N2_ver2:{[pA; pB; sA; sB]
   p: pA ,' pB;
   :(sA ,' sB) wsum' 
      p = max each p};
.bestSize.bestSizeWSUM_V_N2_ver1:{[pA; pB; sA; sB]
   p: flip (pA; pB);
   :flip[(sA; sB)] wsum' 
      p = max each p};
// @fileOverview
// Return bestSize value using scalar IF
//
// @param pA {long} price of buyer A
// @param pB {long} price of buyer B
// @param sA {long} size of buyer A
// @param sB {long} size of buyer B
//
// @returns {long} bestSize value that is sA or sB or sA + sB if pA equals to pB
.bestSize.bestSizeIF:{[pA; pB; sA; sB] 
  if[pA = pB; 
      :sA + sB]; 
	:$[pA > pB; sA; sB]};
// @fileOverview
// Return bestSize value using scala multiplication and sum
//
// @param pA {long} price of buyer A
// @param pB {long} price of buyer B
// @param sA {long} size of buyer A
// @param sB {long} size of buyer B
//
// @returns {long} bestSize value that is sA or sB or sA + sB if pA equals to pB
.bestSize.bestSizeMULT:{[pA; pB; sA; sB] 
  p: pA, pB;
  :sum (sA, sB) * 
     p = max p};
.bestSize.bestSizeWSUM_G:{[p; s]
   :s wsum p =\: max p};
.bestSize.bestSizeWSUM_V:{[pA; pB; sA; sB]
   p: (pA; pB);
   :(sA; sB) wsum
      p =\: max p};
.bestSize.bestSizeMULT_V_N2_ver1:{[pA; pB; sA; sB]
      p: flip (pA; pB);   // N x 2
      :sum each flip[(sA; sB)] * 
         p = max each p};
// @fileOverview
// Creates a random table of multiple price and size columns
//
// @param N {long} The number of rows
// @param pCols {symbol[]} list of price column names
// @param sCols {symbol[]} list of size column names
//
// @returns {table} Returns a table of int colums
.bestSize.createMultiColTable:{[N; pCols; sCols]
   M: count pCols;
   if[not M = count sCols;
      '"length of price and size column names must be equal"];
   :flip (pCols, sCols)!raze N cut'(M*N)?'PRICEDOMSIZE, SIZEDOMSIZE
    }


.bestSize.PRICEDOMSIZE:5
.bestSize.SIZEDOMSIZE:100
system "d .";
