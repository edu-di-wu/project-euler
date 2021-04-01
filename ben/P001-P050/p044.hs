{-
Pentagonal numbers are generated by the formula, Pn=n(3n−1)/2. The first ten pentagonal numbers are:

1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...

It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their difference, 70 − 22 = 48, is not pentagonal.

Find the pair of pentagonal numbers, Pj and Pk, for which their sum and difference are pentagonal and D = |Pk − Pj| is minimised; what is the value of D?
-}

-- Maybe an idea to take for a part of the pentaNbs and one extra and compare everything in the first with the new number, untill a number is found, if non is found expand the list with the extra number and take the following one to compare with. 

main = print . (\(a,b) -> abs (a-b)) . head $ validPairs

validPairs :: [(Int,Int)]
validPairs = [(n1, n2) | i <- [2..],
                         let list = take i pentaNbs,
                         let len = length list,
                         j <- [0..(len-2)],
                         let n1 = list!!(len-1),
                         let n2 = list!!j,  
                         isPenta (n1-n2), 
                         isPenta (n1+n2)]

pentaNbs :: [Int]
pentaNbs = [div (n*(3*n-1)) 2 | n <- [1..]]

isPenta :: Int -> Bool
isPenta nb = (isInt n1)
    where (n1, n2) = twoDegreeEqSol 3 (-1) (fromIntegral (- 2*nb))

-- a -> b -> c 
-- a^2*x + b*x + c -> (x1,x2)
twoDegreeEqSol :: Floating a => a -> a -> a -> (a, a)
twoDegreeEqSol a b c = (x1,x2)
    where d = b^2 -4*a*c
          x1 = (-b + sqrt d) / (2*a)
          x2 = (-b - sqrt d) / (2*a)

isInt :: RealFrac a => a -> Bool 
isInt nb = nb == fromInteger (round nb)