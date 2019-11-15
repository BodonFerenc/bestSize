import numpy as np
import pandas as pd

PRICEDOMSIZE=  5  # domain size of prices
SIZEDOMSIZE= 100

def createTable(N):
    return pd.DataFrame({
   'pA': np.random.randint(0, PRICEDOMSIZE, N),
   'pB': np.random.randint(0, PRICEDOMSIZE, N),
   'sA': np.random.randint(0, SIZEDOMSIZE, N),
   'sB': np.random.randint(0, SIZEDOMSIZE, N)})

def createMultiColTable(N, pCols, sCols):
   M = len(pCols)
   if M != len(sCols):
        raise ValueError("length of price and size column names must be equal")
   return pd.DataFrame(
        np.concatenate([np.random.randint(0, PRICEDOMSIZE, size=(N, M)), 
                        np.random.randint(0, SIZEDOMSIZE,  size=(N, M))], axis=1), 
        columns = pCols + sCols)

def createArrayTable(N, M):
    rowLength = 1 + np.random.randint(0, M, N) 
    return pd.DataFrame({
        'price': np.array([np.random.randint(0, 5, i) 
                for i in rowLength]),
        'size':  np.array([np.random.randint(0, 100, i) 
                for i in rowLength])})

def bestSizeIF(pA, pB, sA, sB):
    if pA == pB:
        return sA + sB
    return sA if pA > pB else sB

def bestSizeWHERE(pA, pB, sA, sB):
    p = np.array([pA, pB])
    return np.sum(np.array([sA, sB])[
        np.where(p == np.max(p))])


def bestSizeMULT(pA, pB, sA, sB):
    p = np.array([pA, pB])
    return np.sum(np.array([sA, sB]) *
        (p == np.max(p)))


def bestSizeWSUM(pA, pB, sA, sB):
    p = np.array([pA, pB])
    return np.dot(np.array([sA, sB]),
        p == np.max(p))        



def bestSizeWSUM2(pA, pB, sA, sB):
    p = np.array([pA, pB])
    return np.inner(np.array([sA, sB]),
        p == np.max(p))         
    
def bestSizeDotsch(pA, pB, sA, sB):
    return sA * (pA >= pB) + sB * (pA <= pB)

def bestSizeIF_V(pA, pB, sA, sB):
    return np.where(pA == pB,  
        sA + sB, 
        np.where(pA > pB, sA, sB))

def bestSizeMULT_V(pA, pB, sA, sB):
    p = np.array([pA, pB])
    return np.sum(np.multiply(np.array([sA, sB]), 
        p == np.amax(p, axis=0)), axis=0)


def bestSizeWSUM_V(pA, pB, sA, sB):
    p = np.array([pA, pB])
    return np.einsum('ij,ij->j',
        np.array([sA, sB]),
        p == np.amax(p, axis=0))


def bestSizeWSUM_G(p, s):
    return np.einsum('ij,ij->j', 
        s, p == np.amax(p, axis=0))

def bestSizeMULT_G_array(t):
    return np.multiply(t['size'], t.price.apply(lambda r: r == r.max())).apply(sum)
