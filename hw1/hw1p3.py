#!/usr/bin/env python3
import numpy as np

A = np.array([[1, 2, 3],
              [4, 5, 6],
              [-1, -1, 1]])

print("A:\n", A)

ans1 = np.linalg.norm(A,1)
ans2 = np.linalg.norm(A,2)
ansinf = np.linalg.norm(A,np.inf)

print(f"1-norm: {ans1}\n2-norm: {ans2}\ninf-norm: {ansinf}\n")

# One norm
for spot, row in enumerate(A.T):
    temp = np.sum(row)
    if spot==0:
        ans1 = temp
    else:
        if temp>ans1:
            ans1 = temp

# Two norm
e_val,e_vec = np.linalg.eig(A.T @ A)

for spot, val in enumerate(e_val):
    temp = np.sqrt(val)
    if spot==0:
        ans2 = temp
    else:
        if temp>ans2:
            ans2 = temp

# Infinity norm
for spot, row in enumerate(A):
    temp = np.sum(row)
    if spot==0:
        ansinf = temp
    else:
        if temp>ansinf:
            ansinf = temp

print(f"1-norm: {ans1}\n2-norm: {ans2}\ninf-norm: {ansinf}\n")
