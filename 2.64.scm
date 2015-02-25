a.
1.partial-tree check if n = 0, if so, return an empty list and elts without modification.
2.partial-tree half the (n-1), to determine the size of left tree, then call itself on the first (n-1)/2 elements, to get the left tree, and the elements besides the left elements
3.partial-tree pick the first element of the non-left elements as the root node
4.by calling itself with the first (n - 1 - (n - 1) / 2) non-left element except the first(since it's the root node), partial-tree get the right tree, and the remaining elements(that not belong to left tree, root, nor right tree)
5.partial-tree pack the left tree, root and right tree up, along with the remaining elements, and return


b.
it should be O(n), since every element is travelled.
