## .bestSize.PRICEDOMSIZE

## .bestSize.SIZEDOMSIZE

## .bestSize.bestSizeDotsch

## .bestSize.bestSizeIF


 Return bestSize value using scalar IF


**Parameter(s):**

|Name|Type|Description|
|---|---|---|
|pA|long|price of buyer A|
|pB|long|price of buyer B|
|sA|long|size of buyer A|
|sB|long|size of buyer B|

**Returns:**

|Name|Type|Description|
|---|---|---|
||long|bestSize value that is sA or sB or sA + sB if pA equals to pB|

## .bestSize.bestSizeIF_V


 Return bestSize value using vector IF


**Parameter(s):**

|Name|Type|Description|
|---|---|---|
|pA|long[]|price of buyer A|
|pB|long[]|price of buyer B|
|sA|long[]|size of buyer A|
|sB|long[]|size of buyer B|

**Returns:**

|Name|Type|Description|
|---|---|---|
||long[]|bestSize value that is sA or sB or sA + sB if pA equals to pB|

## .bestSize.bestSizeMULT


 Return bestSize value using scala multiplication and sum


**Parameter(s):**

|Name|Type|Description|
|---|---|---|
|pA|long|price of buyer A|
|pB|long|price of buyer B|
|sA|long|size of buyer A|
|sB|long|size of buyer B|

**Returns:**

|Name|Type|Description|
|---|---|---|
||long|bestSize value that is sA or sB or sA + sB if pA equals to pB|

## .bestSize.bestSizeMULT_V

## .bestSize.bestSizeMULT_V_N2_ver1

## .bestSize.bestSizeMULT_V_N2_ver2

## .bestSize.bestSizeWHERE

## .bestSize.bestSizeWSUM

## .bestSize.bestSizeWSUM_G

## .bestSize.bestSizeWSUM_G_N2

## .bestSize.bestSizeWSUM_V

## .bestSize.bestSizeWSUM_V_N2_ver1

## .bestSize.bestSizeWSUM_V_N2_ver2

## .bestSize.createArrayTable


 Creates a random table of array price and size columns


**Parameter(s):**

|Name|Type|Description|
|---|---|---|
|N|long|The number of rows|
|M|long|The number of element each price/size column should contain|

**Returns:**

|Name|Type|Description|
|---|---|---|
|&lt;returns&gt;|table|Returns a table of two long array columns|

## .bestSize.createMultiColTable


 Creates a random table of multiple price and size columns


**Parameter(s):**

|Name|Type|Description|
|---|---|---|
|N|long|The number of rows|
|pCols|symbol[]|list of price column names|
|sCols|symbol[]|list of size column names|

**Returns:**

|Name|Type|Description|
|---|---|---|
|&lt;returns&gt;|table|Returns a table of int colums|

## .bestSize.createTable


 Creates a random table


**Parameter(s):**

|Name|Type|Description|
|---|---|---|
|N|long|The number of rows|

**Returns:**

|Name|Type|Description|
|---|---|---|
|&lt;returns&gt;|table|table of colums pA, pB, sA, sB of type long|