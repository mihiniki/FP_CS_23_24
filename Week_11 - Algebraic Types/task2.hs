{-
Define a new polymorphic algebraic data type called `Shape`.

For it define the constructors:
- `Circle` with one argument representing the radius;
- `Rectangle` with two arguments representing the width and height;
- `Triangle`;
- `Cylinder` with two arguments for the radius of the base and height.

Use the typeclasses `Show`, `Eq`, `Ord`, `Read`.
Create a shape from every type and output it.
-}

main :: IO()
main = do
    print $ Circle 5 == Circle 10
    print $ Circle 5 < Circle 15
    print $ Rectangle 10 5
    print $ f "Cylinder 10 5"
    print $ g $ Cylinder 10 5

data Shape a = Circle a | Rectangle a a | Triangle a a a | Cylinder a a
 deriving (Show, Eq, Ord, Read)

g :: Shape a -> String
g (Circle r) = "This is a circle."
g (Rectangle x y) = "This is a rectange."
g (Triangle x y z) = "This is a triangle."
g (Cylinder r h) = "This is a cylinder."

f :: String -> Shape Double
f shape = read shape
