{-
Define the following functions:
    perimeter;
    area;
    isRound - returns whether a shape has a round side;
    is2D - returns whether a shape has two dimensions.

Formulas:
    Perimeter of a cylinder: 4 * r + 2 * h;
    Area of a cylinder: 2 * pi * r * h + 2 * pi * r * r.
-}

main :: IO()
main = do
    print $ perimeter (Circle 5) == 31.41592653589793
    print $ perimeter (Rectangle 2.5 4.5) == 14
    print $ perimeter (Rectangle 5.5 20.6) == 52.2
    print $ perimeter (Triangle 5.3 3.9 4.89) == 14.09
    print $ perimeter (Cylinder 2.5 10) == 30

    print $ area (Circle 5) -- == 78.53981633974483
    print $ area (Rectangle 2.5 4.5) -- == 11.25
    print $ area (Rectangle 5.5 20.6) -- == 113.30000000000001
    print $ area (Triangle 5.3 3.9 4.89) -- == 9.127927385194024
    print $ area (Cylinder 20 30) -- == 6283.185307179587  

    print $ isRound (Circle 5) == True
    print $ isRound (Rectangle 2.5 4.5) == False
    print $ isRound (Rectangle 5.5 20.6) == False
    print $ isRound (Triangle 5.3 3.9 4.89) == False
    print $ isRound (Cylinder 20 30) == True

    print $ is2D (Circle 5) == True
    print $ is2D (Rectangle 2.5 4.5) == True
    print $ is2D (Rectangle 5.5 20.6) == True
    print $ is2D (Triangle 5.3 3.9 4.89) == True
    print $ is2D (Cylinder 20 30) == False

    

data Shape a = Circle a | Rectangle a a | Triangle a a a | Cylinder a a
 deriving (Show, Eq, Ord, Read)

perimeter :: (Floating a) => (Shape a) -> a
perimeter (Circle r) = 2*pi*r 
perimeter (Rectangle x y) = 2*x + 2*y
perimeter (Triangle x y z) = x + y + z
perimeter (Cylinder r h) = 4 * r + 2 * h

isRound :: (Shape a) -> Bool
isRound (Circle _) = True
isRound (Rectangle _ _) = False
isRound (Triangle _ _ _) = False
isRound (Cylinder _ _) = True

area :: (Floating a) => (Shape a) -> a
area (Circle r) = pi*r*r
area (Rectangle x y) = x*y
area (Triangle x y z) = sqrt $ halfPer*(halfPer - x)*(halfPer - y)*(halfPer-z)
 where 
    halfPer = (x + y + z) / 2
area (Cylinder h r) = 2 * pi * r * h + 2 * pi * r * r

is2D :: (Shape a) -> Bool
is2D (Circle _) = True
is2D (Rectangle _ _) = True
is2D (Triangle _ _ _) = True
is2D (Cylinder _ _) = False
