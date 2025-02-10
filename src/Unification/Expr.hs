module Unification.Expr where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Map (Map, lookup)

newtype Identifier = Identifier Text
  deriving (Eq, Ord, Show)

data Expr
    = Constant
    | Variable Identifier
    | Let Identifier Expr Expr
    | Tuple Expr Expr
    | First Expr
    | Second Expr
    -- | If Expr Expr Expr
  deriving (Eq, Ord, Show)

data Type
    = Pair Type Type
    | Const
    | Var VarId
    | Err Text
  deriving (Eq, Ord, Show)

type VarId = Int

pairToTuple :: Type -> Maybe (Type, Type)
pairToTuple = \case
  Pair t1 t2 -> Just (t1, t2)
  _ -> Nothing
--   _ -> error "unexpected non-pair type"


