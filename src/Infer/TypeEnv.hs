module Infer.TypeEnv where

import Data.Coerce
import Data.Map (Map)
import Data.Map qualified as Map
import Infer.Syntax
import Prelude hiding (id)

newtype TypeEnv = TypeEnv (Map Identifier Type)

lookup :: Identifier -> TypeEnv -> Maybe Type
lookup = coerce (Map.lookup @_ @Type)

insert :: Identifier -> Type -> TypeEnv -> TypeEnv
-- insert id (TypeEnv env) = Map.insert
insert = coerce (Map.insert @_ @Type)
