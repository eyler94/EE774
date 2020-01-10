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

B = np.array([[7, 8, 9],
              [11, 12, 13],
              [0, 4, 66]])

print("B:\n", B)

Bans1 = np.linalg.norm(B,1)
Bans2 = np.linalg.norm(B,2)
Bansinf = np.linalg.norm(B,np.inf)

print(f"1-norm: {Bans1}\n2-norm: {Bans2}\ninf-norm: {Bansinf}\n")

print(f"Product of norms:\n1-norms: {ans1*Bans1}\n2-norms: {ans2*Bans2}\ninf-norms: {ansinf*Bansinf}\n")

ABans1 = np.linalg.norm(A@B,1)
ABans2 = np.linalg.norm(A@B,2)
ABansinf = np.linalg.norm(A@B,np.inf)

print(f"Norm of products:\n1-norm: {ABans1}\n2-norm: {ABans2}\ninf-norm: {ABansinf}\n")
